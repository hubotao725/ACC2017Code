function outVal=GetResult(outSym,inSym,inVal)
%GetResult this function gets the value of the output symbol.
%outSym is the output symbol variable defined by Casadi
%inSym is the input symbol variable defined by Casadi
%inVal is the value of the input symbol variable solved by Casadi
import casadi.*

fun=SXFunction('fun4',{inSym},{outSym});%define the function

fun.setInput(inVal);

fun.evaluate();
outVal=full(fun.getOutput());
end