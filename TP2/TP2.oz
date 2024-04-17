
%Exercise 1.1
declare
%L1= [a]
L1 = a | nil
%L2=[a [b c] d]
L2 =  a | (b | c | nil) | d | nil
%L3=[proc {$} {Browse oui} end proc {$} {Browse non} end]
L3 = proc {$} {Browse oui} end | proc {$} {Browse non} end | nil
%L4=[est une liste]
L4 = est | une | liste| nil
%L5=[[a p]]
L5 = [a |  p |nil ]

{Browse L1}
{Browse L2}
{Browse L3}
{Browse L4}
{Browse L5}

%Exercise 1.2 : Creez une nouvelle liste en ajoutant ceci en tête de la liste L4.

L42 = ceci | L4

{Browse L42}

%Exercise 1.3 : La liste L3 a pour éléments des procédures. Appelez la première procédure (en utilisant la varaiable L3).
%Vérifiez qu’elle affiche oui.

{L3.1} %print oui
{L3.2.1}%print non 

%Exercise 1.4 : A partir de la liste L2, obtenez la liste [[b c] d]
{Browse L2.2}

%Exercise 1.5 : Ecrivez deux fonctions Head et Tail qui retournent respectivement la tête et la queue de la liste passée en argument.
%{Browse {Head [a b c]}}   % affiche a
%{Browse {Tail [a b c]}}   % affiche [b c]
fun {Head Xs}
    Xs.1
end

fun {Tail Xs}
    Xs.2
end

%{Browse {Head [a b c]}}
%{Browse {Tail [a b c]}}


%Exercise 2

declare
fun {Length L}
   case L of nil then
      0
   [] X|T then
      1 + {Length T}
   end
end

   {Browse {Length [r a p h]}}
   {Browse {Length [[b o r] i s]}}
   {Browse {Length [[l u i s]]}}


% Exercise 3 : Concaténer deux listes

% {Browse {Append [r a] [p h]}}
% {Browse {Append [b [o r]] [i s]}}
% {Browse {Append nil [l u i s]}
% affiche [r a p h]
% affiche [b [o r] i s]
% affiche [l u i s]


declare
fun {Append L T}
   case L of nil then 
      T
   [] H|X then
      H|{Append X T}
   end
end

      
{Browse {Append [r a] [p h]}}
{Browse {Append [b [o r]] [i s]}}     

%Exercise 4 : Pattern matching
%EMPTY
declare
fun {CheckList L}
   case L
   of nil then empty
   [] _ then nonEmpty
   else other
   end
end

{Browse {CheckList nil}}
%NOT EMPTY
declare
fun {CheckList L}
   case L
   of nil then empty
   [] _ then nonEmpty
   else other
   end
end

{Browse {CheckList test}}
%OTHER
declare
fun {CheckList L}
   case L
   of nil then empty
   [] _|_ then nonEmpty
   else other
   end
end

{Browse {CheckList 43}}


%Exercise 4.2
%Réécrivez les fonctions Head, Tail, Length et Append (voir exercices précédents) en utilisant le pattern matching.


