% DIFFERENT ALGORITHM
function V=StochGam2(QP,T,g)
% function V=StochGam2(QP,T,g)
% STOCHGAM2 returns the value V of a Stochastic game
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
    [~,~,v] = MinMax2(AA);
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
        [~,~,v] = MinMax2(AA);
        V(t,k)=v;
    end
end

Legend=cell(size(V,2),1);
figure;
for i=1:size(V,2)
    Legend{i}=strcat('Starting state ', num2str(i));
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
xlabel('T'); ylabel('Value'); grid on; legend('data',Legend,'Location', 'Best');
title(['Finite Horizon Zero Sum 2 Player Stochastic Game (\gamma = ',num2str(g),')']);

end
function [p,q,v] = MinMax2(A)
% Solve a zero-sum matrix game A for the row player.
%
% The input to this function is a matrix A representing a classical matrix
% game in which A(i,j) is the payoff from the column player to the row
% player. 
%
% The outputs are [v,p] where
% * v is the value of the game and
% * p is the mixed strategy for the row player.
% 
% To calculate the mixed strategy for the column player, call
% game_solve(-A'). Alternatively, call
% [v,p,q] = game_solve(A)
% and q will be the mixed strategy for the column player.
%
% Example: The matrix for rock-paper-scissors is
% A = [0 -1 1; 1 0 -1; -1 1 0]
%
% calling [v,p] = game_solve(A) yields
%
% v =
%    0
% p =
%    0.3333
%    0.3333
%    0.3333
%
% showing that one should play rock, paper, or scissors each with
% probability 1/3 and the value of the game is zero.

[r,c] = size(A);

AA = [-A', ones(c,1)];
Aeq = [ones(1,r),0];

b = zeros(c,1);
beq = 1;
lb = [zeros(r,1);-inf];
f = [ zeros(r,1);-1];
options = optimset('Display', 'off');

p = linprog(f,AA,b,Aeq,beq,lb,[],[],options);
v = p(r+1);
p = p(1:r);

[w,q,~] = MinMax2(-A');

end

