﻿//#define DBG
//#define DBGRES
//#define DBGDOMS

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System.Collections;
using System.Diagnostics;

namespace Dependency
{
    class Analysis
    {
        static private class CmdLineOptsNames
        {
            public const string semanticDep = "/semanticDependency";
            public const string stats = "/stats";
            public const string prune = "/prune";
            public const string both = "/both";
            public const string dataOnly = "/dataOnly";
            public const string taint = "/taint";
            public const string debug = "/break";
            public const string detStubs = "/detStubs";
            public const string refine = "/refine";
        }

        static public bool DataOnly = false;
        static public bool BothDependencies = false;
        static public bool Prune = false;
        static public bool PrintStats = false;
        static public bool DetStubs = false;
        static public bool Refine = false;
        public static bool SemanticDep = false;
        static public int StackBound = 3;
        
        static private List<Tuple<string, string, int>> changeLog = new List<Tuple<string, string, int>>();
        static private List<Tuple<string, string, int, List<string>>> taintLog = new List<Tuple<string, string, int, List<string>>>();
        static private List<Tuple<string, string, int, string>> dependenciesLog = new List<Tuple<string, string, int, string>>();
        static private string statsFile;

        static private List<Tuple<string, Procedure, Dependencies>> statsLog = new List<Tuple<string, Procedure, Dependencies>>();
        static private List<Tuple<string, string, int, int, int>> comparativeStats = new List<Tuple<string, string, int, int, int>>();

        static private Program program;
        

        static int Main(string[] args)
        {
            if (args.Length < 1)
            {
                Usage();
                return -1;
            }

            CommandLineOptions.Install(new CommandLineOptions());
            CommandLineOptions.Clo.RunningBoogieFromCommandLine = true;
            var boogieOptions = "/typeEncoding:m -timeLimit:20 -removeEmptyBlocks:0 /printModel:1 /printModelToFile:model.dmp /printInstrumented "; // /errorLimit:1";
            //IMPORTANT: need the next to avoid crash while creating prover
            CommandLineOptions.Clo.Parse(boogieOptions.Split(' '));
            //IMPORTANT: need these two to make use of UNSAT cores!!
            CommandLineOptions.Clo.UseUnsatCoreForContractInfer = true; //ROHIT
            CommandLineOptions.Clo.ContractInfer = true; //ROHIT

            #region Command line parsing 
            statsFile = args[0] + ".csv";

            string changeList = null;
            args.Where(x => x.StartsWith(CmdLineOptsNames.taint + ":"))
                .Iter(s => changeList = s.Split(':')[1]);

            DataOnly = args.Any(x => x == CmdLineOptsNames.dataOnly);
            Prune = args.Any(x => x == CmdLineOptsNames.prune);
            BothDependencies = args.Any(x => x == CmdLineOptsNames.both) && !DataOnly;
            DetStubs = args.Any(x => x == CmdLineOptsNames.detStubs);

            PrintStats = args.Any(x => x == CmdLineOptsNames.stats || x.StartsWith(CmdLineOptsNames.stats + ":"));
            args.Where(x => x.StartsWith(CmdLineOptsNames.stats + ":"))
                .Iter(s => statsFile = s.Split(':')[1]);

            SemanticDep = args.Any(x => x.Contains(CmdLineOptsNames.semanticDep));

            Refine = args.Any(x => x == CmdLineOptsNames.refine || x.StartsWith(CmdLineOptsNames.refine + ":"));
            args.Where(x => x.StartsWith(CmdLineOptsNames.refine + ":"))
                .Iter(s => StackBound = int.Parse(s.Split(':')[1]));

            if (args.Any(x => x.Contains(CmdLineOptsNames.debug)))
                Debugger.Launch();
            #endregion 

            var filename = args[0];
            if (!Utils.ParseProgram(filename, out program))
            {
                Usage();
                return -1;
            }
            ModSetCollector c = new ModSetCollector(); //TODO: fold it with ParseProgram
            c.DoModSetAnalysis(program);

            if (SemanticDep)
            {
                throw new NotImplementedException("This mode is deprecated. Use /refine:k instead");
                //var refined = RefineDependencyProgramCreator.CreateCheckDependencyProgram(filename, program);
                //var procDeps = RefineDependencyChecker.Run(refined);

                //foreach (var pd in procDeps)
                //{
                //    string origProcName = pd.Key.FindStringAttribute(RefineConsts.checkDepAttribute);
                //    var impl = program.Implementations().Single(i => i.Name == origProcName); 
                //    PopulateDependencyLog(impl, pd.Value, "Refined Dependencies");
                //    //ComputeStats(impl, pd.Value, depVisitor.procDependencies[impl.Proc], dataDepVisitor.procDependencies[impl.Proc]);
                //}
            }
            else 
            {
                if (changeList != null)
                    PopulateChangeLog(changeList);
                RunAnalysis(filename, program);
            }

            #region Display and Log
            var displayHtml = new Utils.DisplayHtmlHelper(changeLog, taintLog, dependenciesLog);
            displayHtml.GenerateHtmlOutput(filename + ".html");
            Console.WriteLine("Output generated in " + filename + ".html");

            if (PrintStats)
            {
                if (SemanticDep)
                    Utils.StatisticsHelper.GenerateCSVOutputForSemDep(comparativeStats, filename + ".csv");
                else
                {
                    var statsHelper = new Utils.StatisticsHelper(statsLog);
                    statsHelper.GenerateCSVOutput(statsFile);
                    Console.WriteLine("Statistics generated in " + statsFile);
                }
            }
            #endregion
            return 0;
        }

