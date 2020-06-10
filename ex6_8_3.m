%% Exercise 6.8.3
clear all; close all; clc;
T1 = 11;
T2 = 100;
g = 0.5;
QP(1).q = [0 2;1 3];
QP(1).P(:,:,1) = [1/2 1; 0 1/2];
QP(1).P(:,:,2) = [1/2 0; 1 1/2];
QP(2).q = [1 3;2 4];
QP(2).P(:,:,1) = [1/2 1;0 1/2];
QP(2).P(:,:,2) = [1/2 0;1 1/2];
tic
V=StochGam(QP,T1,g);
V=StochGam(QP,T2,g);
clc;
toc