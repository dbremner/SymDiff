type {:extern} name;
type {:extern} byte;
function {:extern}  OneByteToInt(byte) returns (int);
function {:extern}  TwoBytesToInt(byte, byte) returns (int);
function {:extern}  FourBytesToInt(byte, byte, byte, byte) returns (int);
axiom(forall b0:byte, c0:byte :: {OneByteToInt(b0), OneByteToInt(c0)} OneByteToInt(b0) == OneByteToInt(c0) ==> b0 == c0);
axiom(forall b0:byte, b1: byte, c0:byte, c1:byte :: {TwoBytesToInt(b0, b1), TwoBytesToInt(c0, c1)} TwoBytesToInt(b0, b1) == TwoBytesToInt(c0, c1) ==> b0 == c0 && b1 == c1);
axiom(forall b0:byte, b1: byte, b2:byte, b3:byte, c0:byte, c1:byte, c2:byte, c3:byte :: {FourBytesToInt(b0, b1, b2, b3), FourBytesToInt(c0, c1, c2, c3)} FourBytesToInt(b0, b1, b2, b3) == FourBytesToInt(c0, c1, c2, c3) ==> b0 == c0 && b1 == c1 && b2 == c2 && b3 == c3);

// Memory model

// Mutable
var {:extern} Mem: [name][int]int;
var {:extern} alloc:int;

// Immutable
function {:extern}  Field(int) returns (name);
function {:extern}  Base(int) returns (int);
//axiom(forall x: int :: {Base(x)} Base(x) <= x);
axiom(forall x: int :: {Base(x)} INT_LEQ(Base(x), x));

function {:extern} DT(int) returns(name);
var {:extern} Mem_T.A12CHAR : [int]int;
var {:extern} Mem_T.A13CHAR : [int]int;
var {:extern} Mem_T.A15CHAR : [int]int;
var {:extern} Mem_T.A17CHAR : [int]int;
var {:extern} Mem_T.A18CHAR : [int]int;
var {:extern} Mem_T.A1CHAR : [int]int;
var {:extern} Mem_T.A25CHAR : [int]int;
var {:extern} Mem_T.A28CHAR : [int]int;
var {:extern} Mem_T.A2CHAR : [int]int;
var {:extern} Mem_T.A37CHAR : [int]int;
var {:extern} Mem_T.A3CHAR : [int]int;
var {:extern} Mem_T.A4CHAR : [int]int;
var {:extern} Mem_T.A6CHAR : [int]int;
var {:extern} Mem_T.A7CHAR : [int]int;
var {:extern} Mem_T.A81CHAR : [int]int;
var {:extern} Mem_T.A8CHAR : [int]int;
var {:extern} Mem_T.A9CHAR : [int]int;
var {:extern} Mem_T.CHAR : [int]int;
var {:extern} Mem_T.INT4 : [int]int;
var {:extern} Mem_T.PCHAR : [int]int;
var {:extern} Mem_T.PVOID : [int]int;
var {:extern} Mem_T.P_iobuf : [int]int;
var {:extern} Mem_T.UINT4 : [int]int;
function {:extern} Match(a:int, t:name) returns (bool);
function {:extern} MatchBase(b:int, a:int, t:name) returns (bool);
function {:extern} HasType(v:int, t:name) returns (bool);

function {:extern} T.Ptr(t:name) returns (name);
axiom(forall a:int, t:name :: {Match(a, T.Ptr(t))} Match(a, T.Ptr(t)) <==> Field(a) == T.Ptr(t));   //marker for a 
axiom(forall b:int, a:int, t:name :: {MatchBase(b, a, T.Ptr(t))} MatchBase(b, a, T.Ptr(t)) <==> Base(a) == b); // marker for b 
axiom(forall v:int, t:name :: {HasType(v, T.Ptr(t))} HasType(v, T.Ptr(t)) <==> (v == 0 || (INT_GT(v, 0) && Match(v, t) && MatchBase(Base(v), v, t))));

// Field declarations without typesafety

// Type declarations for type safety 

const {:extern} unique T.A12CHAR:name;
const {:extern} unique T.A13CHAR:name;
const {:extern} unique T.A15CHAR:name;
const {:extern} unique T.A17CHAR:name;
const {:extern} unique T.A18CHAR:name;
const {:extern} unique T.A1CHAR:name;
const {:extern} unique T.A25CHAR:name;
const {:extern} unique T.A28CHAR:name;
const {:extern} unique T.A2CHAR:name;
const {:extern} unique T.A37CHAR:name;
const {:extern} unique T.A3CHAR:name;
const {:extern} unique T.A4CHAR:name;
const {:extern} unique T.A6CHAR:name;
const {:extern} unique T.A7CHAR:name;
const {:extern} unique T.A81CHAR:name;
const {:extern} unique T.A8CHAR:name;
const {:extern} unique T.A9CHAR:name;
const {:extern} unique T.CHAR:name;
const {:extern} unique T.INT4:name;
const {:extern} unique T.PA12CHAR:name;
const {:extern} unique T.PA13CHAR:name;
const {:extern} unique T.PA15CHAR:name;
const {:extern} unique T.PA17CHAR:name;
const {:extern} unique T.PA18CHAR:name;
const {:extern} unique T.PA1CHAR:name;
const {:extern} unique T.PA25CHAR:name;
const {:extern} unique T.PA28CHAR:name;
const {:extern} unique T.PA2CHAR:name;
const {:extern} unique T.PA37CHAR:name;
const {:extern} unique T.PA3CHAR:name;
const {:extern} unique T.PA4CHAR:name;
const {:extern} unique T.PA6CHAR:name;
const {:extern} unique T.PA7CHAR:name;
const {:extern} unique T.PA81CHAR:name;
const {:extern} unique T.PA8CHAR:name;
const {:extern} unique T.PA9CHAR:name;
const {:extern} unique T.PCHAR:name;
const {:extern} unique T.PINT4:name;
const {:extern} unique T.PPCHAR:name;
const {:extern} unique T.PPPCHAR:name;
const {:extern} unique T.PPP_iobuf:name;
const {:extern} unique T.PP_iobuf:name;
const {:extern} unique T.PVOID:name;
const {:extern} unique T.P_iobuf:name;
const {:extern} unique T.UINT4:name;
const {:extern} unique T.VOID:name;
const {:extern} unique T._iobuf:name;

// Field offset definitions


///////////////////////////////////
// will be replaced by:
// "//" when using bv mode
// ""   when using int mode
// main reason is to avoid using bv for constants
// or avoid translating lines that are complex or unsound
//////////////////////////////////

////////////////////////////////////////////
/////// function {:extern} s for int type /////////////
// Theorem prover does not see INT_ADD etc.
////////////////////////////////////////////
function {:extern}   INT_EQ(x:int, y:int)  returns  (bool)   {x == y}
function {:extern}   INT_NEQ(x:int, y:int)  returns  (bool)   {x != y}

function {:extern}   INT_ADD(x:int, y:int)  returns  (int)   {x + y}
function {:extern}   INT_SUB(x:int, y:int)  returns  (int)   {x - y}
function {:extern}   INT_MULT(x:int, y:int) returns  (int)   {x * y}
//function {:extern}   INT_DIV(x:int, y:int)  returns  (int)   {x / y}
function {:extern}   INT_LT(x:int, y:int)   returns  (bool)  {x < y}
function {:extern}   INT_ULT(x:int, y:int)   returns  (bool)  {x < y}
function {:extern}   INT_LEQ(x:int, y:int)  returns  (bool)  {x <= y}
function {:extern}   INT_ULEQ(x:int, y:int)  returns  (bool)  {x <= y}
function {:extern}   INT_GT(x:int, y:int)   returns  (bool)  {x > y}
function {:extern}   INT_UGT(x:int, y:int)   returns  (bool)  {x > y}
function {:extern}   INT_GEQ(x:int, y:int)  returns  (bool)  {x >= y}
function {:extern}   INT_UGEQ(x:int, y:int)  returns  (bool)  {x >= y}


////////////////////////////////////////////
/////// function {:extern} s for bv32 type /////////////
// Theorem prover does not see INT_ADD etc.
// we are treating unsigned ops now
////////////////////////////////////////////
function {:extern}   BV32_EQ(x:bv32, y:bv32)  returns  (bool)   {x == y}
function {:extern}   BV32_NEQ(x:bv32, y:bv32)  returns  (bool)  {x != y}

function {:extern}  {:bvbuiltin "bvadd"}  BV32_ADD(x:bv32, y:bv32)  returns  (bv32);
function {:extern}  {:bvbuiltin "bvsub"}  BV32_SUB(x:bv32, y:bv32)  returns  (bv32);
function {:extern}  {:bvbuiltin "bvmul"}  BV32_MULT(x:bv32, y:bv32) returns  (bv32);
function {:extern}  {:bvbuiltin "bvudiv"} BV32_DIV(x:bv32, y:bv32)  returns  (bv32);
function {:extern}  {:bvbuiltin "bvult"}  BV32_ULT(x:bv32, y:bv32)   returns  (bool);
function {:extern}  {:bvbuiltin "bvslt"}  BV32_LT(x:bv32, y:bv32)   returns  (bool);
function {:extern}  {:bvbuiltin "bvule"}  BV32_ULEQ(x:bv32, y:bv32)  returns  (bool);
function {:extern}  {:bvbuiltin "bvsle"}  BV32_LEQ(x:bv32, y:bv32)  returns  (bool);
function {:extern}  {:bvbuiltin "bvugt"}  BV32_UGT(x:bv32, y:bv32)   returns  (bool);
function {:extern}  {:bvbuiltin "bvsgt"}  BV32_GT(x:bv32, y:bv32)   returns  (bool);
function {:extern}  {:bvbuiltin "bvuge"}  BV32_UGEQ(x:bv32, y:bv32)  returns  (bool);
function {:extern}  {:bvbuiltin "bvsge"}  BV32_GEQ(x:bv32, y:bv32)  returns  (bool);

//what about bitwise ops {BIT_AND, BIT_OR, BIT_NOT, ..}
//only enabled with bv theory
// function {:extern}  {:bvbuiltin "bvand"} BIT_BAND(a:int, b:int) returns (x:int);
// function {:extern}  {:bvbuiltin "bvor"}  BIT_BOR(a:int, b:int) returns (x:int);
// function {:extern}  {:bvbuiltin "bvxor"} BIT_BXOR(a:int, b:int) returns (x:int);
// function {:extern}  {:bvbuiltin "bvnot"} BIT_BNOT(a:int) returns (x:int);

//////////////////////////////////
// Generic C Arithmetic operations
/////////////////////////////////

//Is this sound for bv32?
function {:extern}  MINUS_BOTH_PTR_OR_BOTH_INT(a:int, b:int, size:int) returns (int); 
 axiom  (forall a:int, b:int, size:int :: {MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size)} 
//size * MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size) <= a - b && a - b < size * (MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size) + 1));
 INT_LEQ( INT_MULT(size, MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size)),  INT_SUB(a, b)) && INT_LT( INT_SUB(a, b),  INT_MULT(size, (INT_ADD(MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size), 1)))));

//we just keep this axiom for size = 1
axiom  (forall a:int, b:int, size:int :: {MINUS_BOTH_PTR_OR_BOTH_INT(a,b,size)}  MINUS_BOTH_PTR_OR_BOTH_INT(a,b,1) == INT_SUB(a,b));


function {:extern}  MINUS_LEFT_PTR(a:int, a_size:int, b:int) returns (int);
//axiom(forall a:int, a_size:int, b:int :: {MINUS_LEFT_PTR(a,a_size,b)} MINUS_LEFT_PTR(a,a_size,b) == a - a_size * b);
axiom(forall a:int, a_size:int, b:int :: {MINUS_LEFT_PTR(a,a_size,b)} MINUS_LEFT_PTR(a,a_size,b) == INT_SUB(a, INT_MULT(a_size, b)));


function {:extern}  PLUS(a:int, a_size:int, b:int) returns (int);
//axiom (forall a:int, a_size:int, b:int :: {PLUS(a,a_size,b)} PLUS(a,a_size,b) == a + a_size * b);
axiom (forall a:int, a_size:int, b:int :: {PLUS(a,a_size,b)} PLUS(a,a_size,b) == INT_ADD(a, INT_MULT(a_size, b)));
 
function {:extern}  MULT(a:int, b:int) returns (int); // a*b
//axiom(forall a:int, b:int :: {MULT(a,b)} MULT(a,b) == a * b);
axiom(forall a:int, b:int :: {MULT(a,b)} MULT(a,b) == INT_MULT(a, b));
 
function {:extern}  DIV(a:int, b:int) returns (int); // a/b	

function {:extern}  BINARY_UNKNOWN(a:int, b:int) returns (int); //unknown op, should fix it.


// Not sure if these axioms hold for BV too, just commet them for BV 	      
 axiom(forall a:int, b:int :: {DIV(a,b)}
 a >= 0 && b > 0 ==> b * DIV(a,b) <= a && a < b * (DIV(a,b) + 1)
 ); 
 
 axiom(forall a:int, b:int :: {DIV(a,b)}
 a >= 0 && b < 0 ==> b * DIV(a,b) <= a && a < b * (DIV(a,b) - 1)
 ); 
 
 axiom(forall a:int, b:int :: {DIV(a,b)}
 a < 0 && b > 0 ==> b * DIV(a,b) >= a && a > b * (DIV(a,b) - 1)
 ); 
 
 axiom(forall a:int, b:int :: {DIV(a,b)}
 a < 0 && b < 0 ==> b * DIV(a,b) >= a && a > b * (DIV(a,b) + 1)
 ); 
 

//uninterpreted binary op
function {:extern}  BINARY_BOTH_INT(a:int, b:int) returns (int);


//////////////////////////////////////////
//// Bitwise ops (uninterpreted, used with int)
//////////////////////////////////////////
function {:extern}  POW2(a:int) returns (bool);
axiom POW2(1);
axiom POW2(2);
axiom POW2(4);
axiom POW2(8);
axiom POW2(16);
axiom POW2(32);
axiom POW2(64);
axiom POW2(128);
axiom POW2(256);
axiom POW2(512);
axiom POW2(1024);
axiom POW2(2048);
axiom POW2(4096);
axiom POW2(8192);
axiom POW2(16384);
axiom POW2(32768);
axiom POW2(65536);
axiom POW2(131072);
axiom POW2(262144);
axiom POW2(524288);
axiom POW2(1048576);
axiom POW2(2097152);
axiom POW2(4194304);
axiom POW2(8388608);
axiom POW2(16777216);
axiom POW2(33554432);

 function {:extern}  BIT_BAND(a:int, b:int) returns (x:int);
 axiom(forall a:int, b:int :: {BIT_BAND(a,b)} a == b ==> BIT_BAND(a,b) == a);
 axiom(forall a:int, b:int :: {BIT_BAND(a,b)} POW2(a) && POW2(b) && a != b ==> BIT_BAND(a,b) == 0);
 axiom(forall a:int, b:int :: {BIT_BAND(a,b)} a == 0 || b == 0 ==> BIT_BAND(a,b) == 0);

 function {:extern}  BIT_BOR(a:int, b:int) returns (x:int);
 function {:extern}  BIT_BXOR(a:int, b:int) returns (x:int);
 function {:extern}  BIT_BNOT(a:int) returns (int);


function {:extern}  choose(a:bool, b:int, c:int) returns (x:int);
axiom(forall a:bool, b:int, c:int :: {choose(a,b,c)} a ==> choose(a,b,c) == b);
axiom(forall a:bool, b:int, c:int :: {choose(a,b,c)} !a ==> choose(a,b,c) == c);

function {:extern}  LIFT(a:bool) returns (int);
axiom(forall a:bool :: {LIFT(a)} a <==> LIFT(a) != 0);

function {:extern}  PTR_NOT(a:int) returns (int);
axiom(forall a:int :: {PTR_NOT(a)} a == 0 ==> PTR_NOT(a) != 0);
axiom(forall a:int :: {PTR_NOT(a)} a != 0 ==> PTR_NOT(a) == 0);

function {:extern}  NULL_CHECK(a:int) returns (int);
axiom(forall a:int :: {NULL_CHECK(a)} a == 0 ==> NULL_CHECK(a) != 0);
axiom(forall a:int :: {NULL_CHECK(a)} a != 0 ==> NULL_CHECK(a) == 0);

procedure {:extern}  havoc_assert(i:int);
requires (i != 0);

procedure {:extern}  havoc_assume(i:int);
ensures (i != 0);

procedure {:extern}  __HAVOC_free(a:int);

function {:extern}  NewAlloc(x:int, y:int) returns (z:int);


procedure {:extern}  __HAVOC_malloc(obj_size:int) returns (new:int);
free requires INT_GEQ(obj_size, 0); //requires obj_size >= 0;
modifies alloc;
ensures new == old(alloc);
ensures INT_GT(alloc, INT_ADD(new, obj_size)); //ensures alloc > new + obj_size;
ensures Base(new) == new;

//deterministic HAVOC_malloc 
procedure {:extern}  __HAVOC_det_malloc(obj_size:int) returns (new:int);
free requires INT_GEQ(obj_size, 0); //requires obj_size >= 0;
modifies alloc;
ensures new == old(alloc);
ensures INT_GT(alloc, INT_ADD(new, obj_size)); //ensures alloc > new + obj_size;
ensures Base(new) == new;
ensures alloc == NewAlloc(old(alloc), obj_size);


//////////////////
// Memset starts
//////////////////
//A quick/dirty version of memset 
//M_T := memset(M_T, p, c, s, n)

// we make a copy for each concrete size
 procedure {:extern}  __HAVOC_memset_split_1(A:[int]int, p:int, c:int, n:int) returns (ret:[int]int);
 ensures (Subset(Empty(), Array(p,1,n)) && (forall i:int:: {ret[i]}  Array(p,1,n)[i] || ret[i] == A[i]));
 ensures (Subset(Empty(), Array(p,1,n)) && (forall i:int:: {ret[i]}  Array(p,1,n)[i] ==> ret[i] == c));


 procedure {:extern}  __HAVOC_memset_split_2(A:[int]int, p:int, c:int, n:int) returns (ret:[int]int);
 ensures (Subset(Empty(), Array(p,2,n)) && (forall i:int:: {ret[i]}  Array(p,2,n)[i] || ret[i] == A[i]));
 ensures (Subset(Empty(), Array(p,2,n)) && (forall i:int:: {ret[i]}  Array(p,2,n)[i] ==> ret[i] == c));



 procedure {:extern}  __HAVOC_memset_split_4(A:[int]int, p:int, c:int, n:int) returns (ret:[int]int);
 ensures (Subset(Empty(), Array(p,4,n)) && (forall i:int:: {ret[i]}  Array(p,4,n)[i] || ret[i] == A[i]));
 ensures (Subset(Empty(), Array(p,4,n)) && (forall i:int:: {ret[i]}  Array(p,4,n)[i] ==> ret[i] == c));

//////////////////
// Memset ends

//////////////////

//a common nondet for all instrinsic returns
procedure {:extern}  nondet_intrinsic() returns (x:int);

procedure {:extern}  nondet_choice() returns (x:int);

//----deterministic (but arbitrary) choice
var {:extern} detChoiceCnt:int;
function {:extern}  DetChoiceFunc(a:int) returns (x:int);

procedure {:extern}  det_choice() returns (x:int);
//ensures detChoiceCnt == old(detChoiceCnt) + 1;
ensures detChoiceCnt == INT_ADD(old(detChoiceCnt),1);
ensures x == DetChoiceFunc(old(detChoiceCnt));
modifies detChoiceCnt;