        private static void ComputeStats(Implementation impl, Dependencies refinedDeps, Dependencies dataControlDeps, Dependencies dataOnlyDeps)
        {

            var proc = impl.Proc;
            int refinedCount = 0, dataOnlyCount = 0, dataControlCount = 0;

            foreach (var rfd in refinedDeps)
            {
                if (rfd.Value.Contains(Utils.VariableUtils.NonDetVar)) //TODO: compare based on string // ignore vars which depend on *
                    continue;

                refinedCount += rfd.Value.Count;

                // find the current variable dependnecy set in the previously computed
                dataControlCount += dataControlDeps.Single(cdd => cdd.Key.Name == rfd.Key.Name).Value.Count;
                dataOnlyCount += dataOnlyDeps.Single(dod => dod.Key.Name == rfd.Key.Name).Value.Count;
            }

            string sourcefile = null;
            impl.Blocks.FirstOrDefault(b => b.Cmds.Count > 0 && (sourcefile = Utils.AttributeUtils.GetSourceFile(b.Cmds[0] as AssertCmd)) != null);
            comparativeStats.Add(new Tuple<string, string, int, int, int>(sourcefile, proc.Name, dataControlCount, dataOnlyCount, refinedCount));
        }

        // TODO: add a option for marking an entire function as tainted. maybe by adding a line like: funcname,-1 to the changelist
        public static void PopulateChangeLog(string filename)
        {
            if (filename == null)
                return;
            StreamReader reader = File.OpenText(filename);
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                string[] items = line.Split(',');
                changeLog.Add(Tuple.Create(filename, items[0], int.Parse(items[1])));
            }
        }

        static public void PopulateDependencyLog(Implementation impl, Dependencies deps, string which)
        {
            if (impl == null) return; //if this is a stub
            var proc = impl.Proc;
            string sourcefile = Utils.AttributeUtils.GetImplSourceFile(impl);
            var sourceLines = impl.Blocks.Where(b => b.Cmds.Count > 0 && b.Cmds[0] is AssertCmd).Select(b => Utils.AttributeUtils.GetSourceLine((AssertCmd)b.Cmds[0]));
            if (sourceLines.Count() == 0)
                return;
            int lastSourceLine = sourceLines.Max();

            string depStr = "<b> " + which + " for " + proc.Name + "(): (Size = " + deps.Sum(d => d.Value.Count) + ")</b> " + deps.ToString();

            dependenciesLog.Add(new Tuple<string, string, int, string>(sourcefile, proc.Name, lastSourceLine, depStr));
        }

        static public void PopulateTaintLog(Implementation node, WorkList<TaintSet> twl)
        {
            Dictionary<int, TaintSet> lines = new Dictionary<int, TaintSet>();
            Dictionary<int, Tuple<string, string, int, List<string>>> tuples = new Dictionary<int, Tuple<string, string, int, List<string>>>();
            string sourcefile = Utils.AttributeUtils.GetImplSourceFile(node);
            foreach (var pair in twl.stateSpace)
            {
                if (!(pair.Key is GotoCmd) || pair.Value.Count == 0)
                    continue;
                Block block = twl.cmdBlocks[(GotoCmd)pair.Key];
                if (block.Cmds.Count > 0 && block.Cmds[0] is AssertCmd)
                {
                    int sourceline = Utils.AttributeUtils.GetSourceLine((AssertCmd)block.Cmds[0]);
                    if (sourceline >= 0)
                    {
                        var taintSet = pair.Value;
                        // multiple boogie lines may corrsepond to a single source line
                        // so the taint there would be the join of taint over all boogie lines
                        if (lines.ContainsKey(sourceline))
                            taintSet.JoinWith(lines[sourceline]);
                        lines[sourceline] = taintSet;
                        List<string> varNames = taintSet.Select(x => x.Name).ToList<string>();
                        tuples[sourceline] = new Tuple<string, string, int, List<string>>(sourcefile, node.Proc.Name, sourceline, varNames);
                    }
                }
            }

            foreach (var t in tuples.OrderBy(x => x.Key))
                taintLog.Add(t.Value);
        }

