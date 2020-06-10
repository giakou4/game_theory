%% Exercise 6.8.8
clear all; close all; clc;
T1 = 11;
T2 = 100;
g = 0.9;
QP(1).q = [1; 2];
QP(1).P(:,:,1) = [2/5; 2/3];
QP(1).P(:,:,2) = [3/5; 1/3];
QP(2).q = [4 -1];
QP(2).P(:,:,1) = [1/3 3/5];
QP(2).P(:,:,2) = [2/3 2/5];
tic
V=StochGam(QP,T1,g);
V=StochGam(QP,T2,g);
clc;
toc