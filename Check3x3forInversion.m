function [V,H] = Check3x3forInversion(A)
% INPUT:
% A     : the game matrix
%
% OUTPUT:
% V    : the value of the game 
% H    : a boolean attribute, H=1 for applicable, H=0 for not

[N,M]=size(A);
if N==M && N==3
else
    display(['Wrong input!']);
    return;
end

equations2check=adjoint(A)*[1;1;1]; 
if (det(A)<0 && equations2check(1)<0 && equations2check(2)<0 && equations2check(3)<0)
    H=1;
    V=det(A)/sum(equations2check);
    display(['Matrix inversion is applicable']);
    display(['Val(A)=',num2str(V)]);
elseif (det(A)>0 && equations2check(1)>0 && equations2check(2)>0 && equations2check(3)>0)
    H=1;
    V=det(A)/sum(equations2check);
    display(['Matrix inversion is applicable']);
    display(['Val(A)=',num2str(V)]);
else
    display(['Matrix inversion is not applicable']);
    H=0;
end

end