procedure {:extern}  _strdup(str:int) returns (new:int);

procedure {:extern}  _xstrcasecmp(a0:int, a1:int) returns (ret:int);

procedure {:extern}  _xstrcmp(a0:int, a1:int) returns (ret:int);


/*
//bv function {:extern} s
function {:extern}  bv8ToInt(bv8)   returns (int);
function {:extern}  bv16ToInt(bv16) returns (int);
function {:extern}  bv32ToInt(bv32) returns (int);
function {:extern}  bv64ToInt(bv64) returns (int);

function {:extern}  intToBv8(int)    returns (bv8);
function {:extern}  intToBv16(int)   returns (bv16);
function {:extern}  intToBv32(int)   returns (bv32);
function {:extern}  intToBv64(int)   returns (bv64);

axiom(forall a:int ::  {intToBv8(a)} bv8ToInt(intToBv8(a)) == a);
axiom(forall a:int ::  {intToBv16(a)} bv16ToInt(intToBv16(a)) == a);
axiom(forall a:int ::  {intToBv32(a)} bv32ToInt(intToBv32(a)) == a);
axiom(forall a:int ::  {intToBv64(a)} bv64ToInt(intToBv64(a)) == a);

axiom(forall b:bv8 ::  {bv8ToInt(b)} intToBv8(bv8ToInt(b)) == b);
axiom(forall b:bv16 ::  {bv16ToInt(b)} intToBv16(bv16ToInt(b)) == b);
axiom(forall b:bv32 ::  {bv32ToInt(b)} intToBv32(bv32ToInt(b)) == b);
axiom(forall b:bv64 ::  {bv64ToInt(b)} intToBv64(bv64ToInt(b)) == b);
*/




function {:extern}  Equal([int]bool, [int]bool) returns (bool);
function {:extern}  Subset([int]bool, [int]bool) returns (bool);
function {:extern}  Disjoint([int]bool, [int]bool) returns (bool);

function {:extern}  Empty() returns ([int]bool);
function {:extern}  SetTrue() returns ([int]bool);
function {:extern}  Singleton(int) returns ([int]bool);
function {:extern}  Reachable([int,int]bool, int) returns ([int]bool);
function {:extern}  Union([int]bool, [int]bool) returns ([int]bool);
function {:extern}  Intersection([int]bool, [int]bool) returns ([int]bool);
function {:extern}  Difference([int]bool, [int]bool) returns ([int]bool);
function {:extern}  Dereference([int]bool, [int]int) returns ([int]bool);
function {:extern}  Inverse(f:[int]int, x:int) returns ([int]bool);

function {:extern}  AtLeast(int, int) returns ([int]bool);
function {:extern}  Rep(int, int) returns (int);
//axiom(forall n:int, x:int, y:int :: {AtLeast(n,x)[y]} AtLeast(n,x)[y] ==> x <= y && Rep(n,x) == Rep(n,y));
axiom(forall n:int, x:int, y:int :: {AtLeast(n,x)[y]} AtLeast(n,x)[y] ==> INT_LEQ(x, y) && Rep(n,x) == Rep(n,y));
//axiom(forall n:int, x:int, y:int :: {AtLeast(n,x),Rep(n,x),Rep(n,y)} x <= y && Rep(n,x) == Rep(n,y) ==> AtLeast(n,x)[y]);
axiom(forall n:int, x:int, y:int :: {AtLeast(n,x),Rep(n,x),Rep(n,y)} INT_LEQ(x, y) && Rep(n,x) == Rep(n,y) ==> AtLeast(n,x)[y]);
axiom(forall n:int, x:int :: {AtLeast(n,x)} AtLeast(n,x)[x]);
axiom(forall n:int, x:int, z:int :: {PLUS(x,n,z)} Rep(n,x) == Rep(n,PLUS(x,n,z)));
//axiom(forall n:int, x:int :: {Rep(n,x)} (exists k:int :: Rep(n,x) - x  == n*k));
axiom(forall n:int, x:int :: {Rep(n,x)} (exists k:int :: INT_SUB(Rep(n,x),x)  == INT_MULT(n,k)));

/*
function {:extern}  AtLeast(int, int) returns ([int]bool);
function {:extern}  ModEqual(int, int, int) returns (bool);
axiom(forall n:int, x:int :: ModEqual(n,x,x));
axiom(forall n:int, x:int, y:int :: {ModEqual(n,x,y)} ModEqual(n,x,y) ==> ModEqual(n,y,x));
axiom(forall n:int, x:int, y:int, z:int :: {ModEqual(n,x,y), ModEqual(n,y,z)} ModEqual(n,x,y) && ModEqual(n,y,z) ==> ModEqual(n,x,z));
axiom(forall n:int, x:int, z:int :: {PLUS(x,n,z)} ModEqual(n,x,PLUS(x,n,z)));
axiom(forall n:int, x:int, y:int :: {ModEqual(n,x,y)} ModEqual(n,x,y) ==> (exists k:int :: x - y == n*k));
axiom(forall x:int, n:int, y:int :: {AtLeast(n,x)[y]}{ModEqual(n,x,y)} AtLeast(n,x)[y] <==> x <= y && ModEqual(n,x,y));
axiom(forall x:int, n:int :: {AtLeast(n,x)} AtLeast(n,x)[x]);
*/

function {:extern}  Array(int, int, int) returns ([int]bool);
axiom(forall x:int, n:int, z:int :: {Array(x,n,z)} INT_LEQ(z,0) ==> Equal(Array(x,n,z), Empty()));
axiom(forall x:int, n:int, z:int :: {Array(x,n,z)} INT_GT(z, 0) ==> Equal(Array(x,n,z), Difference(AtLeast(n,x),AtLeast(n,PLUS(x,n,z)))));


axiom(forall x:int :: !Empty()[x]);

axiom(forall x:int :: SetTrue()[x]);

axiom(forall x:int, y:int :: {Singleton(y)[x]} Singleton(y)[x] <==> x == y);
axiom(forall y:int :: {Singleton(y)} Singleton(y)[y]);

axiom(forall x:int, S:[int]bool, T:[int]bool :: {Union(S,T)[x]}{Union(S,T),S[x]}{Union(S,T),T[x]} Union(S,T)[x] <==> S[x] || T[x]);
axiom(forall x:int, S:[int]bool, T:[int]bool :: {Intersection(S,T)[x]}{Intersection(S,T),S[x]}{Intersection(S,T),T[x]} Intersection(S,T)[x] <==>  S[x] && T[x]);
axiom(forall x:int, S:[int]bool, T:[int]bool :: {Difference(S,T)[x]}{Difference(S,T),S[x]}{Difference(S,T),T[x]} Difference(S,T)[x] <==> S[x] && !T[x]);

axiom(forall S:[int]bool, T:[int]bool :: {Equal(S,T)} Equal(S,T) <==> Subset(S,T) && Subset(T,S));
axiom(forall x:int, S:[int]bool, T:[int]bool :: {S[x],Subset(S,T)}{T[x],Subset(S,T)} S[x] && Subset(S,T) ==> T[x]);
axiom(forall S:[int]bool, T:[int]bool :: {Subset(S,T)} Subset(S,T) || (exists x:int :: S[x] && !T[x]));
axiom(forall x:int, S:[int]bool, T:[int]bool :: {S[x],Disjoint(S,T)}{T[x],Disjoint(S,T)} !(S[x] && Disjoint(S,T) && T[x]));
axiom(forall S:[int]bool, T:[int]bool :: {Disjoint(S,T)} Disjoint(S,T) || (exists x:int :: S[x] && T[x]));

axiom(forall f:[int]int, x:int :: {Inverse(f,f[x])} Inverse(f,f[x])[x]);
axiom(forall f:[int]int, x:int, y:int :: {Inverse(f,y), f[x]} Inverse(f,y)[x] ==> f[x] == y);
axiom(forall f:[int]int, x:int, y:int :: {Inverse(f[x := y],y)} Equal(Inverse(f[x := y],y), Union(Inverse(f,y), Singleton(x))));
axiom(forall f:[int]int, x:int, y:int, z:int :: {Inverse(f[x := y],z)} y == z || Equal(Inverse(f[x := y],z), Difference(Inverse(f,z), Singleton(x))));


axiom(forall x:int, S:[int]bool, M:[int]int :: {Dereference(S,M)[x]} Dereference(S,M)[x] ==> (exists y:int :: x == M[y] && S[y]));
axiom(forall x:int, S:[int]bool, M:[int]int :: {M[x], S[x], Dereference(S,M)} S[x] ==> Dereference(S,M)[M[x]]);
axiom(forall x:int, y:int, S:[int]bool, M:[int]int :: {Dereference(S,M[x := y])} !S[x] ==> Equal(Dereference(S,M[x := y]), Dereference(S,M)));
axiom(forall x:int, y:int, S:[int]bool, M:[int]int :: {Dereference(S,M[x := y])} 
     S[x] &&  Equal(Intersection(Inverse(M,M[x]), S), Singleton(x)) ==> Equal(Dereference(S,M[x := y]), Union(Difference(Dereference(S,M), Singleton(M[x])), Singleton(y))));
axiom(forall x:int, y:int, S:[int]bool, M:[int]int :: {Dereference(S,M[x := y])} 
     S[x] && !Equal(Intersection(Inverse(M,M[x]), S), Singleton(x)) ==> Equal(Dereference(S,M[x := y]), Union(Dereference(S,M), Singleton(y))));

function {:extern}  Unified([name][int]int) returns ([int]int);
axiom(forall M:[name][int]int, x:int :: {Unified(M)[x]} Unified(M)[x] == M[Field(x)][x]);
axiom(forall M:[name][int]int, x:int, y:int :: {Unified(M[Field(x) := M[Field(x)][x := y]])} Unified(M[Field(x) := M[Field(x)][x := y]]) == Unified(M)[x := y]);
const {:extern} unique buffer : int;
axiom(buffer != 0);
axiom(Base(buffer) == buffer);
var {:extern} const_80 : int;
//CToBplModel constants
function  {:extern} value_is(c:int , e:int) returns (r:bool);
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 80} unique __ctobpl_const_1:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 80} unique __ctobpl_const_2:int;
const {:extern} {:model_const "result.getc"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 80} unique __ctobpl_const_4:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 80} unique __ctobpl_const_3:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 81} unique __ctobpl_const_5:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 134} unique __ctobpl_const_253:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 43} unique __ctobpl_const_233:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 134} unique __ctobpl_const_254:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 64} unique __ctobpl_const_240:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 134} unique __ctobpl_const_255:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 63} unique __ctobpl_const_239:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 64} unique __ctobpl_const_241:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 45} unique __ctobpl_const_236:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 42} unique __ctobpl_const_229:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 66} unique __ctobpl_const_246:int;
const {:extern} {:model_const "result.is_eof_token"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 40} unique __ctobpl_const_228:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 43} unique __ctobpl_const_232:int;
const {:extern} {:model_const "result.get_token"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 43} unique __ctobpl_const_234:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 64} unique __ctobpl_const_244:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 94} unique __ctobpl_const_350:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 40} unique __ctobpl_const_227:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 66} unique __ctobpl_const_245:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 131} unique __ctobpl_const_248:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 132} unique __ctobpl_const_251:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 64} unique __ctobpl_const_242:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 63} unique __ctobpl_const_238:int;
const {:extern} {:model_const "result.fopen"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 64} unique __ctobpl_const_243:int;
const {:extern} {:model_const "result.open_character_stream"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 132} unique __ctobpl_const_252:int;
const {:extern} {:model_const "result.get_token"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 39} unique __ctobpl_const_225:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 43} unique __ctobpl_const_231:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 45} unique __ctobpl_const_235:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 42} unique __ctobpl_const_230:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 62} unique __ctobpl_const_237:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 40} unique __ctobpl_const_226:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 69} unique __ctobpl_const_247:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 131} unique __ctobpl_const_249:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 131} unique __ctobpl_const_250:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 455} unique __ctobpl_const_278:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 455} unique __ctobpl_const_280:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 440} unique __ctobpl_const_264:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 460} unique __ctobpl_const_285:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 435} unique __ctobpl_const_260:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 460} unique __ctobpl_const_283:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 445} unique __ctobpl_const_270:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 455} unique __ctobpl_const_279:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 462} unique __ctobpl_const_286:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 437} unique __ctobpl_const_261:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 457} unique __ctobpl_const_282:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 440} unique __ctobpl_const_263:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 435} unique __ctobpl_const_258:int;
const {:extern} {:model_const "result.open_character_stream"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 134} unique __ctobpl_const_256:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 445} unique __ctobpl_const_268:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 437} unique __ctobpl_const_262:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 442} unique __ctobpl_const_266:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 440} unique __ctobpl_const_265:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 445} unique __ctobpl_const_269:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 442} unique __ctobpl_const_267:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 450} unique __ctobpl_const_274:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 457} unique __ctobpl_const_281:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 460} unique __ctobpl_const_284:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 447} unique __ctobpl_const_271:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 135} unique __ctobpl_const_257:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 447} unique __ctobpl_const_272:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 450} unique __ctobpl_const_273:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 452} unique __ctobpl_const_276:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 452} unique __ctobpl_const_277:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 450} unique __ctobpl_const_275:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 435} unique __ctobpl_const_259:int;
const {:extern} {:model_const "result.get_char"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 155} unique __ctobpl_const_16:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 160} unique __ctobpl_const_19:int;
const {:extern} {:model_const "result.is_spec_symbol"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 162} unique __ctobpl_const_23:int;
const {:extern} {:model_const "result.is_token_end"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 167} unique __ctobpl_const_36:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 151} unique __ctobpl_const_9:int;
const {:extern} {:model_const "id"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 167} unique __ctobpl_const_32:int;
const {:extern} {:model_const "ch1[0]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 153} unique __ctobpl_const_11:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 163} unique __ctobpl_const_24:int;
const {:extern} {:model_const "id"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 149} unique __ctobpl_const_7:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 155} unique __ctobpl_const_13:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 155} unique __ctobpl_const_14:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 164} unique __ctobpl_const_26:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 165} unique __ctobpl_const_30:int;
const {:extern} {:model_const "result.get_char"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 165} unique __ctobpl_const_31:int;
const {:extern} {:model_const "ch1[1]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 154} unique __ctobpl_const_12:int;
const {:extern} {:model_const "id"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 167} unique __ctobpl_const_34:int;
const {:extern} {:model_const "id"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 164} unique __ctobpl_const_27:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 151} unique __ctobpl_const_8:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 155} unique __ctobpl_const_15:int;
const {:extern} {:model_const "const_80"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 151} unique __ctobpl_const_10:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 148} unique __ctobpl_const_6:int;
const {:extern} {:model_const "result.is_eof_token"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 161} unique __ctobpl_const_22:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 165} unique __ctobpl_const_28:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 167} unique __ctobpl_const_33:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 156} unique __ctobpl_const_18:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 160} unique __ctobpl_const_21:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 156} unique __ctobpl_const_17:int;
const {:extern} {:model_const "buffer[i]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 160} unique __ctobpl_const_20:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 167} unique __ctobpl_const_35:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 165} unique __ctobpl_const_29:int;
const {:extern} {:model_const "id"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 163} unique __ctobpl_const_25:int;
const {:extern} {:model_const "result.is_spec_symbol"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 223} unique __ctobpl_const_200:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 217} unique __ctobpl_const_204:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 35} unique __ctobpl_const_210:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 33} unique __ctobpl_const_211:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 224} unique __ctobpl_const_201:int;
const {:extern} {:model_const "argv"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 33} unique __ctobpl_const_212:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 383} unique __ctobpl_const_193:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 224} unique __ctobpl_const_203:int;
const {:extern} {:model_const "argc"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 32} unique __ctobpl_const_208:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 29} unique __ctobpl_const_214:int;
const {:extern} {:model_const "result.malloc"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 29} unique __ctobpl_const_215:int;
const {:extern} {:model_const "ch1[0]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 206} unique __ctobpl_const_194:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 30} unique __ctobpl_const_216:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 38} unique __ctobpl_const_219:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 38} unique __ctobpl_const_220:int;
const {:extern} {:model_const "str_com_id"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 209} unique __ctobpl_const_198:int;
const {:extern} {:model_const "result.open_token_stream"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 38} unique __ctobpl_const_221:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 39} unique __ctobpl_const_222:int;
const {:extern} {:model_const "argc"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 27} unique __ctobpl_const_207:int;
const {:extern} {:model_const "* (str + i)"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 380} unique __ctobpl_const_192:int;
const {:extern} {:model_const "ch1[1]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 207} unique __ctobpl_const_196:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 35} unique __ctobpl_const_209:int;
const {:extern} {:model_const "argv[1]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 33} unique __ctobpl_const_213:int;
const {:extern} {:model_const "* fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 30} unique __ctobpl_const_217:int;
const {:extern} {:model_const "fname"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 38} unique __ctobpl_const_218:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 210} unique __ctobpl_const_206:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 224} unique __ctobpl_const_202:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 210} unique __ctobpl_const_205:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 39} unique __ctobpl_const_223:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 206} unique __ctobpl_const_195:int;
const {:extern} {:model_const "str_com_id"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 216} unique __ctobpl_const_199:int;
const {:extern} {:model_const "result.is_eof_token"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 208} unique __ctobpl_const_197:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 482} unique __ctobpl_const_168:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 478} unique __ctobpl_const_163:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 486} unique __ctobpl_const_169:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 486} unique __ctobpl_const_171:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 482} unique __ctobpl_const_166:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 498} unique __ctobpl_const_180:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 358} unique __ctobpl_const_162:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 490} unique __ctobpl_const_174:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 478} unique __ctobpl_const_165:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 494} unique __ctobpl_const_175:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 494} unique __ctobpl_const_177:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 490} unique __ctobpl_const_172:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 462} unique __ctobpl_const_287:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 498} unique __ctobpl_const_179:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 502} unique __ctobpl_const_181:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 376} unique __ctobpl_const_184:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 378} unique __ctobpl_const_185:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 498} unique __ctobpl_const_178:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 490} unique __ctobpl_const_173:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 478} unique __ctobpl_const_164:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 502} unique __ctobpl_const_182:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 502} unique __ctobpl_const_183:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 494} unique __ctobpl_const_176:int;
const {:extern} {:model_const "* str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 378} unique __ctobpl_const_186:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 486} unique __ctobpl_const_170:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 379} unique __ctobpl_const_187:int;
const {:extern} {:model_const "* (str + i)"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 379} unique __ctobpl_const_189:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 380} unique __ctobpl_const_190:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 379} unique __ctobpl_const_188:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 380} unique __ctobpl_const_191:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 482} unique __ctobpl_const_167:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 191} unique __ctobpl_const_68:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 184} unique __ctobpl_const_70:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 179} unique __ctobpl_const_76:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 151} unique __ctobpl_const_89:int;
const {:extern} {:model_const "* (str + 1)"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 337} unique __ctobpl_const_94:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 337} unique __ctobpl_const_96:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 180} unique __ctobpl_const_81:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 337} unique __ctobpl_const_93:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 179} unique __ctobpl_const_77:int;
const {:extern} {:model_const "* str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 337} unique __ctobpl_const_91:int;
const {:extern} {:model_const "result.isdigit"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 357} unique __ctobpl_const_161:int;
const {:extern} {:model_const "j"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 152} unique __ctobpl_const_87:int;
const {:extern} {:model_const "result.unget_char"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 179} unique __ctobpl_const_79:int;
const {:extern} {:model_const "buffer[i]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 185} unique __ctobpl_const_72:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 337} unique __ctobpl_const_92:int;
const {:extern} {:model_const "result.isalpha"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 337} unique __ctobpl_const_97:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 180} unique __ctobpl_const_80:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 185} unique __ctobpl_const_71:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 179} unique __ctobpl_const_75:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 180} unique __ctobpl_const_82:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 158} unique __ctobpl_const_85:int;
const {:extern} {:model_const "result.get_char"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 158} unique __ctobpl_const_86:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 337} unique __ctobpl_const_95:int;
const {:extern} {:model_const "buffer[j]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 152} unique __ctobpl_const_88:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 191} unique __ctobpl_const_69:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 158} unique __ctobpl_const_83:int;
const {:extern} {:model_const "ident"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 308} unique __ctobpl_const_98:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 158} unique __ctobpl_const_84:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 179} unique __ctobpl_const_74:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 185} unique __ctobpl_const_73:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 337} unique __ctobpl_const_90:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 179} unique __ctobpl_const_78:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 176} unique __ctobpl_const_55:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 175} unique __ctobpl_const_48:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 170} unique __ctobpl_const_40:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 175} unique __ctobpl_const_51:int;
const {:extern} {:model_const "buffer[i]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 170} unique __ctobpl_const_39:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 175} unique __ctobpl_const_49:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 190} unique __ctobpl_const_61:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 190} unique __ctobpl_const_65:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 175} unique __ctobpl_const_50:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 173} unique __ctobpl_const_46:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 190} unique __ctobpl_const_63:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 190} unique __ctobpl_const_62:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 169} unique __ctobpl_const_37:int;
const {:extern} {:model_const "result.get_char"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 171} unique __ctobpl_const_44:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 190} unique __ctobpl_const_64:int;
const {:extern} {:model_const "result.unget_char"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 190} unique __ctobpl_const_66:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 191} unique __ctobpl_const_67:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 170} unique __ctobpl_const_38:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 171} unique __ctobpl_const_42:int;
const {:extern} {:model_const "result.unget_char"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 175} unique __ctobpl_const_53:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 176} unique __ctobpl_const_54:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 175} unique __ctobpl_const_52:int;
const {:extern} {:model_const "result.is_spec_symbol"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 178} unique __ctobpl_const_57:int;
const {:extern} {:model_const "id"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 188} unique __ctobpl_const_59:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 188} unique __ctobpl_const_60:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 176} unique __ctobpl_const_56:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 171} unique __ctobpl_const_43:int;
const {:extern} {:model_const "tp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 171} unique __ctobpl_const_41:int;
const {:extern} {:model_const "result.is_eof_token"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 174} unique __ctobpl_const_47:int;
const {:extern} {:model_const "id"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 183} unique __ctobpl_const_58:int;
const {:extern} {:model_const "ch1[0]"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 173} unique __ctobpl_const_45:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 322} unique __ctobpl_const_127:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 323} unique __ctobpl_const_139:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 353} unique __ctobpl_const_149:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 322} unique __ctobpl_const_130:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 322} unique __ctobpl_const_135:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 353} unique __ctobpl_const_150:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 323} unique __ctobpl_const_137:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 323} unique __ctobpl_const_142:int;
const {:extern} {:model_const "result.isdigit"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 353} unique __ctobpl_const_151:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 323} unique __ctobpl_const_138:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 323} unique __ctobpl_const_136:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 323} unique __ctobpl_const_141:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 355} unique __ctobpl_const_153:int;
const {:extern} {:model_const "* (str + i)"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 355} unique __ctobpl_const_154:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 357} unique __ctobpl_const_155:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 357} unique __ctobpl_const_156:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 357} unique __ctobpl_const_157:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 322} unique __ctobpl_const_132:int;
const {:extern} {:model_const "* (str + i)"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 357} unique __ctobpl_const_158:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 353} unique __ctobpl_const_147:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 322} unique __ctobpl_const_131:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 355} unique __ctobpl_const_152:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 322} unique __ctobpl_const_128:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 322} unique __ctobpl_const_133:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 323} unique __ctobpl_const_144:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 323} unique __ctobpl_const_140:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 357} unique __ctobpl_const_159:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 357} unique __ctobpl_const_160:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 323} unique __ctobpl_const_143:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 322} unique __ctobpl_const_134:int;
const {:extern} {:model_const "result.strcmp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 322} unique __ctobpl_const_129:int;
const {:extern} {:model_const "* str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 353} unique __ctobpl_const_148:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 294} unique __ctobpl_const_100:int;
const {:extern} {:model_const "* str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 400} unique __ctobpl_const_105:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 400} unique __ctobpl_const_106:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_121:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_123:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 400} unique __ctobpl_const_103:int;
const {:extern} {:model_const "* (str + i)"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_122:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_124:int;
const {:extern} {:model_const "result.isdigit"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_125:int;
const {:extern} {:model_const "result.isalpha"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_118:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 405} unique __ctobpl_const_126:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 351} unique __ctobpl_const_145:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 400} unique __ctobpl_const_107:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 39} unique __ctobpl_const_224:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_117:int;
const {:extern} {:model_const "* ident"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 308} unique __ctobpl_const_99:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 353} unique __ctobpl_const_146:int;
const {:extern} {:model_const "* tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 294} unique __ctobpl_const_101:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 400} unique __ctobpl_const_104:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_120:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 398} unique __ctobpl_const_102:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 402} unique __ctobpl_const_110:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 402} unique __ctobpl_const_109:int;
const {:extern} {:model_const "str"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_113:int;
const {:extern} {:model_const "* (str + i)"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 402} unique __ctobpl_const_111:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_112:int;
const {:extern} {:model_const "i"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_114:int;
const {:extern} {:model_const "result.isalpha"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 400} unique __ctobpl_const_108:int;
const {:extern} {:model_const "* (str + i)"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_115:int;
const {:extern} {:model_const "isalpha.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_116:int;
const {:extern} {:model_const "isdigit.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 404} unique __ctobpl_const_119:int;
const {:extern} {:model_const "result.is_eof_token"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 246} unique __ctobpl_const_343:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 245} unique __ctobpl_const_338:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 246} unique __ctobpl_const_342:int;
const {:extern} {:model_const "result.is_char_constant"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 244} unique __ctobpl_const_337:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 281} unique __ctobpl_const_319:int;
const {:extern} {:model_const "result.is_num_constant"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 242} unique __ctobpl_const_331:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 241} unique __ctobpl_const_326:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 239} unique __ctobpl_const_320:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 241} unique __ctobpl_const_327:int;
const {:extern} {:model_const "result.is_identifier"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 241} unique __ctobpl_const_328:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 243} unique __ctobpl_const_333:int;
const {:extern} {:model_const "result.is_str_constant"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 243} unique __ctobpl_const_334:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 244} unique __ctobpl_const_336:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 240} unique __ctobpl_const_324:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 242} unique __ctobpl_const_330:int;
const {:extern} {:model_const "result.is_keyword"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 239} unique __ctobpl_const_322:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 244} unique __ctobpl_const_335:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 245} unique __ctobpl_const_339:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 246} unique __ctobpl_const_341:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 239} unique __ctobpl_const_321:int;
const {:extern} {:model_const "result.is_spec_symbol"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 240} unique __ctobpl_const_325:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 242} unique __ctobpl_const_329:int;
const {:extern} {:model_const "result.is_comment"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 245} unique __ctobpl_const_340:int;
const {:extern} {:model_const "ungetc.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 94} unique __ctobpl_const_344:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 243} unique __ctobpl_const_332:int;
const {:extern} {:model_const "ch"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 94} unique __ctobpl_const_345:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 94} unique __ctobpl_const_347:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 281} unique __ctobpl_const_318:int;
const {:extern} {:model_const "ungetc.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 94} unique __ctobpl_const_346:int;
const {:extern} {:model_const "ungetc.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 94} unique __ctobpl_const_348:int;
const {:extern} {:model_const "fp"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 94} unique __ctobpl_const_349:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 240} unique __ctobpl_const_323:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 277} unique __ctobpl_const_313:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 259} unique __ctobpl_const_291:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 271} unique __ctobpl_const_307:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 264} unique __ctobpl_const_298:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 274} unique __ctobpl_const_310:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 274} unique __ctobpl_const_311:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 277} unique __ctobpl_const_314:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 278} unique __ctobpl_const_315:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 278} unique __ctobpl_const_316:int;
const {:extern} {:model_const "typea"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 280} unique __ctobpl_const_317:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 466} unique __ctobpl_const_289:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 259} unique __ctobpl_const_290:int;
const {:extern} {:model_const "result.token_type"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 259} unique __ctobpl_const_293:int;
const {:extern} {:model_const "typea"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 260} unique __ctobpl_const_294:int;
const {:extern} {:model_const "typea"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 263} unique __ctobpl_const_297:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 264} unique __ctobpl_const_299:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 266} unique __ctobpl_const_301:int;
const {:extern} {:model_const "tok"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 266} unique __ctobpl_const_302:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 261} unique __ctobpl_const_296:int;
const {:extern} {:model_const "typea"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 259} unique __ctobpl_const_292:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 466} unique __ctobpl_const_288:int;
const {:extern} {:model_const "typea"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 267} unique __ctobpl_const_303:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 268} unique __ctobpl_const_304:int;
const {:extern} {:model_const "typea"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 266} unique __ctobpl_const_300:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 268} unique __ctobpl_const_305:int;
const {:extern} {:model_const "typea"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 270} unique __ctobpl_const_306:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 271} unique __ctobpl_const_308:int;
const {:extern} {:model_const "typea"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 273} unique __ctobpl_const_309:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 261} unique __ctobpl_const_295:int;
const {:extern} {:model_const "typea"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 276} unique __ctobpl_const_312:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 97} unique __ctobpl_const_354:int;
const {:extern} {:model_const "result.ungetc"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 94} unique __ctobpl_const_351:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 95} unique __ctobpl_const_352:int;
const {:extern} {:model_const "c"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 100} unique __ctobpl_const_353:int;
const {:extern} {:model_const "fprintf.arg.1"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 423} unique __ctobpl_const_355:int;
const {:extern} {:model_const "result.__iob_func"} {:sourceFile ".\v3\print_tokens2.c"} {:sourceLine 423} unique __ctobpl_const_356:int;


