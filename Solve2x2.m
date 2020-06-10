function [p1,p2,Value] = Solve2x2(A)
% function [p1,p2,Value] = Solve2x2(A)
% SOLVE2X2 returns the equilibrium (p1,p2) and the value ValA of game A in 
% Game Theory using the Theorem 1.2.5
%
% INPUT:
% A         : the game array
%
% OUTPUT:
% p1        : the optimal strategy of player 1
% p2        : the optimal strategy of player 2
% ValA      : the value of game A

a11 = A(1,1);
a12 = A(1,2);
a21 = A(2,1);
a22 = A(2,2);

if (a11-a12)*(a22-a21)<0
    disp('Check for saddle point');
    %return
else %no saddle point
    ac = (a11-a12)+(a22-a21);
    p1 = [(a22-a21)/ac (a11-a12)/ac];
    p2 = [(a22-a12)/ac (a11-a21)/ac];
    Value = (a11*a22-a12*a21)/ac;
    fprintf('p1=[%2.3f %2.3f] \t p2=[%2.3f %2.3f] \t Val(A)=%2.3f \n',p1(1),p1(2),p2(1),p2(2),Value);

end

end

