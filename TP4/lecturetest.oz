%Genericity is when a function is passed as an input:
declare
fun {Map F L}
   case L of nil then nil
   [] H|T then {F H}|{Map F T}
   end
end 

{Browse {Map fun {$ X} X*X end [7 8 9]}}%print : [49 64 82]

%Instantiation is when a function is returned as an output
declare
fun {MakeAdd A}
   {Browse A}
   fun {$ X} X+A end
end
Add5={MakeAdd 5}

{Browse {Add5 100}} %Here it prints 105 where A = 5

%Function composition is when we take two functions as input and return their composition

declare
fun {Compose F G}
   fun{$ X}{F {G X}}end
end
Fnew = {Compose fun {$ X} X*X end fun{$ X}X+1 end}
{Browse {{Compose Fnew Fnew}2}}
%It returns 100


