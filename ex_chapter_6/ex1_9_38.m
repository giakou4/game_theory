%% Solve as a Matrix Game
clc
clear all
T=100;
V=0.7;

for t=1:T
    A=[V 1 1;1 0 V;1 V 0];
    [p1,p2,V]=MinMax(A);
    VV(t,1)=V;
end
disp([p1 p2]);
figure(1);
clf
plot(VV,'Linewidth',3);