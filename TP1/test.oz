%Exercise 1.1%

{Browse 1}
{Browse 2}
{Browse 3}
{Browse 4}

%Exercise 2: Expression arithmetique%

{Browse 19 - 970}
{Browse 192 - 980 + 191 * 967}
{Browse (192 - 780) * (~3) - 191 * 967}

%Exercise 3.1: Entiers et flottants%

{Browse {IntToFloat 123} + 456.0}

    % Or the inverse FloatToInt ... %

%Exercise 4.1: Variables%

declare
X=(6+5)*(9-7)

{Browse X}
{Browse X+5}

%Exercise 5.1: Déclarations multiples%

declare
X=42
Z=~3
{Browse X} % (1)
{Browse Z}
declare
Y=X+5
{Browse Y} % (2)
declare
X=1234567890
{Browse X}

%Exercise 6.1: Expressions booléennes%

{Browse 3 == 7} % egaux
{Browse 3 \= 7} % differents
{Browse 3 < 7} % plus petit
{Browse 3 =< 7} % plus petit ou egal
{Browse 3 > 7} % plus grand
{Browse 3 >= 7} % plus grand ou egal

%Exercise 7.1: Fonctions et expressions%

{Browse {Max 3 7}}
{Browse {Min 3 7}}

%Max of 3 numbers
{Browse{Max 7{Max 5 6}}}

%Max of 4 numbers
{Browse{Max 3{Max 55{Max 33 44}}}}

%Exercise 7.2 Construisez une fonction qui renvoie le signe d’un entier N passé en argument. Les valeurs possibles du signe sont 0, 1 et ~1 suivant que N est nul, positif ou négatif. Testez votre fonction pour différentes valeurs de N.
declare
fun {SigneN N}
    if N == 0 then 
        0 
    elseif N > 0 then 
        1
    else 
        ~1 
    end
end
{Browse {SigneN ~4}}


%Exercise 8: Porté lexicale

local P Q X Y Z in
    fun {P X}
 X*Y+Z end
    fun {Q Y}
       X*Y+Z
 end
 X=1
 Y=2
 Z=3
 {Browse {P 4}}  %11
 {Browse {Q 4}} %7
 {Browse {Q {P 4}}} %14
 end

%Exercise Programation recursive%

%1: Somme de carrés

declare
fun {SumSquare N}
    if N == 0 then 
        0
    else 
        N * N + {SumSquare N - 1} end
    end

    {Browse {SumSquare 6}}

%Accumulateur

declare 
fun {SumSquareAcc N A}
    if N == 0 then 
        A
    else
        {SumSquareAcc N-1 A + N * N}end
    end

    {Browse {SumSquareAcc 6 0}}


%Exercise 2: Mirror
% A = 12345
% {Browse A mod 10}
% B = 12345 div 10
% {Browse B mod 10}
% C = 12345 div 100
% {Browse C mod 10}
% D = 12345 div 1000
% {Browse D mod 10}
% E = 12345 div 10000
% {Browse E mod 10}

declare 

% fun {Mirror A I} %I = 1
%     if A == 0 then
%         nil
%     else
%     {Browse A mod 10}
%     {Mirror A div I I}
%     end
% end

%alternative

fun {Mirror A I}
    if A \= 0 then
        {Browse A mod 10}
        {Mirror A div I I}
    end
end
    

{Brow{Mirror 12345 10}}


    

        


