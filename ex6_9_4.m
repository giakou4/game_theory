%% Exercise 6.9.4 - A different approach
% When the inspector inspects and does not find the heroin or the smuggler
% succesfully smuggles the heroin and the inspector does not inspect, then
% the inspector looses -1 instead of gaining 0
clear all; close all; clc
T = 1000;
g = 0.9;

QP(1).q = [1 -1;-1 0];
QP(1).P(:,:,1) = [0 0;1 1];
QP(1).P(:,:,2) = [1 1;0 0];

QP(2).q = [0];
QP(2).P(:,:,1) = [0];
QP(2).P(:,:,2) = [1];

tic
V=StochGam(QP,T,g);
clc;
toc