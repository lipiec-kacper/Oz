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

%Here is the definition of FoldL

declare
fun{FoldL L F U}
   case L
   of nil then U
   [] H|T then {FoldL T F {F U H}}
   end
end
S = {FoldL [5 6 7] fun {$ X Y} X+Y end 0}
{Browse S}  %Here it prints the sum of 5 6 7

%Encapsulation

declare
fun{Zero} 0 end
fun{Inc H}
N = {H}+1 in 
   fun{$} N end
end
Three = {Inc{Inc{Inc Zero}}}
{Browse {Three}}  %Here it prints 3

%This can be used to build control structures from scratch
%(if statement, while loop, for loop, etc)

proc {IfTrue Cond Stmt}
   if {Cond} then {Stmt} end
end
Stmt = proc {$}{Browse 111*111}end
{IfTrue fun{$} 1<2 end Stmt}

%Building a while loop:

fun {While S Cond Transform}
   if {Cond S} then
   {While {Transform S} Cond Transform}
   else S end
end
{While Init Cond Transform}
{Browse {While s(10 0)
   fun {$ S} S.1>0 end
   fun {$ S} s(S.1-1 S.1+S.2)end}}





