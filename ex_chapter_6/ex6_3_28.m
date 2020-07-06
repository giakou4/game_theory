%% Exercise 6.3.28
clear all; close all; clc;
T = 100
g = 1;
QP(1).q = [1 3;1 2];
QP(1).P(:,:,1) = [3/5 1/5;4/5 2/5];
QP(1).P(:,:,2) = [2/5 4/5;1/5 3/5];

QP(2).q = [0];
QP(2).P(:,:,1) = [0];
QP(2).P(:,:,2) = [1];

tic
V=StochGam(QP,T,g);
clc;
toc
