%State as an abstract time 
declare
fun {Sum Xs A}
   case Xs
   of nil then A
   [] X|Xr then
      {Sum Xr A+X}
   end

{Browse {Sum [1 2 3 4] 0}}

%Cell
declare
A = 5
B = 6
C = {NewCell A} %Create a Cell
%{Browse @C} %Display content
C := B %Change content
Z = @C
{Browse Z}    %Display content

declare
X = {NewCell 0}

X := 5
Y = X

Y := 10

{Browse @X} %10
{Browse @Y} %10

XR = @X == 10 %true
XY = X == Y %true
{Browse XR}
{Browse XY}

%Other example :
declare
X = {NewCell 0}
Y = {NewCell 0}

R = X == Y  %false, because X and Y refer to different cells, with different identities.

T = @X == @Y   %true, because the content of X and Y are the same value

declare
fun{NewStack} nil end
fun{Push S X} X|S end
fun{Pop S X} X=S.1 S.2 end
fun{IsEmpty S} S==nil end
%Here the stack is represented by a list, but this is not a data abstraction since the data is not protected

%Encapsulation using a secure wrapper

W = {Wrap X}%Givern X, returns a protected version W
X = {Unwrap W}%Given W returns the original value X
%The simplest way to understand this is to consider that Wrap and Unwrap do encryption and decryption using a shared key that is only know by them

%We need a new Wrap/Unwrap pair for each ADT that we want to protect, so we use a procedure that creates them:

local Wrap Unwrap in
   {NewWrapper Wrap Unwrap}

   fun {NewStack}{Wrap nil} end
   fun {Push W X}{Wrap X|{Unwrap W}}end
   fun {Pop W X}S = {Unwrap W} in X=S.1 {Wrap S.2}end
   fun {IsEmpty W}{Unwrap W}==nil end
end

%How does this work ?
%Look at push func:
%It calls {Unwrap W}, which returns a stack value S, then it builds X|S, and finally it calls {Wrap X|S} to return a protected result


%Objects

%A single object represents both a value and a set of operations
%Example interface of a stack object:

S = {NewStack}
{S push(X)}
{S pop(X)}
{S isEmpty(B)}

%The stack value is stored inside the object S
%Example use of a stack object

S = {NewStack}
{S push(a)}
{S push(b)}
locak X in {S pop(X)}{Browse X}end

%Implementing the stack object
%
fun {NewStack}
   C = {NewCell nil}
   proc {Push X} C := X|@C end
   proc {Pop X} S = @C in C := S.2 X = S.1 end
   proc {IsEmpty B} B ==(@C==nil) end
in
   proc{$ M}
      case M of push(X) then {Push X}
      [] pop(X) then {Pop X}
      [] isEmpty(B) then {IsEmpty B} end
   end
end

%Each call to NewStack creates a new stack object
%The object is represented b y a one-argument procedure that does procedure dispatching: a case statement chooses the operation to execute
%Encapsulation is enforced by higing the cell with static scoping 
