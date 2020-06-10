%% Exercise 6.8.1
clear all; close all; clc;
T1 = 11;
T2 = 100;
g = 0.9;
QP(1).q = [0 1; 1 0];
QP(1).P(:,:,1) = [0 1;0 1];
QP(1).P(:,:,2) = [1 0;1 0];
QP(2).q = [1 0; 4 -1];
QP(2).P(:,:,1) = [1 0;0 1];
QP(2).P(:,:,2) = [0 1;1 0];
tic
V=StochGam(QP,T1,g);
V=StochGam(QP,T2,g);
clc;
toc