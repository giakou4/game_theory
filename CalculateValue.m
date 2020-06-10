function [LowerValue,UpperValue] = CalculateValue(A)
% function [LowerValue,UpperValue] = CalculateValue(A)
% CALCULATEVALUE returns the Val+ and Val- of game A in Game Theory
%
% INPUT:
% A             : the game array
%
% OUTPUT:
% LowerValue    : the lower value of game matrix A
% UpperValue    : the upper value of game matrix A

LowerValue = max(min(A'));
UpperValue = min(max(A));
fprintf('Val-(A) = %d \t Val+(A) = %d\n',LowerValue,UpperValue);

end

