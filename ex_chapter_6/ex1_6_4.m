%% Solve as a Matrix Game
clc
clear all
T=100;
V=0.7;
for t=1:T
    A=[V 1;1 0];
    [p1,p2,V]=MinMax(A);
    VV(t,1)=V;
end
disp([p1 p2]);
figure(1);
clf
plot(VV);
%% Solve as stochastic Game
clear all; clc;
T = 100;
g = 1;
QP(1).q = [0 1;1 0];
QP(1).P(:,:,1) = [1 0;0 0];
QP(1).P(:,:,2) = [0 1;1 1];

QP(2).q = [0];
QP(2).P(:,:,1) = [0];
QP(2).P(:,:,2) = [1];

tic
V=StochGam(QP,T,g);
clc;
toc