procedure {:extern} __iob_func() returns (__dummy_ret__iob_func:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;


procedure {:extern} fopen(__dummy_formal_fopen_0.__1:int, __dummy_formal_fopen_1.__1:int) returns (__dummy_retfopen:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;


procedure {:extern} getc(__dummy_formal_getc_0.__1:int) returns (__dummy_retgetc:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;


procedure {:extern} isalpha(__dummy_formal_isalpha_0.__1:int) returns (__dummy_retisalpha:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;


procedure {:extern} isdigit(__dummy_formal_isdigit_0.__1:int) returns (__dummy_retisdigit:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;


procedure {:extern} strcmp(__dummy_formal_strcmp_0.__1:int, __dummy_formal_strcmp_1.__1:int) returns (__dummy_retstrcmp:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;


procedure {:extern} ungetc(__dummy_formal_ungetc_0.__1:int, __dummy_formal_ungetc_1.__1:int) returns (__dummy_retungetc:int);

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;


procedure {:extern}  get_char(fp.__1:int) returns (result.get_char$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ch : int;
var {:extern} fp : int;
var {:extern} result.getc$2 : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(fp.__1, alloc);
ch:= 0;//Init locals 
fp:= 0;//Init locals 
result.get_char$1 := 0;//initialize returns 
result.getc$2:= 0;//Init locals 
fp := fp.__1;
goto label_3;


// .\v3\print_tokens2.c(79)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 79} true;
goto label_4;


// .\v3\print_tokens2.c(80)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 80} true;
call result.getc$2 := getc (fp);
assume value_is(__ctobpl_const_1, fp);
assume value_is(__ctobpl_const_2, fp);
goto label_7;


// .\v3\print_tokens2.c(80)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 80} true;
ch := result.getc$2 ;
assume value_is(__ctobpl_const_3, ch);
assume value_is(__ctobpl_const_4, result.getc$2);
goto label_8;


// .\v3\print_tokens2.c(81)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 81} true;
result.get_char$1 := ch ;
assume value_is(__ctobpl_const_5, ch);
goto label_1;


// .\v3\print_tokens2.c(82)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 82} true;
return;


// .\v3\print_tokens2.c(82)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 82} true;
assume false;
return;

}



procedure {:extern}  get_token(tp.__1:int) returns (result.get_token$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ch : int;
var {:extern} ch1 : int;
var {:extern} i : int;
var {:extern} id : int;
var {:extern} $is_eof_token.arg.1$12$ : int;
var {:extern} $is_eof_token.arg.1$5$ : int;
var {:extern} $is_spec_symbol.arg.1$16$ : int;
var {:extern} $is_spec_symbol.arg.1$7$ : int;
var {:extern} j : int;
var {:extern} result.get_char$2 : int;
var {:extern} result.get_char$3 : int;
var {:extern} result.get_char$8 : int;
var {:extern} result.get_char$10 : int;
var {:extern} result.is_eof_token$4 : int;
var {:extern} result.is_eof_token$11 : int;
var {:extern} result.is_spec_symbol$6 : int;
var {:extern} result.is_spec_symbol$15 : int;
var {:extern} result.is_token_end$9 : int;
var {:extern} result.unget_char$13 : int;
var {:extern} result.unget_char$17 : int;
var {:extern} result.unget_char$19 : int;
var {:extern} result.unget_error$14 : int;
var {:extern} result.unget_error$18 : int;
var {:extern} result.unget_error$20 : int;
var {:extern} tp : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(tp.__1, alloc);
ch:= 0;//Init locals 
call ch1 := __HAVOC_det_malloc(2);
i:= 0;//Init locals 
id:= 0;//Init locals 
$is_eof_token.arg.1$12$:= 0;//Init locals 
$is_eof_token.arg.1$5$:= 0;//Init locals 
$is_spec_symbol.arg.1$16$:= 0;//Init locals 
$is_spec_symbol.arg.1$7$:= 0;//Init locals 
j:= 0;//Init locals 
result.get_char$2:= 0;//Init locals 
result.get_char$3:= 0;//Init locals 
result.get_char$8:= 0;//Init locals 
result.get_char$10:= 0;//Init locals 
result.get_token$1 := 0;//initialize returns 
result.is_eof_token$4:= 0;//Init locals 
result.is_eof_token$11:= 0;//Init locals 
result.is_spec_symbol$6:= 0;//Init locals 
result.is_spec_symbol$15:= 0;//Init locals 
result.is_token_end$9:= 0;//Init locals 
result.unget_char$13:= 0;//Init locals 
result.unget_char$17:= 0;//Init locals 
result.unget_char$19:= 0;//Init locals 
result.unget_error$14:= 0;//Init locals 
result.unget_error$18:= 0;//Init locals 
result.unget_error$20:= 0;//Init locals 
tp:= 0;//Init locals 
tp := tp.__1;
goto label_3;


// .\v3\print_tokens2.c(148)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 148} true;
goto label_4;


// .\v3\print_tokens2.c(148)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 148} true;
i := 0 ;
assume value_is(__ctobpl_const_6, i);
goto label_5;


// .\v3\print_tokens2.c(148)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 148} true;
goto label_6;


// .\v3\print_tokens2.c(149)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 149} true;
goto label_7;


// .\v3\print_tokens2.c(149)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 149} true;
id := 0 ;
assume value_is(__ctobpl_const_7, id);
goto label_8;


// .\v3\print_tokens2.c(150)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 150} true;
goto label_9;


// .\v3\print_tokens2.c(150)
label_9:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 150} true;
goto label_10;


// .\v3\print_tokens2.c(151)
label_10:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 151} true;
j := 0 ;
assume value_is(__ctobpl_const_8, j);
goto label_11;


// .\v3\print_tokens2.c(151)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 151} true;
// loop entry initialization...
goto label_11_head;


label_11_head:
// loop head assertions...

// end loop head assertions

goto label_11_true , label_11_false ;


label_11_true :
assume (INT_LEQ(j, const_80));
assume value_is(__ctobpl_const_9, j);
assume value_is(__ctobpl_const_10, const_80);
goto label_13;


label_11_false :
assume !(INT_LEQ(j, const_80));
assume value_is(__ctobpl_const_9, j);
assume value_is(__ctobpl_const_10, const_80);
goto label_12;


// .\v3\print_tokens2.c(153)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 153} true;
//TAG: Dereferenced object is non-null
assert(ch1 != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(ch1, 1, 0) := 0];
assume value_is(__ctobpl_const_11, Mem_T.CHAR[PLUS(ch1, 1, 0)]);
goto label_15;


// .\v3\print_tokens2.c(154)
label_15:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 154} true;
//TAG: Dereferenced object is non-null
assert(ch1 != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(ch1, 1, 1) := 0];
assume value_is(__ctobpl_const_12, Mem_T.CHAR[PLUS(ch1, 1, 1)]);
goto label_16;


// .\v3\print_tokens2.c(155)
label_16:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 155} true;
call result.get_char$2 := get_char (tp);
assume value_is(__ctobpl_const_13, tp);
assume value_is(__ctobpl_const_14, tp);
goto label_19;


// .\v3\print_tokens2.c(155)
label_19:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 155} true;
ch := result.get_char$2 ;
assume value_is(__ctobpl_const_15, ch);
assume value_is(__ctobpl_const_16, result.get_char$2);
goto label_20;


// .\v3\print_tokens2.c(156)
label_20:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 156} true;
// loop entry initialization...
goto label_20_head;


label_20_head:
// loop head assertions...

// end loop head assertions

goto label_20_true , label_20_false ;


label_20_true :
assume (INT_EQ(ch, 32));
assume value_is(__ctobpl_const_17, ch);
goto label_22;


label_20_false :
assume !(INT_EQ(ch, 32));
assume value_is(__ctobpl_const_17, ch);
goto label_21;


// .\v3\print_tokens2.c(156)
label_21:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 156} true;
goto label_21_true , label_21_false ;


label_21_true :
assume (INT_EQ(ch, 10));
assume value_is(__ctobpl_const_18, ch);
goto label_22;


label_21_false :
assume !(INT_EQ(ch, 10));
assume value_is(__ctobpl_const_18, ch);
goto label_26;


// .\v3\print_tokens2.c(160)
label_26:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 160} true;
//TAG: Dereferenced object is non-null
assert(buffer != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(buffer, 1, i) := ch];
assume value_is(__ctobpl_const_19, i);
assume value_is(__ctobpl_const_20, Mem_T.CHAR[PLUS(buffer, 1, i)]);
assume value_is(__ctobpl_const_21, ch);
goto label_27;


// .\v3\print_tokens2.c(161)
label_27:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 161} true;
// skipped OP_UNARY assignment to array
goto label_28;


// .\v3\print_tokens2.c(161)
label_28:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 161} true;
call result.is_eof_token$4 := is_eof_token ($is_eof_token.arg.1$5$);
goto label_31;


// .\v3\print_tokens2.c(161)
label_31:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 161} true;
goto label_31_true , label_31_false ;


label_31_true :
assume (INT_EQ(result.is_eof_token$4, 1));
assume value_is(__ctobpl_const_22, result.is_eof_token$4);
goto label_33;


label_31_false :
assume !(INT_EQ(result.is_eof_token$4, 1));
assume value_is(__ctobpl_const_22, result.is_eof_token$4);
goto label_32;


// .\v3\print_tokens2.c(162)
label_32:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 162} true;
// skipped OP_UNARY assignment to array
goto label_34;


