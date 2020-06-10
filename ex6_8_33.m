%% Exercise 6.8.33
clear all; close all; clc;
T = 100;
g = 0.9;
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