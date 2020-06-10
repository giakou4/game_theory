% STUPID?
function V=StochGam2x2(QP,T,g)
% function V=StochGam2(QP,T,g)
% STOCHGAM2 returns the value V of a Stochastic game. Call this function
% only if the game is 2x2 and STOCHGAM fails.This implementation calls a
% Solve2x2 with no checks for saddle point instead of MinMax. In comparison
% to STOCHGAM this function runs faster
%
% INPUT:
% QP         : this is a class where you insert the q, P matrices for
%              each state e.g. QP(1).q(1), QP(1).P(:,:,1), QP(1).P(:,:,2)
%              for state 1 and for 2 players
% T          : the time periods (stages) the game is played
% g          : the discount which is in the interval (0,1]. Note that for
%              infite games T must be in the interval (0,1)
%
% OUTPUT:
% V          : the value for the game being played each time period
% by default it prints a figure of value vs T
K = length(QP);
V=zeros(T,K);
for k=1:K
    AA=QP(k).q;
    [~,~,v] = Solve2x2_2(AA);
    V(T,k)=v;
end

for t=T-1:-1:1
    for k=1:K
        AA=QP(k).q;
        P=QP(k).P;
        for m1=1:size(P,1)
            for m2=1:size(P,2) 
                for i=1:K
                    AA(m1,m2)=AA(m1,m2)+g*P(m1,m2,i)*V(t+1,i);
                end
            end
        end
        [~,~,v] = Solve2x2_2(AA);
        V(t,k)=v;
    end
end

Legend=cell(size(V,2),1);
figure;
for i=1:size(V,2)
    Legend{i}=strcat('Player ', num2str(i));
    text(T,V(1,i),num2str(V(1,i)));
    hold on
    if i==1
        colorno = [0 0 1];
    elseif i==2
        colorno = [1 0 0];
    elseif i==3
        colorno = [0 1 0];
    elseif i==4
        colorno = [1 1 0];
    elseif i==5
        colorno = [1 0 1];
    elseif i==6
        colorno = [0 1 1];
    else
        colorno = rand(1,3);
    end
    plot(flipud(V(:,i)),'color',colorno);
end
xlabel('T'); ylabel('Value'); grid on; legend('data',Legend);
title(['Finite Horizon Zero Sum Stochastic Game (\gamma = ',num2str(g),')']);

end

function [p1,p2,Value] = Solve2x2_2(A)
if length(find(A==0))==size(A,1)*size(A,2)
    p1 = [1 0]; p2 = [1 0]; Value = 0; return;
end
a11 = A(1,1);
a12 = A(1,2);
a21 = A(2,1);
a22 = A(2,2);

ac = (a11-a12)+(a22-a21);
if ac ~= 0
    p1 = [(a22-a21)/ac (a11-a12)/ac];
    p2 = [(a22-a12)/ac (a11-a21)/ac];
    Value = (a11*a22-a12*a21)/ac;
else 
    [p1,p2,Value] = MinMax(A);
end
%fprintf('p1=[%2.3f %2.3f] \t p2=[%2.3f %2.3f] \t Val(A)=%2.3f \n',p1(1),p1(2),p2(1),p2(2),Value); 
end