// .\v3\print_tokens2.c(162)
label_34:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 162} true;
call result.is_spec_symbol$6 := is_spec_symbol ($is_spec_symbol.arg.1$7$);
goto label_37;


// .\v3\print_tokens2.c(162)
label_37:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 162} true;
goto label_37_true , label_37_false ;


label_37_true :
assume (INT_EQ(result.is_spec_symbol$6, 1));
assume value_is(__ctobpl_const_23, result.is_spec_symbol$6);
goto label_39;


label_37_false :
assume !(INT_EQ(result.is_spec_symbol$6, 1));
assume value_is(__ctobpl_const_23, result.is_spec_symbol$6);
goto label_38;


// .\v3\print_tokens2.c(163)
label_38:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 163} true;
goto label_38_true , label_38_false ;


label_38_true :
assume (INT_EQ(ch, 34));
assume value_is(__ctobpl_const_24, ch);
goto label_41;


label_38_false :
assume !(INT_EQ(ch, 34));
assume value_is(__ctobpl_const_24, ch);
goto label_40;


// .\v3\print_tokens2.c(163)
label_41:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 163} true;
id := 1 ;
assume value_is(__ctobpl_const_25, id);
goto label_40;


// .\v3\print_tokens2.c(164)
label_40:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 164} true;
goto label_40_true , label_40_false ;


label_40_true :
assume (INT_EQ(ch, 59));
assume value_is(__ctobpl_const_26, ch);
goto label_45;


label_40_false :
assume !(INT_EQ(ch, 59));
assume value_is(__ctobpl_const_26, ch);
goto label_42;


// .\v3\print_tokens2.c(164)
label_45:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 164} true;
id := 2 ;
assume value_is(__ctobpl_const_27, id);
goto label_42;


// .\v3\print_tokens2.c(165)
label_42:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 165} true;
call result.get_char$8 := get_char (tp);
assume value_is(__ctobpl_const_28, tp);
assume value_is(__ctobpl_const_29, tp);
goto label_46;


// .\v3\print_tokens2.c(165)
label_46:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 165} true;
ch := result.get_char$8 ;
assume value_is(__ctobpl_const_30, ch);
assume value_is(__ctobpl_const_31, result.get_char$8);
goto label_47;


// .\v3\print_tokens2.c(167)
label_47:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 167} true;
// loop entry initialization...
goto label_47_head;


label_47_head:
// loop head assertions...

// end loop head assertions

call result.is_token_end$9 := is_token_end (id, ch);
assume value_is(__ctobpl_const_32, id);
assume value_is(__ctobpl_const_33, ch);
assume value_is(__ctobpl_const_34, id);
assume value_is(__ctobpl_const_35, ch);
goto label_50;


// .\v3\print_tokens2.c(167)
label_50:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 167} true;
goto label_50_true , label_50_false ;


label_50_true :
assume (result.is_token_end$9 != 0);
assume value_is(__ctobpl_const_36, result.is_token_end$9);
goto label_52;


label_50_false :
assume (result.is_token_end$9 == 0);
assume value_is(__ctobpl_const_36, result.is_token_end$9);
goto label_51;


// .\v3\print_tokens2.c(169)
label_51:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 169} true;
assume value_is(__ctobpl_const_37, i);
i := PLUS(i, 1, 1) ;
goto label_96;


// .\v3\print_tokens2.c(170)
label_96:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 170} true;
//TAG: Dereferenced object is non-null
assert(buffer != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(buffer, 1, i) := ch];
assume value_is(__ctobpl_const_38, i);
assume value_is(__ctobpl_const_39, Mem_T.CHAR[PLUS(buffer, 1, i)]);
assume value_is(__ctobpl_const_40, ch);
goto label_97;


// .\v3\print_tokens2.c(171)
label_97:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 171} true;
call result.get_char$10 := get_char (tp);
assume value_is(__ctobpl_const_41, tp);
assume value_is(__ctobpl_const_42, tp);
goto label_100;


// .\v3\print_tokens2.c(171)
label_100:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 171} true;
ch := result.get_char$10 ;
assume value_is(__ctobpl_const_43, ch);
assume value_is(__ctobpl_const_44, result.get_char$10);
goto label_47_head;


// .\v3\print_tokens2.c(173)
label_52:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 173} true;
//TAG: Dereferenced object is non-null
assert(ch1 != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(ch1, 1, 0) := ch];
assume value_is(__ctobpl_const_45, Mem_T.CHAR[PLUS(ch1, 1, 0)]);
assume value_is(__ctobpl_const_46, ch);
goto label_53;


// .\v3\print_tokens2.c(174)
label_53:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 174} true;
// skipped OP_UNARY assignment to array
goto label_54;


// .\v3\print_tokens2.c(174)
label_54:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 174} true;
call result.is_eof_token$11 := is_eof_token ($is_eof_token.arg.1$12$);
goto label_57;


// .\v3\print_tokens2.c(174)
label_57:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 174} true;
goto label_57_true , label_57_false ;


label_57_true :
assume (INT_EQ(result.is_eof_token$11, 1));
assume value_is(__ctobpl_const_47, result.is_eof_token$11);
goto label_59;


label_57_false :
assume !(INT_EQ(result.is_eof_token$11, 1));
assume value_is(__ctobpl_const_47, result.is_eof_token$11);
goto label_58;


// .\v3\print_tokens2.c(175)
label_59:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 175} true;
call result.unget_char$13 := unget_char (ch, tp);
assume value_is(__ctobpl_const_48, ch);
assume value_is(__ctobpl_const_49, tp);
assume value_is(__ctobpl_const_50, ch);
assume value_is(__ctobpl_const_51, tp);
goto label_62;


// .\v3\print_tokens2.c(175)
label_62:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 175} true;
ch := result.unget_char$13 ;
assume value_is(__ctobpl_const_52, ch);
assume value_is(__ctobpl_const_53, result.unget_char$13);
goto label_63;


// .\v3\print_tokens2.c(176)
label_63:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 176} true;
goto label_63_true , label_63_false ;


label_63_true :
assume (INT_EQ(ch, -1));
assume value_is(__ctobpl_const_54, ch);
goto label_64;


label_63_false :
assume !(INT_EQ(ch, -1));
assume value_is(__ctobpl_const_54, ch);
goto label_58;


// .\v3\print_tokens2.c(176)
label_64:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 176} true;
call result.unget_error$14 := unget_error (tp);
assume value_is(__ctobpl_const_55, tp);
assume value_is(__ctobpl_const_56, tp);
goto label_58;


// .\v3\print_tokens2.c(178)
label_58:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 178} true;
// skipped OP_UNARY assignment to array
goto label_67;


// .\v3\print_tokens2.c(178)
label_67:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 178} true;
call result.is_spec_symbol$15 := is_spec_symbol ($is_spec_symbol.arg.1$16$);
goto label_70;


// .\v3\print_tokens2.c(178)
label_70:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 178} true;
goto label_70_true , label_70_false ;


label_70_true :
assume (INT_EQ(result.is_spec_symbol$15, 1));
assume value_is(__ctobpl_const_57, result.is_spec_symbol$15);
goto label_72;


label_70_false :
assume !(INT_EQ(result.is_spec_symbol$15, 1));
assume value_is(__ctobpl_const_57, result.is_spec_symbol$15);
goto label_71;


// .\v3\print_tokens2.c(183)
label_71:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 183} true;
goto label_71_true , label_71_false ;


label_71_true :
assume (INT_EQ(id, 1));
assume value_is(__ctobpl_const_58, id);
goto label_82;


label_71_false :
assume !(INT_EQ(id, 1));
assume value_is(__ctobpl_const_58, id);
goto label_81;


// .\v3\print_tokens2.c(188)
label_81:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 188} true;
goto label_81_true , label_81_false ;


label_81_true :
assume (id != 0);
assume value_is(__ctobpl_const_59, id);
goto label_86;


label_81_false :
assume (id == 0);
assume value_is(__ctobpl_const_59, id);
goto label_85;


// .\v3\print_tokens2.c(188)
label_85:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 188} true;
goto label_85_true , label_85_false ;


label_85_true :
assume (INT_EQ(ch, 59));
assume value_is(__ctobpl_const_60, ch);
goto label_87;


label_85_false :
assume !(INT_EQ(ch, 59));
assume value_is(__ctobpl_const_60, ch);
goto label_86;


// .\v3\print_tokens2.c(190)
label_87:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 190} true;
call result.unget_char$19 := unget_char (ch, tp);
assume value_is(__ctobpl_const_61, ch);
assume value_is(__ctobpl_const_62, tp);
assume value_is(__ctobpl_const_63, ch);
assume value_is(__ctobpl_const_64, tp);
goto label_90;


// .\v3\print_tokens2.c(190)
label_90:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 190} true;
ch := result.unget_char$19 ;
assume value_is(__ctobpl_const_65, ch);
assume value_is(__ctobpl_const_66, result.unget_char$19);
goto label_91;


// .\v3\print_tokens2.c(191)
label_91:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 191} true;
goto label_91_true , label_91_false ;


label_91_true :
assume (INT_EQ(ch, -1));
assume value_is(__ctobpl_const_67, ch);
goto label_93;


label_91_false :
assume !(INT_EQ(ch, -1));
assume value_is(__ctobpl_const_67, ch);
goto label_92;


// .\v3\print_tokens2.c(191)
label_93:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 191} true;
call result.unget_error$20 := unget_error (tp);
assume value_is(__ctobpl_const_68, tp);
assume value_is(__ctobpl_const_69, tp);
goto label_92;


// .\v3\print_tokens2.c(192)
label_92:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 192} true;
result.get_token$1 := buffer ;
goto label_1;


// .\v3\print_tokens2.c(194)
label_86:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 194} true;
result.get_token$1 := buffer ;
goto label_1;


// .\v3\print_tokens2.c(184)
label_82:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 184} true;
assume value_is(__ctobpl_const_70, i);
i := PLUS(i, 1, 1) ;
goto label_83;


// .\v3\print_tokens2.c(185)
label_83:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 185} true;
//TAG: Dereferenced object is non-null
assert(buffer != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(buffer, 1, i) := ch];
assume value_is(__ctobpl_const_71, i);
assume value_is(__ctobpl_const_72, Mem_T.CHAR[PLUS(buffer, 1, i)]);
assume value_is(__ctobpl_const_73, ch);
goto label_84;


// .\v3\print_tokens2.c(186)
label_84:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 186} true;
result.get_token$1 := buffer ;
goto label_1;


// .\v3\print_tokens2.c(179)
label_72:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 179} true;
call result.unget_char$17 := unget_char (ch, tp);
assume value_is(__ctobpl_const_74, ch);
assume value_is(__ctobpl_const_75, tp);
assume value_is(__ctobpl_const_76, ch);
assume value_is(__ctobpl_const_77, tp);
goto label_75;


// .\v3\print_tokens2.c(179)
label_75:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 179} true;
ch := result.unget_char$17 ;
assume value_is(__ctobpl_const_78, ch);
assume value_is(__ctobpl_const_79, result.unget_char$17);
goto label_76;


// .\v3\print_tokens2.c(180)
label_76:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 180} true;
goto label_76_true , label_76_false ;


label_76_true :
assume (INT_EQ(ch, -1));
assume value_is(__ctobpl_const_80, ch);
goto label_78;


label_76_false :
assume !(INT_EQ(ch, -1));
assume value_is(__ctobpl_const_80, ch);
goto label_77;


// .\v3\print_tokens2.c(180)
label_78:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 180} true;
call result.unget_error$18 := unget_error (tp);
assume value_is(__ctobpl_const_81, tp);
assume value_is(__ctobpl_const_82, tp);
goto label_77;


// .\v3\print_tokens2.c(181)
label_77:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 181} true;
result.get_token$1 := buffer ;
goto label_1;


// .\v3\print_tokens2.c(162)
label_39:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 162} true;
result.get_token$1 := buffer ;
goto label_1;


// .\v3\print_tokens2.c(161)
label_33:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 161} true;
result.get_token$1 := buffer ;
goto label_1;


// .\v3\print_tokens2.c(195)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 195} true;
call __HAVOC_free(ch1);
return;


// .\v3\print_tokens2.c(158)
label_22:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 158} true;
call result.get_char$3 := get_char (tp);
assume value_is(__ctobpl_const_83, tp);
assume value_is(__ctobpl_const_84, tp);
goto label_25;


// .\v3\print_tokens2.c(158)
label_25:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 158} true;
ch := result.get_char$3 ;
assume value_is(__ctobpl_const_85, ch);
assume value_is(__ctobpl_const_86, result.get_char$3);
goto label_20_head;


// .\v3\print_tokens2.c(195)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 195} true;
assume false;
return;


// .\v3\print_tokens2.c(152)
label_13:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 152} true;
//TAG: Dereferenced object is non-null
assert(buffer != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(buffer, 1, j) := 0];
assume value_is(__ctobpl_const_87, j);
assume value_is(__ctobpl_const_88, Mem_T.CHAR[PLUS(buffer, 1, j)]);
goto label_14;


// .\v3\print_tokens2.c(151)
label_14:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 151} true;
assume value_is(__ctobpl_const_89, j);
j := PLUS(j, 1, 1) ;
goto label_11_head;

}



procedure {:extern}  is_char_constant(str.__1:int) returns (result.is_char_constant$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $isalpha.arg.1$3$_123_$static$ : int;
var {:extern} result.isalpha$2 : int;
var {:extern} str : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(str.__1, alloc);
$isalpha.arg.1$3$_123_$static$:= 0;//Init locals 
result.is_char_constant$1 := 0;//initialize returns 
result.isalpha$2:= 0;//Init locals 
str:= 0;//Init locals 
str := str.__1;
goto label_3;


// .\v3\print_tokens2.c(337)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 337} true;
//TAG: Dereferenced object is non-null
assert(str != 0);
goto label_3_true , label_3_false ;


label_3_true :
assume (INT_EQ(Mem_T.CHAR[str], 35));
assume value_is(__ctobpl_const_90, str);
assume value_is(__ctobpl_const_91, Mem_T.CHAR[str]);
goto label_5;


label_3_false :
assume !(INT_EQ(Mem_T.CHAR[str], 35));
assume value_is(__ctobpl_const_90, str);
assume value_is(__ctobpl_const_91, Mem_T.CHAR[str]);
goto label_4;


// .\v3\print_tokens2.c(337)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 337} true;
//TAG: Dereferenced object is non-null
assert(PLUS(str, 1, 1) != 0);
$isalpha.arg.1$3$_123_$static$ := Mem_T.CHAR[PLUS(str, 1, 1)] ;
assume value_is(__ctobpl_const_92, $isalpha.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_93, str);
assume value_is(__ctobpl_const_94, Mem_T.CHAR[PLUS(str, 1, 1)]);
goto label_6;


// .\v3\print_tokens2.c(337)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 337} true;
call result.isalpha$2 := isalpha ($isalpha.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_95, $isalpha.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_96, $isalpha.arg.1$3$_123_$static$);
goto label_9;


// .\v3\print_tokens2.c(337)
label_9:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 337} true;
goto label_9_true , label_9_false ;


label_9_true :
assume (result.isalpha$2 != 0);
assume value_is(__ctobpl_const_97, result.isalpha$2);
goto label_10;


label_9_false :
assume (result.isalpha$2 == 0);
assume value_is(__ctobpl_const_97, result.isalpha$2);
goto label_4;


// .\v3\print_tokens2.c(340)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 340} true;
result.is_char_constant$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(338)
label_10:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 338} true;
result.is_char_constant$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(341)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 341} true;
return;


// .\v3\print_tokens2.c(341)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 341} true;
assume false;
return;

}



procedure {:extern}  is_comment(ident.__1:int) returns (result.is_comment$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ident : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(ident.__1, alloc);
ident:= 0;//Init locals 
result.is_comment$1 := 0;//initialize returns 
ident := ident.__1;
goto label_3;


// .\v3\print_tokens2.c(308)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 308} true;
//TAG: Dereferenced object is non-null
assert(ident != 0);
goto label_3_true , label_3_false ;


label_3_true :
assume (INT_EQ(Mem_T.CHAR[ident], 59));
assume value_is(__ctobpl_const_98, ident);
assume value_is(__ctobpl_const_99, Mem_T.CHAR[ident]);
goto label_5;


label_3_false :
assume !(INT_EQ(Mem_T.CHAR[ident], 59));
assume value_is(__ctobpl_const_98, ident);
assume value_is(__ctobpl_const_99, Mem_T.CHAR[ident]);
goto label_4;


// .\v3\print_tokens2.c(311)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 311} true;
result.is_comment$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(309)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 309} true;
result.is_comment$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(312)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 312} true;
return;

}



procedure {:extern}  is_eof_token(tok.__1:int) returns (result.is_eof_token$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} tok : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(tok.__1, alloc);
result.is_eof_token$1 := 0;//initialize returns 
tok:= 0;//Init locals 
tok := tok.__1;
goto label_3;


// .\v3\print_tokens2.c(294)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 294} true;
//TAG: Dereferenced object is non-null
assert(tok != 0);
goto label_3_true , label_3_false ;


label_3_true :
assume (INT_EQ(Mem_T.CHAR[tok], -1));
assume value_is(__ctobpl_const_100, tok);
assume value_is(__ctobpl_const_101, Mem_T.CHAR[tok]);
goto label_5;


label_3_false :
assume !(INT_EQ(Mem_T.CHAR[tok], -1));
assume value_is(__ctobpl_const_100, tok);
assume value_is(__ctobpl_const_101, Mem_T.CHAR[tok]);
goto label_4;


// .\v3\print_tokens2.c(297)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 297} true;
result.is_eof_token$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(295)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 295} true;
result.is_eof_token$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(298)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 298} true;
return;

}



procedure {:extern}  is_identifier(str.__1:int) returns (result.is_identifier$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} i : int;
var {:extern} $isalpha.arg.1$3$_123_$static$ : int;
var {:extern} $isalpha.arg.1$5$_123_$static$ : int;
var {:extern} $isdigit.arg.1$7$_123_$static$ : int;
var {:extern} result.isalpha$2 : int;
var {:extern} result.isalpha$4 : int;
var {:extern} result.isdigit$6 : int;
var {:extern} str : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(str.__1, alloc);
i:= 0;//Init locals 
$isalpha.arg.1$3$_123_$static$:= 0;//Init locals 
$isalpha.arg.1$5$_123_$static$:= 0;//Init locals 
$isdigit.arg.1$7$_123_$static$:= 0;//Init locals 
result.is_identifier$1 := 0;//initialize returns 
result.isalpha$2:= 0;//Init locals 
result.isalpha$4:= 0;//Init locals 
result.isdigit$6:= 0;//Init locals 
str:= 0;//Init locals 
str := str.__1;
goto label_3;


// .\v3\print_tokens2.c(398)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 398} true;
goto label_4;


// .\v3\print_tokens2.c(398)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 398} true;
i := 1 ;
assume value_is(__ctobpl_const_102, i);
goto label_5;


// .\v3\print_tokens2.c(400)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 400} true;
//TAG: Dereferenced object is non-null
assert(str != 0);
$isalpha.arg.1$3$_123_$static$ := Mem_T.CHAR[str] ;
assume value_is(__ctobpl_const_103, $isalpha.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_104, str);
assume value_is(__ctobpl_const_105, Mem_T.CHAR[str]);
goto label_6;


// .\v3\print_tokens2.c(400)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 400} true;
call result.isalpha$2 := isalpha ($isalpha.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_106, $isalpha.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_107, $isalpha.arg.1$3$_123_$static$);
goto label_9;


