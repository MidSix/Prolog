:- op(700, xfx, is_frac).

% 2 Fractions:

%return X/1 consult.
X is_frac Y:-
debug(is_frac, "Trying first rule", [Y]),
    integer(Y),
    X=Y/1.

%handle fractional bound values for Y, negative fractions and null denominators.
X is_frac Y:-
    debug(is_frac, "Trying second rule", [Y]),
    Y=NUM/DEN,
    integer(NUM),
    integer(DEN),
    DEN \= 0,
    X=NUM/DEN.

% 3 Arithmetic Operations:

%note: when the respectives operations are finished, all rules will go to rule number 2 when they are going to be simplified with gcd.
%Addition
X is_frac A + B:-
debug(is_frac, "Trying third rule", [Y]),
    SUM_1 is_frac A,
    SUM_2 is_frac B,
    SUM_1 = NUM_1/DEN_1,
    SUM_2 = NUM_2/DEN_2,
    NUM is (NUM_1 * DEN_2) + (NUM_2 * DEN_1),
    DEN is DEN_1 * DEN_2,
    X is_frac NUM/DEN.

%substraction
X is_frac A-B:-
    SUM_1 is_frac A,
    SUM_2 is_frac B,
    SUM_1=NUM_1/DEN_1,
    SUM_2=NUM_2/DEN_2,
    NUM is (NUM_1* DEN_2) - (NUM_2 * DEN_1),
    DEN is DEN_1 * DEN_2,
    X is_frac NUM/DEN.

%multiplication    
X is_frac A * B:- 
    FAC_1 is_frac A,
    FAC_2 is_frac B,
    FAC_1=NUM_1/DEN_1,
    FAC_2=NUM_2/DEN_2,
    NUM is NUM_1 * NUM_2,
    DEN is DEN_1 * DEN_2,
    X is_frac NUM/DEN.

%divition
X is_frac A div B:- 
    FAC_1 is_frac A,
    FAC_2 is_frac B,
    FAC_1=NUM_1/DEN_1,
    FAC_2=NUM_2/DEN_2,
    NUM is NUM_1 * DEN_2,
    DEN is DEN_1 * NUM_2,
    X is_frac NUM/DEN.

%Greatest common divisor(gcd):
gcd(A,0,A).  %Base-case
gcd(A,B,GCD):-  %Recursive-case
    %B \= 0, if the program enter in the recursive-case it means that the base-case was not satisfied, in other words. B = 0 can't be unified so B when this clause is executed is already B \= 0
    X is A mod B,
    gcd(B,X,GCD).