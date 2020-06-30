function [p1,p2,V] = MinMax(A)
% function [p1,p2,V] = MinMax(A)
% MINMAX returns the equilibrium (p1,p2) and the value V of game A in Game
% Theory using Linear Programming
%
% INPUT:
% A     : the game array
%
% OUTPUT:
% p1    : the optimal strategy of player 1
% p2    : the optimal strategy of player 2
% V     : the value of game A
 
%disp('Game Matrix is A ='); disp(A)
%% Check if A(:) == 0
if length(find(A==0))==size(A,1)*size(A,2) % A(:) = 0
    p1 = ones(size(A,1),1); p2 = ones(size(A,2),1); 
    p1 = p1/size(A,1); p2 = p2/size(A,2); V = 0; return;
end
%% Check for saddle point -> Val+ = Val-
[LowerValue,UpperValue] = CalculateValue(A);
if LowerValue == UpperValue
    V = LowerValue; p1=zeros(size(A,1),1); p2 = zeros(size(A,2),1);
    [row, col] = find(A==V); p1(row(1)) = 1; p2(col(1)) = 1;
    %disp('p1 = '); disp(p1); disp('p2 = '); disp(p2); disp('Value = '); disp(V); 
    return;
end
%% Check if P1 has 1 choice -> A is a row vector
if size(A,1) == 1
    p1 = [1];
    pos = find(A==min(A(:)));
    p2 = zeros(size(A,2),1); p2(pos) = 1;
    V = min(A(:));
    %disp('p1 = '); disp(p1); disp('p2 = '); disp(p2); disp('Value = '); disp(V);
    return;
end
%% Check if P2 has 1 choice -> A is a column vector
if size(A,2) == 1
    p2 = [1];
    pos = find(A==max(A(:)));
    p1 = zeros(size(A,1),1); p1(pos) = 1;
    V = max(A(:)); 
    %disp('p1 = '); disp(p1); disp('p2 = '); disp(p2); disp('Value = '); disp(V);
    return;
end
%% MinMax
[M1,M2]=size(A);
f1=ones(M1,1);
A1=-(A+abs(min(min(A))))';
b1=-ones(M2,1);
xlow1=zeros(M1,1);
xup1=ones(M1,1);
x1=linprog(f1,A1,b1,[],[],xlow1,xup1);
v1=1/sum(x1);
f2=-ones(M2,1);
A2=(A+abs(min(min(A))));
b2=ones(M1,1);
xlow2=zeros(M2,1);
xup2=ones(M2,1);
x2=linprog(f2,A2,b2,[],[],xlow2,xup2);
v2=1/sum(x2);
p1=v1*x1;
p2=v2*x2;
V=p1'*A*p2;
%disp('p1 = '); disp(p1); disp('p2 = '); disp(p2); disp('Value = '); disp(V);
end