// .\v3\print_tokens2.c(400)
label_9:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 400} true;
goto label_9_true , label_9_false ;


label_9_true :
assume (result.isalpha$2 != 0);
assume value_is(__ctobpl_const_108, result.isalpha$2);
goto label_11;


label_9_false :
assume (result.isalpha$2 == 0);
assume value_is(__ctobpl_const_108, result.isalpha$2);
goto label_10;


// .\v3\print_tokens2.c(412)
label_10:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 412} true;
result.is_identifier$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(402)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 402} true;
// loop entry initialization...
goto label_11_head;


label_11_head:
// loop head assertions...

// end loop head assertions

//TAG: Dereferenced object is non-null
assert(PLUS(str, 1, i) != 0);
goto label_11_true , label_11_false ;


label_11_true :
assume (Mem_T.CHAR[PLUS(str, 1, i)] != 0);
assume value_is(__ctobpl_const_109, str);
assume value_is(__ctobpl_const_110, i);
assume value_is(__ctobpl_const_111, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_13;


label_11_false :
assume (Mem_T.CHAR[PLUS(str, 1, i)] == 0);
assume value_is(__ctobpl_const_109, str);
assume value_is(__ctobpl_const_110, i);
assume value_is(__ctobpl_const_111, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_12;


// .\v3\print_tokens2.c(409)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 409} true;
result.is_identifier$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(404)
label_13:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 404} true;
//TAG: Dereferenced object is non-null
assert(PLUS(str, 1, i) != 0);
$isalpha.arg.1$5$_123_$static$ := Mem_T.CHAR[PLUS(str, 1, i)] ;
assume value_is(__ctobpl_const_112, $isalpha.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_113, str);
assume value_is(__ctobpl_const_114, i);
assume value_is(__ctobpl_const_115, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_14;


// .\v3\print_tokens2.c(404)
label_14:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 404} true;
call result.isalpha$4 := isalpha ($isalpha.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_116, $isalpha.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_117, $isalpha.arg.1$5$_123_$static$);
goto label_17;


// .\v3\print_tokens2.c(404)
label_17:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 404} true;
goto label_17_true , label_17_false ;


label_17_true :
assume (result.isalpha$4 != 0);
assume value_is(__ctobpl_const_118, result.isalpha$4);
goto label_19;


label_17_false :
assume (result.isalpha$4 == 0);
assume value_is(__ctobpl_const_118, result.isalpha$4);
goto label_18;


// .\v3\print_tokens2.c(404)
label_18:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 404} true;
//TAG: Dereferenced object is non-null
assert(PLUS(str, 1, i) != 0);
$isdigit.arg.1$7$_123_$static$ := Mem_T.CHAR[PLUS(str, 1, i)] ;
assume value_is(__ctobpl_const_119, $isdigit.arg.1$7$_123_$static$);
assume value_is(__ctobpl_const_120, str);
assume value_is(__ctobpl_const_121, i);
assume value_is(__ctobpl_const_122, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_20;


// .\v3\print_tokens2.c(404)
label_20:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 404} true;
call result.isdigit$6 := isdigit ($isdigit.arg.1$7$_123_$static$);
assume value_is(__ctobpl_const_123, $isdigit.arg.1$7$_123_$static$);
assume value_is(__ctobpl_const_124, $isdigit.arg.1$7$_123_$static$);
goto label_23;


// .\v3\print_tokens2.c(404)
label_23:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 404} true;
goto label_23_true , label_23_false ;


label_23_true :
assume (result.isdigit$6 != 0);
assume value_is(__ctobpl_const_125, result.isdigit$6);
goto label_19;


label_23_false :
assume (result.isdigit$6 == 0);
assume value_is(__ctobpl_const_125, result.isdigit$6);
goto label_24;


// .\v3\print_tokens2.c(407)
label_24:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 407} true;
result.is_identifier$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(413)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 413} true;
return;


// .\v3\print_tokens2.c(405)
label_19:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 405} true;
assume value_is(__ctobpl_const_126, i);
i := PLUS(i, 1, 1) ;
goto label_11_head;


// .\v3\print_tokens2.c(413)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 413} true;
assume false;
return;

}



procedure {:extern}  is_keyword(str.__1:int) returns (result.is_keyword$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} result.strcmp$2 : int;
var {:extern} result.strcmp$3 : int;
var {:extern} result.strcmp$4 : int;
var {:extern} result.strcmp$5 : int;
var {:extern} result.strcmp$6 : int;
var {:extern} result.strcmp$7 : int;
var {:extern} str : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(str.__1, alloc);
result.is_keyword$1 := 0;//initialize returns 
result.strcmp$2:= 0;//Init locals 
result.strcmp$3:= 0;//Init locals 
result.strcmp$4:= 0;//Init locals 
result.strcmp$5:= 0;//Init locals 
result.strcmp$6:= 0;//Init locals 
result.strcmp$7:= 0;//Init locals 
str:= 0;//Init locals 
str := str.__1;
goto label_3;


// .\v3\print_tokens2.c(322)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 322} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$2 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_127, str);
assume value_is(__ctobpl_const_128, str);
goto label_6;


// .\v3\print_tokens2.c(322)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 322} true;
goto label_6_true , label_6_false ;


label_6_true :
assume (result.strcmp$2 != 0);
assume value_is(__ctobpl_const_129, result.strcmp$2);
goto label_8;


label_6_false :
assume (result.strcmp$2 == 0);
assume value_is(__ctobpl_const_129, result.strcmp$2);
goto label_7;


// .\v3\print_tokens2.c(322)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 322} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$3 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_130, str);
assume value_is(__ctobpl_const_131, str);
goto label_11;


// .\v3\print_tokens2.c(322)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 322} true;
goto label_11_true , label_11_false ;


label_11_true :
assume (result.strcmp$3 != 0);
assume value_is(__ctobpl_const_132, result.strcmp$3);
goto label_12;


label_11_false :
assume (result.strcmp$3 == 0);
assume value_is(__ctobpl_const_132, result.strcmp$3);
goto label_7;


// .\v3\print_tokens2.c(322)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 322} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$4 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_133, str);
assume value_is(__ctobpl_const_134, str);
goto label_15;


// .\v3\print_tokens2.c(322)
label_15:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 322} true;
goto label_15_true , label_15_false ;


label_15_true :
assume (result.strcmp$4 != 0);
assume value_is(__ctobpl_const_135, result.strcmp$4);
goto label_16;


label_15_false :
assume (result.strcmp$4 == 0);
assume value_is(__ctobpl_const_135, result.strcmp$4);
goto label_7;


// .\v3\print_tokens2.c(323)
label_16:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 323} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$5 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_136, str);
assume value_is(__ctobpl_const_137, str);
goto label_19;


// .\v3\print_tokens2.c(323)
label_19:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 323} true;
goto label_19_true , label_19_false ;


label_19_true :
assume (result.strcmp$5 != 0);
assume value_is(__ctobpl_const_138, result.strcmp$5);
goto label_20;


label_19_false :
assume (result.strcmp$5 == 0);
assume value_is(__ctobpl_const_138, result.strcmp$5);
goto label_7;


// .\v3\print_tokens2.c(323)
label_20:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 323} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$6 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_139, str);
assume value_is(__ctobpl_const_140, str);
goto label_23;


// .\v3\print_tokens2.c(323)
label_23:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 323} true;
goto label_23_true , label_23_false ;


label_23_true :
assume (result.strcmp$6 != 0);
assume value_is(__ctobpl_const_141, result.strcmp$6);
goto label_24;


label_23_false :
assume (result.strcmp$6 == 0);
assume value_is(__ctobpl_const_141, result.strcmp$6);
goto label_7;


// .\v3\print_tokens2.c(323)
label_24:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 323} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$7 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_142, str);
assume value_is(__ctobpl_const_143, str);
goto label_27;


// .\v3\print_tokens2.c(323)
label_27:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 323} true;
goto label_27_true , label_27_false ;


label_27_true :
assume (result.strcmp$7 != 0);
assume value_is(__ctobpl_const_144, result.strcmp$7);
goto label_28;


label_27_false :
assume (result.strcmp$7 == 0);
assume value_is(__ctobpl_const_144, result.strcmp$7);
goto label_7;


// .\v3\print_tokens2.c(324)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 324} true;
result.is_keyword$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(326)
label_28:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 326} true;
result.is_keyword$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(327)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 327} true;
return;


// .\v3\print_tokens2.c(327)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 327} true;
assume false;
return;

}



procedure {:extern}  is_num_constant(str.__1:int) returns (result.is_num_constant$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} i : int;
var {:extern} $isdigit.arg.1$3$_123_$static$ : int;
var {:extern} $isdigit.arg.1$5$_123_$static$ : int;
var {:extern} result.isdigit$2 : int;
var {:extern} result.isdigit$4 : int;
var {:extern} str : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(str.__1, alloc);
i:= 0;//Init locals 
$isdigit.arg.1$3$_123_$static$:= 0;//Init locals 
$isdigit.arg.1$5$_123_$static$:= 0;//Init locals 
result.is_num_constant$1 := 0;//initialize returns 
result.isdigit$2:= 0;//Init locals 
result.isdigit$4:= 0;//Init locals 
str:= 0;//Init locals 
str := str.__1;
goto label_3;


// .\v3\print_tokens2.c(351)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 351} true;
goto label_4;


// .\v3\print_tokens2.c(351)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 351} true;
i := 1 ;
assume value_is(__ctobpl_const_145, i);
goto label_5;


// .\v3\print_tokens2.c(353)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 353} true;
//TAG: Dereferenced object is non-null
assert(str != 0);
$isdigit.arg.1$3$_123_$static$ := Mem_T.CHAR[str] ;
assume value_is(__ctobpl_const_146, $isdigit.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_147, str);
assume value_is(__ctobpl_const_148, Mem_T.CHAR[str]);
goto label_6;


// .\v3\print_tokens2.c(353)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 353} true;
call result.isdigit$2 := isdigit ($isdigit.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_149, $isdigit.arg.1$3$_123_$static$);
assume value_is(__ctobpl_const_150, $isdigit.arg.1$3$_123_$static$);
goto label_9;


// .\v3\print_tokens2.c(353)
label_9:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 353} true;
goto label_9_true , label_9_false ;


label_9_true :
assume (result.isdigit$2 != 0);
assume value_is(__ctobpl_const_151, result.isdigit$2);
goto label_11;


label_9_false :
assume (result.isdigit$2 == 0);
assume value_is(__ctobpl_const_151, result.isdigit$2);
goto label_10;


// .\v3\print_tokens2.c(365)
label_10:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 365} true;
result.is_num_constant$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(355)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 355} true;
// loop entry initialization...
goto label_11_head;


label_11_head:
// loop head assertions...

// end loop head assertions

//TAG: Dereferenced object is non-null
assert(PLUS(str, 1, i) != 0);
goto label_11_true , label_11_false ;


label_11_true :
assume (Mem_T.CHAR[PLUS(str, 1, i)] != 0);
assume value_is(__ctobpl_const_152, str);
assume value_is(__ctobpl_const_153, i);
assume value_is(__ctobpl_const_154, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_13;


label_11_false :
assume (Mem_T.CHAR[PLUS(str, 1, i)] == 0);
assume value_is(__ctobpl_const_152, str);
assume value_is(__ctobpl_const_153, i);
assume value_is(__ctobpl_const_154, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_12;


// .\v3\print_tokens2.c(362)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 362} true;
result.is_num_constant$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(357)
label_13:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 357} true;
//TAG: Dereferenced object is non-null
assert(PLUS(str, 1, i) != 0);
$isdigit.arg.1$5$_123_$static$ := Mem_T.CHAR[PLUS(str, 1, i)] ;
assume value_is(__ctobpl_const_155, $isdigit.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_156, str);
assume value_is(__ctobpl_const_157, i);
assume value_is(__ctobpl_const_158, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_14;


// .\v3\print_tokens2.c(357)
label_14:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 357} true;
call result.isdigit$4 := isdigit ($isdigit.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_159, $isdigit.arg.1$5$_123_$static$);
assume value_is(__ctobpl_const_160, $isdigit.arg.1$5$_123_$static$);
goto label_17;


// .\v3\print_tokens2.c(357)
label_17:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 357} true;
goto label_17_true , label_17_false ;


label_17_true :
assume (result.isdigit$4 != 0);
assume value_is(__ctobpl_const_161, result.isdigit$4);
goto label_19;


label_17_false :
assume (result.isdigit$4 == 0);
assume value_is(__ctobpl_const_161, result.isdigit$4);
goto label_18;


// .\v3\print_tokens2.c(360)
label_18:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 360} true;
result.is_num_constant$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(366)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 366} true;
return;


// .\v3\print_tokens2.c(358)
label_19:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 358} true;
assume value_is(__ctobpl_const_162, i);
i := PLUS(i, 1, 1) ;
goto label_11_head;


// .\v3\print_tokens2.c(366)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 366} true;
assume false;
return;

}



procedure {:extern}  is_spec_symbol(str.__1:int) returns (result.is_spec_symbol$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} result.strcmp$2 : int;
var {:extern} result.strcmp$3 : int;
var {:extern} result.strcmp$4 : int;
var {:extern} result.strcmp$5 : int;
var {:extern} result.strcmp$6 : int;
var {:extern} result.strcmp$7 : int;
var {:extern} result.strcmp$8 : int;
var {:extern} str : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(str.__1, alloc);
result.is_spec_symbol$1 := 0;//initialize returns 
result.strcmp$2:= 0;//Init locals 
result.strcmp$3:= 0;//Init locals 
result.strcmp$4:= 0;//Init locals 
result.strcmp$5:= 0;//Init locals 
result.strcmp$6:= 0;//Init locals 
result.strcmp$7:= 0;//Init locals 
result.strcmp$8:= 0;//Init locals 
str:= 0;//Init locals 
str := str.__1;
goto label_3;


// .\v3\print_tokens2.c(478)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 478} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$2 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_163, str);
assume value_is(__ctobpl_const_164, str);
goto label_6;


// .\v3\print_tokens2.c(478)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 478} true;
goto label_6_true , label_6_false ;


label_6_true :
assume (result.strcmp$2 != 0);
assume value_is(__ctobpl_const_165, result.strcmp$2);
goto label_8;


label_6_false :
assume (result.strcmp$2 == 0);
assume value_is(__ctobpl_const_165, result.strcmp$2);
goto label_7;


// .\v3\print_tokens2.c(480)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 480} true;
result.is_spec_symbol$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(482)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 482} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$3 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_166, str);
assume value_is(__ctobpl_const_167, str);
goto label_11;


// .\v3\print_tokens2.c(482)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 482} true;
goto label_11_true , label_11_false ;


label_11_true :
assume (result.strcmp$3 != 0);
assume value_is(__ctobpl_const_168, result.strcmp$3);
goto label_13;


label_11_false :
assume (result.strcmp$3 == 0);
assume value_is(__ctobpl_const_168, result.strcmp$3);
goto label_12;


// .\v3\print_tokens2.c(484)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 484} true;
result.is_spec_symbol$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(486)
label_13:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 486} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$4 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_169, str);
assume value_is(__ctobpl_const_170, str);
goto label_16;


// .\v3\print_tokens2.c(486)
label_16:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 486} true;
goto label_16_true , label_16_false ;


label_16_true :
assume (result.strcmp$4 != 0);
assume value_is(__ctobpl_const_171, result.strcmp$4);
goto label_18;


label_16_false :
assume (result.strcmp$4 == 0);
assume value_is(__ctobpl_const_171, result.strcmp$4);
goto label_17;


// .\v3\print_tokens2.c(488)
label_17:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 488} true;
result.is_spec_symbol$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(490)
label_18:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 490} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$5 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_172, str);
assume value_is(__ctobpl_const_173, str);
goto label_21;


// .\v3\print_tokens2.c(490)
label_21:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 490} true;
goto label_21_true , label_21_false ;


label_21_true :
assume (result.strcmp$5 != 0);
assume value_is(__ctobpl_const_174, result.strcmp$5);
goto label_23;


label_21_false :
assume (result.strcmp$5 == 0);
assume value_is(__ctobpl_const_174, result.strcmp$5);
goto label_22;


// .\v3\print_tokens2.c(492)
label_22:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 492} true;
result.is_spec_symbol$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(494)
label_23:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 494} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$6 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_175, str);
assume value_is(__ctobpl_const_176, str);
goto label_26;


// .\v3\print_tokens2.c(494)
label_26:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 494} true;
goto label_26_true , label_26_false ;


label_26_true :
assume (result.strcmp$6 != 0);
assume value_is(__ctobpl_const_177, result.strcmp$6);
goto label_28;


label_26_false :
assume (result.strcmp$6 == 0);
assume value_is(__ctobpl_const_177, result.strcmp$6);
goto label_27;


// .\v3\print_tokens2.c(496)
label_27:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 496} true;
result.is_spec_symbol$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(498)
label_28:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 498} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$7 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_178, str);
assume value_is(__ctobpl_const_179, str);
goto label_31;


// .\v3\print_tokens2.c(498)
label_31:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 498} true;
goto label_31_true , label_31_false ;


label_31_true :
assume (result.strcmp$7 != 0);
assume value_is(__ctobpl_const_180, result.strcmp$7);
goto label_33;


label_31_false :
assume (result.strcmp$7 == 0);
assume value_is(__ctobpl_const_180, result.strcmp$7);
goto label_32;


// .\v3\print_tokens2.c(500)
label_32:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 500} true;
result.is_spec_symbol$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(502)
label_33:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 502} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$8 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_181, str);
assume value_is(__ctobpl_const_182, str);
goto label_36;


// .\v3\print_tokens2.c(502)
label_36:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 502} true;
goto label_36_true , label_36_false ;


label_36_true :
assume (result.strcmp$8 != 0);
assume value_is(__ctobpl_const_183, result.strcmp$8);
goto label_38;


label_36_false :
assume (result.strcmp$8 == 0);
assume value_is(__ctobpl_const_183, result.strcmp$8);
goto label_37;


// .\v3\print_tokens2.c(504)
label_37:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 504} true;
result.is_spec_symbol$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(506)
label_38:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 506} true;
result.is_spec_symbol$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(507)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 507} true;
return;


// .\v3\print_tokens2.c(507)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 507} true;
assume false;
return;

}



procedure {:extern}  is_str_constant(str.__1:int) returns (result.is_str_constant$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} i : int;
var {:extern} str : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(str.__1, alloc);
i:= 0;//Init locals 
result.is_str_constant$1 := 0;//initialize returns 
str:= 0;//Init locals 
str := str.__1;
goto label_3;


// .\v3\print_tokens2.c(376)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 376} true;
goto label_4;


// .\v3\print_tokens2.c(376)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 376} true;
i := 1 ;
assume value_is(__ctobpl_const_184, i);
goto label_5;


// .\v3\print_tokens2.c(378)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 378} true;
//TAG: Dereferenced object is non-null
assert(str != 0);
goto label_5_true , label_5_false ;


label_5_true :
assume (INT_EQ(Mem_T.CHAR[str], 34));
assume value_is(__ctobpl_const_185, str);
assume value_is(__ctobpl_const_186, Mem_T.CHAR[str]);
goto label_7;


label_5_false :
assume !(INT_EQ(Mem_T.CHAR[str], 34));
assume value_is(__ctobpl_const_185, str);
assume value_is(__ctobpl_const_186, Mem_T.CHAR[str]);
goto label_6;


// .\v3\print_tokens2.c(388)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 388} true;
result.is_str_constant$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(379)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 379} true;
// loop entry initialization...
goto label_7_head;


