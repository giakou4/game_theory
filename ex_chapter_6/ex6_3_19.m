%% Exercise 6.3.19 Infinite Horizon
% q(1) = [1 -1;                     q(2) = [-2 1;
%         -3 3]                             1 -1]
% P(1) = [(1/3,2/3) (1/3,2/3);    P(2) = [(2/3,1/3) (2/3,1/3);
%         (1/3,2/3) (1/3,2/3)]            (2/3,1/3) (2/3,1/3)]
clear all; close all; clc;
%% Define the Game P,q,T,?
T=100;
g1=0.9;
g2=0.8;
g3=1;
QP(1).q=[1 -1;-3 3];
QP(1).P(:,:,1)=[0.33 0.33; 0.33 0.33];
QP(1).P(:,:,2)=[0.67 0.67; 0.67 0.67];
QP(2).q=[-2 1;1 -1];
QP(2).P(:,:,1)=[0.67 0.67; 0.67 0.67];
QP(2).P(:,:,2)=[0.33 0.33; 0.33 0.33];
%% Solve the game
tic
V=StochGam(QP,T,g1);
V=StochGam(QP,T,g2);
V=StochGam(QP,T,g3);
clc;
toc
%{ 
tic
V=StochGam2x2(QP,T,g1);
V=StochGam2x2(QP,T,g2);
clc;
toc
%}