        public static void PopulateStatsLog(Implementation impl, Dependencies dependencies)
        {
            statsLog.Add(new Tuple<string, Procedure, Dependencies>(Utils.AttributeUtils.GetImplSourceFile(impl), impl.Proc, dependencies));
        }

        private static void RunAnalysis(string filename, Program program, bool taintAll = false)
        {
            DependencyVisitor dataDepVisitor = new DependencyVisitor(filename, program, true, DetStubs);
            if (Refine || BothDependencies)
            {
                dataDepVisitor.Visit(program);
                dataDepVisitor.Results(Prune, PrintStats);
            }
            dataDepVisitor.worklist.stateSpace.Clear(); // helping the garbage collector
            var dataDeps = dataDepVisitor.ProcDependencies;
            dataDepVisitor = null;
            GC.Collect();

            var allDepVisitor = new DependencyVisitor(filename, program, DataOnly, DetStubs);
            allDepVisitor.Visit(program);
            allDepVisitor.Results(Prune, PrintStats);
            allDepVisitor.worklist.stateSpace.Clear(); // helping the garbage collector
            var allDeps = allDepVisitor.ProcDependencies;
            allDepVisitor = null;
            GC.Collect();

            // Control+Data dependencies must contain the Data dependencies
            Debug.Assert(dataDeps.All(pd => { 
                var proc = pd.Key; var ddeps = pd.Value; var adeps = allDeps[proc];
                return ddeps.Keys.All(v => adeps.Keys.Contains(v) && adeps[v].IsSupersetOf(ddeps[v]));          
            }));

            if (Refine)
            {
                // refined must have pruned dependencies
                Utils.DependenciesUtils.PruneProcDependencies(program, dataDeps);
                Utils.DependenciesUtils.PruneProcDependencies(program, allDeps);

                var refineDepsWL = new RefineDependencyWL(filename, program, dataDeps, allDeps, StackBound);
                refineDepsWL.RunFixedPoint();

                // print
                refineDepsWL.currDependencies.Iter(pd => PopulateDependencyLog(program.Implementations().SingleOrDefault(i => i.Proc.Name == pd.Key.Name), pd.Value, "Refined"));
            }

        }

        private static void Usage()
        {
            int length = 25;
            string execName = System.Diagnostics.Process.GetCurrentProcess().MainModule.ModuleName;
            Console.WriteLine("Lightweight inter-procedural dependency\\taint analysis for change impact");
            Console.WriteLine("Usage: " + execName + " <filename.bpl> [flags]");
            Console.WriteLine((CmdLineOptsNames.taint + ":changelist.txt").PadRight(length,' ') + " - produce taint for all lined marked as changed in changelist.txt");
            Console.WriteLine(CmdLineOptsNames.dataOnly.PadRight(length,' ') + " - compute data dependnecies\\taint only (no control)");
            Console.WriteLine(CmdLineOptsNames.both.PadRight(length,' ') + " - compute both data & control dependencies for showing in HTML");
            Console.WriteLine(CmdLineOptsNames.prune.PadRight(length,' ') + " - show only in\\out\\global dependencies (no locals)");
            Console.WriteLine((CmdLineOptsNames.stats + "[:statsfile.csv]").PadRight(length,' ') +  " - print dependecies statistics in CSV format [to a specified file]");
            Console.WriteLine(CmdLineOptsNames.semanticDep.PadRight(length,' ') + " - print dependecies statistics in CSV format [to a specified file]");
            Console.WriteLine(CmdLineOptsNames.detStubs.PadRight(length, ' ') + " - (unsoundly) assume stub functions to depend only on input (and not be undeterministic)");
            Console.WriteLine((CmdLineOptsNames.refine + "[:<int>]").PadRight(length, ' ') + " - refine result [with inlining up to stack bound]");
        }

    }
}