label_7_head:
// loop head assertions...

// end loop head assertions

//TAG: Dereferenced object is non-null
assert(PLUS(str, 1, i) != 0);
goto label_7_true , label_7_false ;


label_7_true :
assume (Mem_T.CHAR[PLUS(str, 1, i)] != 0);
assume value_is(__ctobpl_const_187, str);
assume value_is(__ctobpl_const_188, i);
assume value_is(__ctobpl_const_189, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_9;


label_7_false :
assume (Mem_T.CHAR[PLUS(str, 1, i)] == 0);
assume value_is(__ctobpl_const_187, str);
assume value_is(__ctobpl_const_188, i);
assume value_is(__ctobpl_const_189, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_8;


// .\v3\print_tokens2.c(385)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 385} true;
result.is_str_constant$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(380)
label_9:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 380} true;
//TAG: Dereferenced object is non-null
assert(PLUS(str, 1, i) != 0);
goto label_9_true , label_9_false ;


label_9_true :
assume (INT_EQ(Mem_T.CHAR[PLUS(str, 1, i)], 34));
assume value_is(__ctobpl_const_190, str);
assume value_is(__ctobpl_const_191, i);
assume value_is(__ctobpl_const_192, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_11;


label_9_false :
assume !(INT_EQ(Mem_T.CHAR[PLUS(str, 1, i)], 34));
assume value_is(__ctobpl_const_190, str);
assume value_is(__ctobpl_const_191, i);
assume value_is(__ctobpl_const_192, Mem_T.CHAR[PLUS(str, 1, i)]);
goto label_10;


// .\v3\print_tokens2.c(383)
label_10:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 383} true;
assume value_is(__ctobpl_const_193, i);
i := PLUS(i, 1, 1) ;
goto label_7_head;


// .\v3\print_tokens2.c(381)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 381} true;
result.is_str_constant$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(389)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 389} true;
return;

}



procedure {:extern}  is_token_end(str_com_id.__1:int, ch.__1:int) returns (result.is_token_end$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} ch : int;
var {:extern} ch1 : int;
var {:extern} $is_eof_token.arg.1$3$_123_$static$ : int;
var {:extern} $is_spec_symbol.arg.1$5$_123_$static$ : int;
var {:extern} result.is_eof_token$2 : int;
var {:extern} result.is_spec_symbol$4 : int;
var {:extern} str_com_id : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

ch:= 0;//Init locals 
call ch1 := __HAVOC_det_malloc(2);
$is_eof_token.arg.1$3$_123_$static$:= 0;//Init locals 
$is_spec_symbol.arg.1$5$_123_$static$:= 0;//Init locals 
result.is_eof_token$2:= 0;//Init locals 
result.is_spec_symbol$4:= 0;//Init locals 
result.is_token_end$1 := 0;//initialize returns 
str_com_id:= 0;//Init locals 
str_com_id := str_com_id.__1;
ch := ch.__1;
goto label_3;


// .\v3\print_tokens2.c(205)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 205} true;
goto label_4;


// .\v3\print_tokens2.c(206)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 206} true;
//TAG: Dereferenced object is non-null
assert(ch1 != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(ch1, 1, 0) := ch];
assume value_is(__ctobpl_const_194, Mem_T.CHAR[PLUS(ch1, 1, 0)]);
assume value_is(__ctobpl_const_195, ch);
goto label_5;


// .\v3\print_tokens2.c(207)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 207} true;
//TAG: Dereferenced object is non-null
assert(ch1 != 0);
Mem_T.CHAR := Mem_T.CHAR[PLUS(ch1, 1, 1) := 0];
assume value_is(__ctobpl_const_196, Mem_T.CHAR[PLUS(ch1, 1, 1)]);
goto label_6;


// .\v3\print_tokens2.c(208)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 208} true;
// skipped OP_UNARY assignment to array
goto label_7;


// .\v3\print_tokens2.c(208)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 208} true;
call result.is_eof_token$2 := is_eof_token ($is_eof_token.arg.1$3$_123_$static$);
goto label_10;


// .\v3\print_tokens2.c(208)
label_10:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 208} true;
goto label_10_true , label_10_false ;


label_10_true :
assume (INT_EQ(result.is_eof_token$2, 1));
assume value_is(__ctobpl_const_197, result.is_eof_token$2);
goto label_12;


label_10_false :
assume !(INT_EQ(result.is_eof_token$2, 1));
assume value_is(__ctobpl_const_197, result.is_eof_token$2);
goto label_11;


// .\v3\print_tokens2.c(209)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 209} true;
goto label_11_true , label_11_false ;


label_11_true :
assume (INT_EQ(str_com_id, 1));
assume value_is(__ctobpl_const_198, str_com_id);
goto label_14;


label_11_false :
assume !(INT_EQ(str_com_id, 1));
assume value_is(__ctobpl_const_198, str_com_id);
goto label_13;


// .\v3\print_tokens2.c(216)
label_13:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 216} true;
goto label_13_true , label_13_false ;


label_13_true :
assume (INT_EQ(str_com_id, 2));
assume value_is(__ctobpl_const_199, str_com_id);
goto label_18;


label_13_false :
assume !(INT_EQ(str_com_id, 2));
assume value_is(__ctobpl_const_199, str_com_id);
goto label_17;


// .\v3\print_tokens2.c(223)
label_17:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 223} true;
// skipped OP_UNARY assignment to array
goto label_21;


// .\v3\print_tokens2.c(223)
label_21:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 223} true;
call result.is_spec_symbol$4 := is_spec_symbol ($is_spec_symbol.arg.1$5$_123_$static$);
goto label_24;


// .\v3\print_tokens2.c(223)
label_24:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 223} true;
goto label_24_true , label_24_false ;


label_24_true :
assume (INT_EQ(result.is_spec_symbol$4, 1));
assume value_is(__ctobpl_const_200, result.is_spec_symbol$4);
goto label_26;


label_24_false :
assume !(INT_EQ(result.is_spec_symbol$4, 1));
assume value_is(__ctobpl_const_200, result.is_spec_symbol$4);
goto label_25;


// .\v3\print_tokens2.c(224)
label_25:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 224} true;
goto label_25_true , label_25_false ;


label_25_true :
assume (INT_EQ(ch, 32));
assume value_is(__ctobpl_const_201, ch);
goto label_28;


label_25_false :
assume !(INT_EQ(ch, 32));
assume value_is(__ctobpl_const_201, ch);
goto label_27;


// .\v3\print_tokens2.c(224)
label_27:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 224} true;
goto label_27_true , label_27_false ;


label_27_true :
assume (INT_EQ(ch, 10));
assume value_is(__ctobpl_const_202, ch);
goto label_28;


label_27_false :
assume !(INT_EQ(ch, 10));
assume value_is(__ctobpl_const_202, ch);
goto label_29;


// .\v3\print_tokens2.c(224)
label_29:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 224} true;
goto label_29_true , label_29_false ;


label_29_true :
assume (INT_EQ(ch, 59));
assume value_is(__ctobpl_const_203, ch);
goto label_28;


label_29_false :
assume !(INT_EQ(ch, 59));
assume value_is(__ctobpl_const_203, ch);
goto label_30;


// .\v3\print_tokens2.c(226)
label_30:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 226} true;
result.is_token_end$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(224)
label_28:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 224} true;
result.is_token_end$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(223)
label_26:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 223} true;
result.is_token_end$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(217)
label_18:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 217} true;
goto label_18_true , label_18_false ;


label_18_true :
assume (INT_EQ(ch, 10));
assume value_is(__ctobpl_const_204, ch);
goto label_20;


label_18_false :
assume !(INT_EQ(ch, 10));
assume value_is(__ctobpl_const_204, ch);
goto label_19;


// .\v3\print_tokens2.c(220)
label_19:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 220} true;
result.is_token_end$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(218)
label_20:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 218} true;
result.is_token_end$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(210)
label_14:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 210} true;
goto label_14_true , label_14_false ;


label_14_true :
assume (BIT_BOR(LIFT(INT_EQ(ch, 34)), LIFT(INT_EQ(ch, 10))) != 0);
assume value_is(__ctobpl_const_205, ch);
assume value_is(__ctobpl_const_206, ch);
goto label_16;


label_14_false :
assume (BIT_BOR(LIFT(INT_EQ(ch, 34)), LIFT(INT_EQ(ch, 10))) == 0);
assume value_is(__ctobpl_const_205, ch);
assume value_is(__ctobpl_const_206, ch);
goto label_15;


// .\v3\print_tokens2.c(213)
label_15:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 213} true;
result.is_token_end$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(211)
label_16:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 211} true;
result.is_token_end$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(208)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 208} true;
result.is_token_end$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(227)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 227} true;
call __HAVOC_free(ch1);
return;


// .\v3\print_tokens2.c(227)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 227} true;
assume false;
return;

}



procedure {:extern}  main(argc.__1:int, argv.__1:int) returns (result.main$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} argc : int;
var {:extern} argv : int;
var {:extern} fname : int;
var {:extern} $fprintf.arg.1$5$ : int;
var {:extern} result.__iob_func$4 : int;
var {:extern} result.exit$6 : int;
var {:extern} result.exit$13 : int;
var {:extern} result.fprintf$3 : int;
var {:extern} result.get_token$8 : int;
var {:extern} result.get_token$11 : int;
var {:extern} result.is_eof_token$9 : int;
var {:extern} result.malloc$2 : int;
var {:extern} result.open_token_stream$7 : int;
var {:extern} result.print_token$10 : int;
var {:extern} result.print_token$12 : int;
var {:extern} tok : int;
var {:extern} tp : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(argv.__1, alloc);
argc:= 0;//Init locals 
argv:= 0;//Init locals 
fname:= 0;//Init locals 
$fprintf.arg.1$5$:= 0;//Init locals 
result.__iob_func$4:= 0;//Init locals 
result.exit$6:= 0;//Init locals 
result.exit$13:= 0;//Init locals 
result.fprintf$3:= 0;//Init locals 
result.get_token$8:= 0;//Init locals 
result.get_token$11:= 0;//Init locals 
result.is_eof_token$9:= 0;//Init locals 
result.main$1 := 0;//initialize returns 
result.malloc$2:= 0;//Init locals 
result.open_token_stream$7:= 0;//Init locals 
result.print_token$10:= 0;//Init locals 
result.print_token$12:= 0;//Init locals 
tok:= 0;//Init locals 
tp:= 0;//Init locals 
argc := argc.__1;
argv := argv.__1;
goto label_3;


// .\v3\print_tokens2.c(24)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 24} true;
goto label_4;


// .\v3\print_tokens2.c(25)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 25} true;
goto label_5;


// .\v3\print_tokens2.c(26)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 26} true;
goto label_6;


// .\v3\print_tokens2.c(27)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 27} true;
goto label_6_true , label_6_false ;


label_6_true :
assume (INT_EQ(argc, 1));
assume value_is(__ctobpl_const_207, argc);
goto label_8;


label_6_false :
assume !(INT_EQ(argc, 1));
assume value_is(__ctobpl_const_207, argc);
goto label_7;


// .\v3\print_tokens2.c(32)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 32} true;
goto label_7_true , label_7_false ;


label_7_true :
assume (INT_EQ(argc, 2));
assume value_is(__ctobpl_const_208, argc);
goto label_41;


label_7_false :
assume !(INT_EQ(argc, 2));
assume value_is(__ctobpl_const_208, argc);
goto label_38;


// .\v3\print_tokens2.c(35)
label_38:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 35} true;
call result.__iob_func$4 := __iob_func ();
goto label_42;


// .\v3\print_tokens2.c(35)
label_42:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 35} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$4 != 0);
$fprintf.arg.1$5$ := PLUS(result.__iob_func$4, 32, 1) ;
assume value_is(__ctobpl_const_209, $fprintf.arg.1$5$);
assume value_is(__ctobpl_const_210, result.__iob_func$4);
goto label_43;


// .\v3\print_tokens2.c(35)
label_43:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 35} true;
call result.fprintf$3 := det_choice(); // havoc result.fprintf$3;
// skip fprintf
goto label_46;


// .\v3\print_tokens2.c(36)
label_46:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 36} true;
call result.exit$6 := det_choice(); // havoc result.exit$6;
// skip exit
return;


// .\v3\print_tokens2.c(33)
label_41:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 33} true;
//TAG: Dereferenced object is non-null
assert(argv != 0);
fname := Mem_T.PCHAR[PLUS(argv, 4, 1)] ;
assume value_is(__ctobpl_const_211, fname);
assume value_is(__ctobpl_const_212, argv);
assume value_is(__ctobpl_const_213, Mem_T.PCHAR[PLUS(argv, 4, 1)]);
goto label_13;


// .\v3\print_tokens2.c(29)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 29} true;
call result.malloc$2 := __HAVOC_det_malloc (1);
goto label_11;


// .\v3\print_tokens2.c(29)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 29} true;
fname := result.malloc$2 ;
assume value_is(__ctobpl_const_214, fname);
assume value_is(__ctobpl_const_215, result.malloc$2);
goto label_12;


// .\v3\print_tokens2.c(30)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 30} true;
//TAG: Dereferenced object is non-null
assert(fname != 0);
Mem_T.CHAR := Mem_T.CHAR[fname := 0];
assume value_is(__ctobpl_const_216, fname);
assume value_is(__ctobpl_const_217, Mem_T.CHAR[fname]);
goto label_13;


// .\v3\print_tokens2.c(38)
label_13:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 38} true;
call result.open_token_stream$7 := open_token_stream (fname);
assume value_is(__ctobpl_const_218, fname);
assume value_is(__ctobpl_const_219, fname);
goto label_16;


// .\v3\print_tokens2.c(38)
label_16:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 38} true;
tp := result.open_token_stream$7 ;
assume value_is(__ctobpl_const_220, tp);
assume value_is(__ctobpl_const_221, result.open_token_stream$7);
goto label_17;


// .\v3\print_tokens2.c(39)
label_17:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 39} true;
call result.get_token$8 := get_token (tp);
assume value_is(__ctobpl_const_222, tp);
assume value_is(__ctobpl_const_223, tp);
goto label_20;


// .\v3\print_tokens2.c(39)
label_20:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 39} true;
tok := result.get_token$8 ;
assume value_is(__ctobpl_const_224, tok);
assume value_is(__ctobpl_const_225, result.get_token$8);
goto label_21;


// .\v3\print_tokens2.c(40)
label_21:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 40} true;
// loop entry initialization...
goto label_21_head;


label_21_head:
// loop head assertions...

// end loop head assertions

call result.is_eof_token$9 := is_eof_token (tok);
assume value_is(__ctobpl_const_226, tok);
assume value_is(__ctobpl_const_227, tok);
goto label_24;


// .\v3\print_tokens2.c(40)
label_24:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 40} true;
goto label_24_true , label_24_false ;


label_24_true :
assume (result.is_eof_token$9 != 0);
assume value_is(__ctobpl_const_228, result.is_eof_token$9);
goto label_28;


label_24_false :
assume (result.is_eof_token$9 == 0);
assume value_is(__ctobpl_const_228, result.is_eof_token$9);
goto label_25;


// .\v3\print_tokens2.c(42)
label_25:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 42} true;
call result.print_token$10 := print_token (tok);
assume value_is(__ctobpl_const_229, tok);
assume value_is(__ctobpl_const_230, tok);
goto label_34;


// .\v3\print_tokens2.c(43)
label_34:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 43} true;
call result.get_token$11 := get_token (tp);
assume value_is(__ctobpl_const_231, tp);
assume value_is(__ctobpl_const_232, tp);
goto label_37;


// .\v3\print_tokens2.c(43)
label_37:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 43} true;
tok := result.get_token$11 ;
assume value_is(__ctobpl_const_233, tok);
assume value_is(__ctobpl_const_234, result.get_token$11);
goto label_21_head;


// .\v3\print_tokens2.c(45)
label_28:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 45} true;
call result.print_token$12 := print_token (tok);
assume value_is(__ctobpl_const_235, tok);
assume value_is(__ctobpl_const_236, tok);
goto label_31;


// .\v3\print_tokens2.c(46)
label_31:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 46} true;
call result.exit$13 := det_choice(); // havoc result.exit$13;
// skip exit
return;


// .\v3\print_tokens2.c(47)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 47} true;
assume false;
return;

}



procedure {:extern}  open_character_stream(fname.__1:int) returns (result.open_character_stream$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} fname : int;
var {:extern} fp : int;
var {:extern} $fprintf.arg.1$6$ : int;
var {:extern} result.__iob_func$2 : int;
var {:extern} result.__iob_func$5 : int;
var {:extern} result.exit$7 : int;
var {:extern} result.fopen$3 : int;
var {:extern} result.fprintf$4 : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(fname.__1, alloc);
fname:= 0;//Init locals 
fp:= 0;//Init locals 
$fprintf.arg.1$6$:= 0;//Init locals 
result.__iob_func$2:= 0;//Init locals 
result.__iob_func$5:= 0;//Init locals 
result.exit$7:= 0;//Init locals 
result.fopen$3:= 0;//Init locals 
result.fprintf$4:= 0;//Init locals 
result.open_character_stream$1 := 0;//initialize returns 
fname := fname.__1;
goto label_3;


// .\v3\print_tokens2.c(61)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 61} true;
goto label_4;


// .\v3\print_tokens2.c(62)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 62} true;
goto label_4_true , label_4_false ;


label_4_true :
assume (fname != 0);
assume value_is(__ctobpl_const_237, fname);
goto label_8;


label_4_false :
assume (fname == 0);
assume value_is(__ctobpl_const_237, fname);
goto label_5;


// .\v3\print_tokens2.c(63)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 63} true;
call result.__iob_func$2 := __iob_func ();
goto label_24;


// .\v3\print_tokens2.c(63)
label_24:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 63} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$2 != 0);
fp := PLUS(result.__iob_func$2, 32, 0) ;
assume value_is(__ctobpl_const_238, fp);
assume value_is(__ctobpl_const_239, result.__iob_func$2);
goto label_16;


// .\v3\print_tokens2.c(64)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 64} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.fopen$3 := fopen (fname, havoc_stringTemp);
assume value_is(__ctobpl_const_240, fname);
assume value_is(__ctobpl_const_241, fname);
goto label_11;


// .\v3\print_tokens2.c(64)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 64} true;
fp := result.fopen$3 ;
assume value_is(__ctobpl_const_242, fp);
assume value_is(__ctobpl_const_243, result.fopen$3);
goto label_12;


// .\v3\print_tokens2.c(64)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 64} true;
goto label_12_true , label_12_false ;


label_12_true :
assume (fp != 0);
assume value_is(__ctobpl_const_244, fp);
goto label_16;


label_12_false :
assume (fp == 0);
assume value_is(__ctobpl_const_244, fp);
goto label_13;


// .\v3\print_tokens2.c(66)
label_13:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 66} true;
call result.__iob_func$5 := __iob_func ();
goto label_17;


// .\v3\print_tokens2.c(66)
label_17:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 66} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$5 != 0);
$fprintf.arg.1$6$ := PLUS(result.__iob_func$5, 32, 1) ;
assume value_is(__ctobpl_const_245, $fprintf.arg.1$6$);
assume value_is(__ctobpl_const_246, result.__iob_func$5);
goto label_18;


// .\v3\print_tokens2.c(66)
label_18:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 66} true;
call result.fprintf$4 := det_choice(); // havoc result.fprintf$4;
// skip fprintf
goto label_21;


// .\v3\print_tokens2.c(67)
label_21:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 67} true;
call result.exit$7 := det_choice(); // havoc result.exit$7;
// skip exit
return;


