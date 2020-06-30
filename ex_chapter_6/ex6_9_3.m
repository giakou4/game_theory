%% Exercise 6.9.3 - A different approach
% When the inspector inspects and does not find the heroin or the smuggler
% succesfully smuggles the heroin and the inspector does not inspect, then
% the inspector looses -1 instead of gaining 0
clear all; close all; clc
T=300;
V=0.7;

for t=1:T
    A=[1 -1;-1 V];
    [p1,p2,V]=Solve2x2(A);
    VV(t,1)=V;
end
    disp([p1 p2]);
    figure(1);
    clf
    plot(VV);
    xlabel('T'); ylabel('Value');