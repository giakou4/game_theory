function [H] = Check3x3forInversion2(A)
% INPUT:
% A     : the game matrix
%
% OUTPUT:
% H    : a boolean attribute, H=1 for applicable, H=0 for not

[N,M]=size(A);
if N==M && N==3
else
    display(['Wrong input!']);
    return;
end
adjA=adjoint(A);
a=adjA(1,1);
b=adjA(1,2);
c=adjA(1,3);
d=adjA(2,1);
e=adjA(2,2);
f=adjA(2,3);
g=adjA(3,1);
h=adjA(3,2);
i=adjA(3,3);

if det(A)>0 && (b*f-c*e-b*i+c*h+e*i-f*h)>0 && (a*i-c*g-a*f+c*d-d*i+f*g)>0 && (a*e-b*d-a*h+b*g+d*h-e*g)>0
    H=1;
elseif det(A)<0 && (b*f-c*e-b*i+c*h+e*i-f*h)<0 && (a*i-c*g-a*f+c*d-d*i+f*g)<0 && (a*e-b*d-a*h+b*g+d*h-e*g)<0
    H=1;
else
    H=0;
end

end

%A=[4 1 2;7 2 2;5 2 8];
%A=[5 6 3;6 3 8;3 8 1];