// .\v3\print_tokens2.c(69)
label_16:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 69} true;
result.open_character_stream$1 := fp ;
assume value_is(__ctobpl_const_247, fp);
goto label_1;


// .\v3\print_tokens2.c(70)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 70} true;
return;


// .\v3\print_tokens2.c(70)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 70} true;
assume false;
return;

}



procedure {:extern}  open_token_stream(fname.__1:int) returns (result.open_token_stream$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} fname : int;
var {:extern} fp : int;
var {:extern} result.open_character_stream$3 : int;
var {:extern} result.open_character_stream$4 : int;
var {:extern} result.strcmp$2 : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(fname.__1, alloc);
fname:= 0;//Init locals 
fp:= 0;//Init locals 
result.open_character_stream$3:= 0;//Init locals 
result.open_character_stream$4:= 0;//Init locals 
result.open_token_stream$1 := 0;//initialize returns 
result.strcmp$2:= 0;//Init locals 
fname := fname.__1;
goto label_3;


// .\v3\print_tokens2.c(130)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 130} true;
goto label_4;


// .\v3\print_tokens2.c(131)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 131} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$2 := strcmp (fname, havoc_stringTemp);
assume value_is(__ctobpl_const_248, fname);
assume value_is(__ctobpl_const_249, fname);
goto label_7;


// .\v3\print_tokens2.c(131)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 131} true;
goto label_7_true , label_7_false ;


label_7_true :
assume (result.strcmp$2 != 0);
assume value_is(__ctobpl_const_250, result.strcmp$2);
goto label_11;


label_7_false :
assume (result.strcmp$2 == 0);
assume value_is(__ctobpl_const_250, result.strcmp$2);
goto label_8;


// .\v3\print_tokens2.c(132)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 132} true;
call result.open_character_stream$3 := open_character_stream (0);
goto label_16;


// .\v3\print_tokens2.c(132)
label_16:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 132} true;
fp := result.open_character_stream$3 ;
assume value_is(__ctobpl_const_251, fp);
assume value_is(__ctobpl_const_252, result.open_character_stream$3);
goto label_15;


// .\v3\print_tokens2.c(134)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 134} true;
call result.open_character_stream$4 := open_character_stream (fname);
assume value_is(__ctobpl_const_253, fname);
assume value_is(__ctobpl_const_254, fname);
goto label_14;


// .\v3\print_tokens2.c(134)
label_14:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 134} true;
fp := result.open_character_stream$4 ;
assume value_is(__ctobpl_const_255, fp);
assume value_is(__ctobpl_const_256, result.open_character_stream$4);
goto label_15;


// .\v3\print_tokens2.c(135)
label_15:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 135} true;
result.open_token_stream$1 := fp ;
assume value_is(__ctobpl_const_257, fp);
goto label_1;


// .\v3\print_tokens2.c(136)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 136} true;
return;


// .\v3\print_tokens2.c(136)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 136} true;
assume false;
return;

}



procedure {:extern}  print_spec_symbol(str.__1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fprintf.arg.1$12$_123_$static$ : int;
var {:extern} $fprintf.arg.1$16$_123_$static$ : int;
var {:extern} $fprintf.arg.1$20$_123_$static$ : int;
var {:extern} $fprintf.arg.1$24$_123_$static$ : int;
var {:extern} $fprintf.arg.1$27$_123_$static$ : int;
var {:extern} $fprintf.arg.1$4$_123_$static$ : int;
var {:extern} $fprintf.arg.1$8$_123_$static$ : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.__iob_func$7 : int;
var {:extern} result.__iob_func$11 : int;
var {:extern} result.__iob_func$15 : int;
var {:extern} result.__iob_func$19 : int;
var {:extern} result.__iob_func$23 : int;
var {:extern} result.__iob_func$26 : int;
var {:extern} result.fprintf$2 : int;
var {:extern} result.fprintf$6 : int;
var {:extern} result.fprintf$10 : int;
var {:extern} result.fprintf$14 : int;
var {:extern} result.fprintf$18 : int;
var {:extern} result.fprintf$22 : int;
var {:extern} result.fprintf$25 : int;
var {:extern} result.strcmp$1 : int;
var {:extern} result.strcmp$5 : int;
var {:extern} result.strcmp$9 : int;
var {:extern} result.strcmp$13 : int;
var {:extern} result.strcmp$17 : int;
var {:extern} result.strcmp$21 : int;
var {:extern} str : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(str.__1, alloc);
$fprintf.arg.1$12$_123_$static$:= 0;//Init locals 
$fprintf.arg.1$16$_123_$static$:= 0;//Init locals 
$fprintf.arg.1$20$_123_$static$:= 0;//Init locals 
$fprintf.arg.1$24$_123_$static$:= 0;//Init locals 
$fprintf.arg.1$27$_123_$static$:= 0;//Init locals 
$fprintf.arg.1$4$_123_$static$:= 0;//Init locals 
$fprintf.arg.1$8$_123_$static$:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.__iob_func$7:= 0;//Init locals 
result.__iob_func$11:= 0;//Init locals 
result.__iob_func$15:= 0;//Init locals 
result.__iob_func$19:= 0;//Init locals 
result.__iob_func$23:= 0;//Init locals 
result.__iob_func$26:= 0;//Init locals 
result.fprintf$2:= 0;//Init locals 
result.fprintf$6:= 0;//Init locals 
result.fprintf$10:= 0;//Init locals 
result.fprintf$14:= 0;//Init locals 
result.fprintf$18:= 0;//Init locals 
result.fprintf$22:= 0;//Init locals 
result.fprintf$25:= 0;//Init locals 
result.strcmp$1:= 0;//Init locals 
result.strcmp$5:= 0;//Init locals 
result.strcmp$9:= 0;//Init locals 
result.strcmp$13:= 0;//Init locals 
result.strcmp$17:= 0;//Init locals 
result.strcmp$21:= 0;//Init locals 
str:= 0;//Init locals 
str := str.__1;
goto label_3;


// .\v3\print_tokens2.c(435)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 435} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$1 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_258, str);
assume value_is(__ctobpl_const_259, str);
goto label_6;


// .\v3\print_tokens2.c(435)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 435} true;
goto label_6_true , label_6_false ;


label_6_true :
assume (result.strcmp$1 != 0);
assume value_is(__ctobpl_const_260, result.strcmp$1);
goto label_10;


label_6_false :
assume (result.strcmp$1 == 0);
assume value_is(__ctobpl_const_260, result.strcmp$1);
goto label_7;


// .\v3\print_tokens2.c(437)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 437} true;
call result.__iob_func$3 := __iob_func ();
goto label_77;


// .\v3\print_tokens2.c(437)
label_77:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 437} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
$fprintf.arg.1$4$_123_$static$ := PLUS(result.__iob_func$3, 32, 1) ;
assume value_is(__ctobpl_const_261, $fprintf.arg.1$4$_123_$static$);
assume value_is(__ctobpl_const_262, result.__iob_func$3);
goto label_78;


// .\v3\print_tokens2.c(437)
label_78:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 437} true;
call result.fprintf$2 := det_choice(); // havoc result.fprintf$2;
// skip fprintf
goto label_81;


// .\v3\print_tokens2.c(438)
label_81:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 438} true;
goto label_1;


// .\v3\print_tokens2.c(440)
label_10:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 440} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$5 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_263, str);
assume value_is(__ctobpl_const_264, str);
goto label_13;


// .\v3\print_tokens2.c(440)
label_13:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 440} true;
goto label_13_true , label_13_false ;


label_13_true :
assume (result.strcmp$5 != 0);
assume value_is(__ctobpl_const_265, result.strcmp$5);
goto label_17;


label_13_false :
assume (result.strcmp$5 == 0);
assume value_is(__ctobpl_const_265, result.strcmp$5);
goto label_14;


// .\v3\print_tokens2.c(442)
label_14:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 442} true;
call result.__iob_func$7 := __iob_func ();
goto label_72;


// .\v3\print_tokens2.c(442)
label_72:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 442} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$7 != 0);
$fprintf.arg.1$8$_123_$static$ := PLUS(result.__iob_func$7, 32, 1) ;
assume value_is(__ctobpl_const_266, $fprintf.arg.1$8$_123_$static$);
assume value_is(__ctobpl_const_267, result.__iob_func$7);
goto label_73;


// .\v3\print_tokens2.c(442)
label_73:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 442} true;
call result.fprintf$6 := det_choice(); // havoc result.fprintf$6;
// skip fprintf
goto label_76;


// .\v3\print_tokens2.c(443)
label_76:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 443} true;
goto label_1;


// .\v3\print_tokens2.c(445)
label_17:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 445} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$9 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_268, str);
assume value_is(__ctobpl_const_269, str);
goto label_20;


// .\v3\print_tokens2.c(445)
label_20:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 445} true;
goto label_20_true , label_20_false ;


label_20_true :
assume (result.strcmp$9 != 0);
assume value_is(__ctobpl_const_270, result.strcmp$9);
goto label_24;


label_20_false :
assume (result.strcmp$9 == 0);
assume value_is(__ctobpl_const_270, result.strcmp$9);
goto label_21;


// .\v3\print_tokens2.c(447)
label_21:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 447} true;
call result.__iob_func$11 := __iob_func ();
goto label_67;


// .\v3\print_tokens2.c(447)
label_67:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 447} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$11 != 0);
$fprintf.arg.1$12$_123_$static$ := PLUS(result.__iob_func$11, 32, 1) ;
assume value_is(__ctobpl_const_271, $fprintf.arg.1$12$_123_$static$);
assume value_is(__ctobpl_const_272, result.__iob_func$11);
goto label_68;


// .\v3\print_tokens2.c(447)
label_68:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 447} true;
call result.fprintf$10 := det_choice(); // havoc result.fprintf$10;
// skip fprintf
goto label_71;


// .\v3\print_tokens2.c(448)
label_71:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 448} true;
goto label_1;


// .\v3\print_tokens2.c(450)
label_24:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 450} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$13 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_273, str);
assume value_is(__ctobpl_const_274, str);
goto label_27;


// .\v3\print_tokens2.c(450)
label_27:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 450} true;
goto label_27_true , label_27_false ;


label_27_true :
assume (result.strcmp$13 != 0);
assume value_is(__ctobpl_const_275, result.strcmp$13);
goto label_31;


label_27_false :
assume (result.strcmp$13 == 0);
assume value_is(__ctobpl_const_275, result.strcmp$13);
goto label_28;


// .\v3\print_tokens2.c(452)
label_28:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 452} true;
call result.__iob_func$15 := __iob_func ();
goto label_62;


// .\v3\print_tokens2.c(452)
label_62:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 452} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$15 != 0);
$fprintf.arg.1$16$_123_$static$ := PLUS(result.__iob_func$15, 32, 1) ;
assume value_is(__ctobpl_const_276, $fprintf.arg.1$16$_123_$static$);
assume value_is(__ctobpl_const_277, result.__iob_func$15);
goto label_63;


// .\v3\print_tokens2.c(452)
label_63:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 452} true;
call result.fprintf$14 := det_choice(); // havoc result.fprintf$14;
// skip fprintf
goto label_66;


// .\v3\print_tokens2.c(453)
label_66:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 453} true;
goto label_1;


// .\v3\print_tokens2.c(455)
label_31:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 455} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$17 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_278, str);
assume value_is(__ctobpl_const_279, str);
goto label_34;


// .\v3\print_tokens2.c(455)
label_34:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 455} true;
goto label_34_true , label_34_false ;


label_34_true :
assume (result.strcmp$17 != 0);
assume value_is(__ctobpl_const_280, result.strcmp$17);
goto label_38;


label_34_false :
assume (result.strcmp$17 == 0);
assume value_is(__ctobpl_const_280, result.strcmp$17);
goto label_35;


// .\v3\print_tokens2.c(457)
label_35:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 457} true;
call result.__iob_func$19 := __iob_func ();
goto label_57;


// .\v3\print_tokens2.c(457)
label_57:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 457} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$19 != 0);
$fprintf.arg.1$20$_123_$static$ := PLUS(result.__iob_func$19, 32, 1) ;
assume value_is(__ctobpl_const_281, $fprintf.arg.1$20$_123_$static$);
assume value_is(__ctobpl_const_282, result.__iob_func$19);
goto label_58;


// .\v3\print_tokens2.c(457)
label_58:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 457} true;
call result.fprintf$18 := det_choice(); // havoc result.fprintf$18;
// skip fprintf
goto label_61;


// .\v3\print_tokens2.c(458)
label_61:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 458} true;
goto label_1;


// .\v3\print_tokens2.c(460)
label_38:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 460} true;
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
//OmitStringMalloc 
// call havoc_stringTemp := __HAVOC_det_malloc(1);
call result.strcmp$21 := strcmp (str, havoc_stringTemp);
assume value_is(__ctobpl_const_283, str);
assume value_is(__ctobpl_const_284, str);
goto label_41;


// .\v3\print_tokens2.c(460)
label_41:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 460} true;
goto label_41_true , label_41_false ;


label_41_true :
assume (result.strcmp$21 != 0);
assume value_is(__ctobpl_const_285, result.strcmp$21);
goto label_45;


label_41_false :
assume (result.strcmp$21 == 0);
assume value_is(__ctobpl_const_285, result.strcmp$21);
goto label_42;


// .\v3\print_tokens2.c(462)
label_42:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 462} true;
call result.__iob_func$23 := __iob_func ();
goto label_52;


// .\v3\print_tokens2.c(462)
label_52:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 462} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$23 != 0);
$fprintf.arg.1$24$_123_$static$ := PLUS(result.__iob_func$23, 32, 1) ;
assume value_is(__ctobpl_const_286, $fprintf.arg.1$24$_123_$static$);
assume value_is(__ctobpl_const_287, result.__iob_func$23);
goto label_53;


// .\v3\print_tokens2.c(462)
label_53:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 462} true;
call result.fprintf$22 := det_choice(); // havoc result.fprintf$22;
// skip fprintf
goto label_56;


// .\v3\print_tokens2.c(463)
label_56:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 463} true;
goto label_1;


// .\v3\print_tokens2.c(466)
label_45:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 466} true;
call result.__iob_func$26 := __iob_func ();
goto label_48;


// .\v3\print_tokens2.c(466)
label_48:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 466} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$26 != 0);
$fprintf.arg.1$27$_123_$static$ := PLUS(result.__iob_func$26, 32, 1) ;
assume value_is(__ctobpl_const_288, $fprintf.arg.1$27$_123_$static$);
assume value_is(__ctobpl_const_289, result.__iob_func$26);
goto label_49;


// .\v3\print_tokens2.c(466)
label_49:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 466} true;
call result.fprintf$25 := det_choice(); // havoc result.fprintf$25;
// skip fprintf
goto label_1;


// .\v3\print_tokens2.c(467)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 467} true;
return;


// .\v3\print_tokens2.c(467)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 467} true;
assume false;
return;

}



procedure {:extern}  print_token(tok.__1:int) returns (result.print_token$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} $fprintf.arg.1$11$ : int;
var {:extern} $fprintf.arg.1$14$ : int;
var {:extern} $fprintf.arg.1$17$ : int;
var {:extern} $fprintf.arg.1$20$ : int;
var {:extern} $fprintf.arg.1$23$ : int;
var {:extern} $fprintf.arg.1$5$ : int;
var {:extern} $fprintf.arg.1$8$ : int;
var {:extern} result.__iob_func$4 : int;
var {:extern} result.__iob_func$7 : int;
var {:extern} result.__iob_func$10 : int;
var {:extern} result.__iob_func$13 : int;
var {:extern} result.__iob_func$16 : int;
var {:extern} result.__iob_func$19 : int;
var {:extern} result.__iob_func$22 : int;
var {:extern} result.fprintf$3 : int;
var {:extern} result.fprintf$6 : int;
var {:extern} result.fprintf$9 : int;
var {:extern} result.fprintf$12 : int;
var {:extern} result.fprintf$15 : int;
var {:extern} result.fprintf$18 : int;
var {:extern} result.fprintf$21 : int;
var {:extern} result.token_type$2 : int;
var {:extern} tok : int;
var {:extern} typea : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(tok.__1, alloc);
$fprintf.arg.1$11$:= 0;//Init locals 
$fprintf.arg.1$14$:= 0;//Init locals 
$fprintf.arg.1$17$:= 0;//Init locals 
$fprintf.arg.1$20$:= 0;//Init locals 
$fprintf.arg.1$23$:= 0;//Init locals 
$fprintf.arg.1$5$:= 0;//Init locals 
$fprintf.arg.1$8$:= 0;//Init locals 
result.__iob_func$4:= 0;//Init locals 
result.__iob_func$7:= 0;//Init locals 
result.__iob_func$10:= 0;//Init locals 
result.__iob_func$13:= 0;//Init locals 
result.__iob_func$16:= 0;//Init locals 
result.__iob_func$19:= 0;//Init locals 
result.__iob_func$22:= 0;//Init locals 
result.fprintf$3:= 0;//Init locals 
result.fprintf$6:= 0;//Init locals 
result.fprintf$9:= 0;//Init locals 
result.fprintf$12:= 0;//Init locals 
result.fprintf$15:= 0;//Init locals 
result.fprintf$18:= 0;//Init locals 
result.fprintf$21:= 0;//Init locals 
result.print_token$1 := 0;//initialize returns 
result.token_type$2:= 0;//Init locals 
tok:= 0;//Init locals 
typea:= 0;//Init locals 
tok := tok.__1;
goto label_3;


// .\v3\print_tokens2.c(258)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 258} true;
goto label_4;


// .\v3\print_tokens2.c(259)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 259} true;
call result.token_type$2 := token_type (tok);
assume value_is(__ctobpl_const_290, tok);
assume value_is(__ctobpl_const_291, tok);
goto label_7;


// .\v3\print_tokens2.c(259)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 259} true;
typea := result.token_type$2 ;
assume value_is(__ctobpl_const_292, typea);
assume value_is(__ctobpl_const_293, result.token_type$2);
goto label_8;


// .\v3\print_tokens2.c(260)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 260} true;
goto label_8_true , label_8_false ;


label_8_true :
assume (typea != 0);
assume value_is(__ctobpl_const_294, typea);
goto label_12;


label_8_false :
assume (typea == 0);
assume value_is(__ctobpl_const_294, typea);
goto label_9;


// .\v3\print_tokens2.c(261)
label_9:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 261} true;
call result.__iob_func$4 := __iob_func ();
goto label_65;


// .\v3\print_tokens2.c(261)
label_65:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 261} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$4 != 0);
$fprintf.arg.1$5$ := PLUS(result.__iob_func$4, 32, 1) ;
assume value_is(__ctobpl_const_295, $fprintf.arg.1$5$);
assume value_is(__ctobpl_const_296, result.__iob_func$4);
goto label_66;


// .\v3\print_tokens2.c(261)
label_66:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 261} true;
call result.fprintf$3 := det_choice(); // havoc result.fprintf$3;
// skip fprintf
goto label_12;


// .\v3\print_tokens2.c(263)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 263} true;
goto label_12_true , label_12_false ;


label_12_true :
assume (INT_EQ(typea, 1));
assume value_is(__ctobpl_const_297, typea);
goto label_14;


label_12_false :
assume !(INT_EQ(typea, 1));
assume value_is(__ctobpl_const_297, typea);
goto label_13;


// .\v3\print_tokens2.c(264)
label_14:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 264} true;
call result.__iob_func$7 := __iob_func ();
goto label_17;


