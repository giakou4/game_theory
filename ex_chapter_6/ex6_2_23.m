%% Exercise 6.2.23 Perfect Information Zero Sum Stochastic Game
clear all; close all; clc;

T = 3;
g = 1;

QP(1).q=[2 -1];
QP(1).P(:,:,1)=[1/3 2/3];
QP(1).P(:,:,2)=[2/3 1/3];

QP(2).q=[4; 3];
QP(2).P(:,:,1)=[3/4; 1/4];
QP(2).P(:,:,2)=[1/4; 3/4];

tic
V=StochGam(QP,T,g);
clc;
toc;
