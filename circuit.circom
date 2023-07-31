pragma circom 2.0.0;
template Multiplier2 () {  
   // Declaration of signals.  
   signal input a;  
   signal input b; 
   signal  x;
   signal  y; 
   signal output Q;  

   component and=AND();
   component not=NOT();
   component or=OR();

   and.a <== a;
   and.b <== b;
   x <== and.out;

   not.in <== b;
   y <== not.out;

   or.a <== x;
   or.b <== y;
   Q <== or.out;

}
template AND() {
   signal input a;
   signal input b;
   signal output out;
   out <== a*b;
}

template OR() {
   signal input a;
   signal input b;
   signal output out;
   out <== a + b - a*b;
}

template NOT() {
   signal input in;
   signal output out;
   out <== 1 + in - 2*in;
}

component main = Multiplier2();