// .\v3\print_tokens2.c(264)
label_17:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 264} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$7 != 0);
$fprintf.arg.1$8$ := PLUS(result.__iob_func$7, 32, 1) ;
assume value_is(__ctobpl_const_298, $fprintf.arg.1$8$);
assume value_is(__ctobpl_const_299, result.__iob_func$7);
goto label_18;


// .\v3\print_tokens2.c(264)
label_18:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 264} true;
call result.fprintf$6 := det_choice(); // havoc result.fprintf$6;
// skip fprintf
goto label_13;


// .\v3\print_tokens2.c(266)
label_13:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 266} true;
goto label_13_true , label_13_false ;


label_13_true :
assume (INT_EQ(typea, 2));
assume value_is(__ctobpl_const_300, typea);
goto label_22;


label_13_false :
assume !(INT_EQ(typea, 2));
assume value_is(__ctobpl_const_300, typea);
goto label_21;


// .\v3\print_tokens2.c(266)
label_22:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 266} true;
call print_spec_symbol (tok);
assume value_is(__ctobpl_const_301, tok);
assume value_is(__ctobpl_const_302, tok);
goto label_21;


// .\v3\print_tokens2.c(267)
label_21:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 267} true;
goto label_21_true , label_21_false ;


label_21_true :
assume (INT_EQ(typea, 3));
assume value_is(__ctobpl_const_303, typea);
goto label_26;


label_21_false :
assume !(INT_EQ(typea, 3));
assume value_is(__ctobpl_const_303, typea);
goto label_25;


// .\v3\print_tokens2.c(268)
label_26:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 268} true;
call result.__iob_func$10 := __iob_func ();
goto label_29;


// .\v3\print_tokens2.c(268)
label_29:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 268} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$10 != 0);
$fprintf.arg.1$11$ := PLUS(result.__iob_func$10, 32, 1) ;
assume value_is(__ctobpl_const_304, $fprintf.arg.1$11$);
assume value_is(__ctobpl_const_305, result.__iob_func$10);
goto label_30;


// .\v3\print_tokens2.c(268)
label_30:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 268} true;
call result.fprintf$9 := det_choice(); // havoc result.fprintf$9;
// skip fprintf
goto label_25;


// .\v3\print_tokens2.c(270)
label_25:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 270} true;
goto label_25_true , label_25_false ;


label_25_true :
assume (INT_EQ(typea, 41));
assume value_is(__ctobpl_const_306, typea);
goto label_34;


label_25_false :
assume !(INT_EQ(typea, 41));
assume value_is(__ctobpl_const_306, typea);
goto label_33;


// .\v3\print_tokens2.c(271)
label_34:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 271} true;
call result.__iob_func$13 := __iob_func ();
goto label_37;


// .\v3\print_tokens2.c(271)
label_37:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 271} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$13 != 0);
$fprintf.arg.1$14$ := PLUS(result.__iob_func$13, 32, 1) ;
assume value_is(__ctobpl_const_307, $fprintf.arg.1$14$);
assume value_is(__ctobpl_const_308, result.__iob_func$13);
goto label_38;


// .\v3\print_tokens2.c(271)
label_38:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 271} true;
call result.fprintf$12 := det_choice(); // havoc result.fprintf$12;
// skip fprintf
goto label_33;


// .\v3\print_tokens2.c(273)
label_33:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 273} true;
goto label_33_true , label_33_false ;


label_33_true :
assume (INT_EQ(typea, 42));
assume value_is(__ctobpl_const_309, typea);
goto label_42;


label_33_false :
assume !(INT_EQ(typea, 42));
assume value_is(__ctobpl_const_309, typea);
goto label_41;


// .\v3\print_tokens2.c(274)
label_42:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 274} true;
call result.__iob_func$16 := __iob_func ();
goto label_45;


// .\v3\print_tokens2.c(274)
label_45:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 274} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$16 != 0);
$fprintf.arg.1$17$ := PLUS(result.__iob_func$16, 32, 1) ;
assume value_is(__ctobpl_const_310, $fprintf.arg.1$17$);
assume value_is(__ctobpl_const_311, result.__iob_func$16);
goto label_46;


// .\v3\print_tokens2.c(274)
label_46:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 274} true;
call result.fprintf$15 := det_choice(); // havoc result.fprintf$15;
// skip fprintf
goto label_41;


// .\v3\print_tokens2.c(276)
label_41:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 276} true;
goto label_41_true , label_41_false ;


label_41_true :
assume (INT_EQ(typea, 43));
assume value_is(__ctobpl_const_312, typea);
goto label_50;


label_41_false :
assume !(INT_EQ(typea, 43));
assume value_is(__ctobpl_const_312, typea);
goto label_49;


// .\v3\print_tokens2.c(277)
label_50:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 277} true;
tok := PLUS(tok, 1, 1) ;
assume value_is(__ctobpl_const_313, tok);
assume value_is(__ctobpl_const_314, tok);
goto label_51;


// .\v3\print_tokens2.c(278)
label_51:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 278} true;
call result.__iob_func$19 := __iob_func ();
goto label_54;


// .\v3\print_tokens2.c(278)
label_54:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 278} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$19 != 0);
$fprintf.arg.1$20$ := PLUS(result.__iob_func$19, 32, 1) ;
assume value_is(__ctobpl_const_315, $fprintf.arg.1$20$);
assume value_is(__ctobpl_const_316, result.__iob_func$19);
goto label_55;


// .\v3\print_tokens2.c(278)
label_55:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 278} true;
call result.fprintf$18 := det_choice(); // havoc result.fprintf$18;
// skip fprintf
goto label_49;


// .\v3\print_tokens2.c(280)
label_49:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 280} true;
goto label_49_true , label_49_false ;


label_49_true :
assume (INT_EQ(typea, 6));
assume value_is(__ctobpl_const_317, typea);
goto label_58;


label_49_false :
assume !(INT_EQ(typea, 6));
assume value_is(__ctobpl_const_317, typea);
goto label_1;


// .\v3\print_tokens2.c(281)
label_58:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 281} true;
call result.__iob_func$22 := __iob_func ();
goto label_61;


// .\v3\print_tokens2.c(281)
label_61:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 281} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$22 != 0);
$fprintf.arg.1$23$ := PLUS(result.__iob_func$22, 32, 1) ;
assume value_is(__ctobpl_const_318, $fprintf.arg.1$23$);
assume value_is(__ctobpl_const_319, result.__iob_func$22);
goto label_62;


// .\v3\print_tokens2.c(281)
label_62:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 281} true;
call result.fprintf$21 := det_choice(); // havoc result.fprintf$21;
// skip fprintf
goto label_1;


// .\v3\print_tokens2.c(282)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 282} true;
return;


// .\v3\print_tokens2.c(282)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 282} true;
assume false;
return;

}



procedure {:extern}  token_type(tok.__1:int) returns (result.token_type$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} result.is_char_constant$7 : int;
var {:extern} result.is_comment$8 : int;
var {:extern} result.is_eof_token$9 : int;
var {:extern} result.is_identifier$4 : int;
var {:extern} result.is_keyword$2 : int;
var {:extern} result.is_num_constant$5 : int;
var {:extern} result.is_spec_symbol$3 : int;
var {:extern} result.is_str_constant$6 : int;
var {:extern} tok : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(tok.__1, alloc);
result.is_char_constant$7:= 0;//Init locals 
result.is_comment$8:= 0;//Init locals 
result.is_eof_token$9:= 0;//Init locals 
result.is_identifier$4:= 0;//Init locals 
result.is_keyword$2:= 0;//Init locals 
result.is_num_constant$5:= 0;//Init locals 
result.is_spec_symbol$3:= 0;//Init locals 
result.is_str_constant$6:= 0;//Init locals 
result.token_type$1 := 0;//initialize returns 
tok:= 0;//Init locals 
tok := tok.__1;
goto label_3;


// .\v3\print_tokens2.c(239)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 239} true;
call result.is_keyword$2 := is_keyword (tok);
assume value_is(__ctobpl_const_320, tok);
assume value_is(__ctobpl_const_321, tok);
goto label_6;


// .\v3\print_tokens2.c(239)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 239} true;
goto label_6_true , label_6_false ;


label_6_true :
assume (result.is_keyword$2 != 0);
assume value_is(__ctobpl_const_322, result.is_keyword$2);
goto label_10;


label_6_false :
assume (result.is_keyword$2 == 0);
assume value_is(__ctobpl_const_322, result.is_keyword$2);
goto label_7;


// .\v3\print_tokens2.c(240)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 240} true;
call result.is_spec_symbol$3 := is_spec_symbol (tok);
assume value_is(__ctobpl_const_323, tok);
assume value_is(__ctobpl_const_324, tok);
goto label_11;


// .\v3\print_tokens2.c(240)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 240} true;
goto label_11_true , label_11_false ;


label_11_true :
assume (result.is_spec_symbol$3 != 0);
assume value_is(__ctobpl_const_325, result.is_spec_symbol$3);
goto label_15;


label_11_false :
assume (result.is_spec_symbol$3 == 0);
assume value_is(__ctobpl_const_325, result.is_spec_symbol$3);
goto label_12;


// .\v3\print_tokens2.c(241)
label_12:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 241} true;
call result.is_identifier$4 := is_identifier (tok);
assume value_is(__ctobpl_const_326, tok);
assume value_is(__ctobpl_const_327, tok);
goto label_16;


// .\v3\print_tokens2.c(241)
label_16:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 241} true;
goto label_16_true , label_16_false ;


label_16_true :
assume (result.is_identifier$4 != 0);
assume value_is(__ctobpl_const_328, result.is_identifier$4);
goto label_20;


label_16_false :
assume (result.is_identifier$4 == 0);
assume value_is(__ctobpl_const_328, result.is_identifier$4);
goto label_17;


// .\v3\print_tokens2.c(242)
label_17:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 242} true;
call result.is_num_constant$5 := is_num_constant (tok);
assume value_is(__ctobpl_const_329, tok);
assume value_is(__ctobpl_const_330, tok);
goto label_21;


// .\v3\print_tokens2.c(242)
label_21:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 242} true;
goto label_21_true , label_21_false ;


label_21_true :
assume (result.is_num_constant$5 != 0);
assume value_is(__ctobpl_const_331, result.is_num_constant$5);
goto label_25;


label_21_false :
assume (result.is_num_constant$5 == 0);
assume value_is(__ctobpl_const_331, result.is_num_constant$5);
goto label_22;


// .\v3\print_tokens2.c(243)
label_22:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 243} true;
call result.is_str_constant$6 := is_str_constant (tok);
assume value_is(__ctobpl_const_332, tok);
assume value_is(__ctobpl_const_333, tok);
goto label_26;


// .\v3\print_tokens2.c(243)
label_26:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 243} true;
goto label_26_true , label_26_false ;


label_26_true :
assume (result.is_str_constant$6 != 0);
assume value_is(__ctobpl_const_334, result.is_str_constant$6);
goto label_30;


label_26_false :
assume (result.is_str_constant$6 == 0);
assume value_is(__ctobpl_const_334, result.is_str_constant$6);
goto label_27;


// .\v3\print_tokens2.c(244)
label_27:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 244} true;
call result.is_char_constant$7 := is_char_constant (tok);
assume value_is(__ctobpl_const_335, tok);
assume value_is(__ctobpl_const_336, tok);
goto label_31;


// .\v3\print_tokens2.c(244)
label_31:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 244} true;
goto label_31_true , label_31_false ;


label_31_true :
assume (result.is_char_constant$7 != 0);
assume value_is(__ctobpl_const_337, result.is_char_constant$7);
goto label_35;


label_31_false :
assume (result.is_char_constant$7 == 0);
assume value_is(__ctobpl_const_337, result.is_char_constant$7);
goto label_32;


// .\v3\print_tokens2.c(245)
label_32:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 245} true;
call result.is_comment$8 := is_comment (tok);
assume value_is(__ctobpl_const_338, tok);
assume value_is(__ctobpl_const_339, tok);
goto label_36;


// .\v3\print_tokens2.c(245)
label_36:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 245} true;
goto label_36_true , label_36_false ;


label_36_true :
assume (result.is_comment$8 != 0);
assume value_is(__ctobpl_const_340, result.is_comment$8);
goto label_40;


label_36_false :
assume (result.is_comment$8 == 0);
assume value_is(__ctobpl_const_340, result.is_comment$8);
goto label_37;


// .\v3\print_tokens2.c(246)
label_37:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 246} true;
call result.is_eof_token$9 := is_eof_token (tok);
assume value_is(__ctobpl_const_341, tok);
assume value_is(__ctobpl_const_342, tok);
goto label_41;


// .\v3\print_tokens2.c(246)
label_41:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 246} true;
goto label_41_true , label_41_false ;


label_41_true :
assume (result.is_eof_token$9 != 0);
assume value_is(__ctobpl_const_343, result.is_eof_token$9);
goto label_43;


label_41_false :
assume (result.is_eof_token$9 == 0);
assume value_is(__ctobpl_const_343, result.is_eof_token$9);
goto label_42;


// .\v3\print_tokens2.c(247)
label_42:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 247} true;
result.token_type$1 := 0 ;
goto label_1;


// .\v3\print_tokens2.c(246)
label_43:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 246} true;
result.token_type$1 := 6 ;
goto label_1;


// .\v3\print_tokens2.c(245)
label_40:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 245} true;
result.token_type$1 := 5 ;
goto label_1;


// .\v3\print_tokens2.c(244)
label_35:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 244} true;
result.token_type$1 := 43 ;
goto label_1;


// .\v3\print_tokens2.c(243)
label_30:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 243} true;
result.token_type$1 := 42 ;
goto label_1;


// .\v3\print_tokens2.c(242)
label_25:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 242} true;
result.token_type$1 := 41 ;
goto label_1;


// .\v3\print_tokens2.c(241)
label_20:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 241} true;
result.token_type$1 := 3 ;
goto label_1;


// .\v3\print_tokens2.c(240)
label_15:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 240} true;
result.token_type$1 := 2 ;
goto label_1;


// .\v3\print_tokens2.c(239)
label_10:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 239} true;
result.token_type$1 := 1 ;
goto label_1;


// .\v3\print_tokens2.c(248)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 248} true;
return;


// .\v3\print_tokens2.c(248)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 248} true;
assume false;
return;

}



procedure {:extern}  unget_char(ch.__1:int, fp.__1:int) returns (result.unget_char$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} c : int;
var {:extern} ch : int;
var {:extern} fp : int;
var {:extern} result.ungetc$2 : int;
var {:extern} $ungetc.arg.1$3$ : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(fp.__1, alloc);
c:= 0;//Init locals 
ch:= 0;//Init locals 
fp:= 0;//Init locals 
result.unget_char$1 := 0;//initialize returns 
result.ungetc$2:= 0;//Init locals 
$ungetc.arg.1$3$:= 0;//Init locals 
ch := ch.__1;
fp := fp.__1;
goto label_3;


// .\v3\print_tokens2.c(93)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 93} true;
goto label_4;


// .\v3\print_tokens2.c(94)
label_4:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 94} true;
$ungetc.arg.1$3$ := ch ;
assume value_is(__ctobpl_const_344, $ungetc.arg.1$3$);
assume value_is(__ctobpl_const_345, ch);
goto label_5;


// .\v3\print_tokens2.c(94)
label_5:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 94} true;
call result.ungetc$2 := ungetc ($ungetc.arg.1$3$, fp);
assume value_is(__ctobpl_const_346, $ungetc.arg.1$3$);
assume value_is(__ctobpl_const_347, fp);
assume value_is(__ctobpl_const_348, $ungetc.arg.1$3$);
assume value_is(__ctobpl_const_349, fp);
goto label_8;


// .\v3\print_tokens2.c(94)
label_8:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 94} true;
c := result.ungetc$2 ;
assume value_is(__ctobpl_const_350, c);
assume value_is(__ctobpl_const_351, result.ungetc$2);
goto label_9;


// .\v3\print_tokens2.c(95)
label_9:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 95} true;
goto label_9_true , label_9_false ;


label_9_true :
assume (INT_EQ(c, -1));
assume value_is(__ctobpl_const_352, c);
goto label_11;


label_9_false :
assume !(INT_EQ(c, -1));
assume value_is(__ctobpl_const_352, c);
goto label_10;


// .\v3\print_tokens2.c(100)
label_10:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 100} true;
result.unget_char$1 := c ;
assume value_is(__ctobpl_const_353, c);
goto label_1;


// .\v3\print_tokens2.c(97)
label_11:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 97} true;
result.unget_char$1 := c ;
assume value_is(__ctobpl_const_354, c);
goto label_1;


// .\v3\print_tokens2.c(101)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 101} true;
return;


// .\v3\print_tokens2.c(101)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 101} true;
assume false;
return;

}



procedure {:extern}  unget_error(fp.__1:int) returns (result.unget_error$1:int)

//TAG: alloc is always > 0
free requires INT_LT(0, alloc);
//TAG: alloc increases
free ensures INT_LEQ(old(alloc), alloc);

//TAG: havoc memory locations by default
modifies const_80;
{
var {:extern} havoc_stringTemp:int;
var {:extern} condVal:int;
var {:extern} fp : int;
var {:extern} $fprintf.arg.1$4$_123_$static$ : int;
var {:extern} result.__iob_func$3 : int;
var {:extern} result.fprintf$2 : int;
var {:extern} tempBoogie0:int;
var {:extern} tempBoogie1:int;
var {:extern} tempBoogie2:int;
var {:extern} tempBoogie3:int;
var {:extern} tempBoogie4:int;
var {:extern} tempBoogie5:int;
var {:extern} tempBoogie6:int;
var {:extern} tempBoogie7:int;
var {:extern} tempBoogie8:int;
var {:extern} tempBoogie9:int;
var {:extern} tempBoogie10:int;
var {:extern} tempBoogie11:int;
var {:extern} tempBoogie12:int;
var {:extern} tempBoogie13:int;
var {:extern} tempBoogie14:int;
var {:extern} tempBoogie15:int;
var {:extern} tempBoogie16:int;
var {:extern} tempBoogie17:int;
var {:extern} tempBoogie18:int;
var {:extern} tempBoogie19:int;
havoc_stringTemp := 0;//Initialize havoc_stringTemp 


start:

assume INT_LT(fp.__1, alloc);
fp:= 0;//Init locals 
$fprintf.arg.1$4$_123_$static$:= 0;//Init locals 
result.__iob_func$3:= 0;//Init locals 
result.fprintf$2:= 0;//Init locals 
result.unget_error$1 := 0;//initialize returns 
fp := fp.__1;
goto label_3;


// .\v3\print_tokens2.c(423)
label_3:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 423} true;
call result.__iob_func$3 := __iob_func ();
goto label_6;


// .\v3\print_tokens2.c(423)
label_6:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 423} true;
//TAG: Dereferenced object is non-null
assert(result.__iob_func$3 != 0);
$fprintf.arg.1$4$_123_$static$ := PLUS(result.__iob_func$3, 32, 1) ;
assume value_is(__ctobpl_const_355, $fprintf.arg.1$4$_123_$static$);
assume value_is(__ctobpl_const_356, result.__iob_func$3);
goto label_7;


// .\v3\print_tokens2.c(423)
label_7:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 423} true;
call result.fprintf$2 := det_choice(); // havoc result.fprintf$2;
// skip fprintf
goto label_1;


// .\v3\print_tokens2.c(424)
label_1:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 424} true;
return;


// .\v3\print_tokens2.c(424)
label_2:
assert {:sourcefile ".\v3\print_tokens2.c"} {:sourceline 424} true;
assume false;
return;

}

