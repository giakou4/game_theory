function [] = BiMatrixGraph2x2(A1,A2)
% function [] = BiMatrixGraph2x2(A1,A2)
% BIMATRIXGRAPH2X2 prints in figure(1) the best response function of Player 1
% defined as R1(p2) in red and Player 2 defined as R2(p1) in blue.
% INPUT:
% A1         : Player 1 game matrix
% A2         : Player 2 game matrix
%
% OUTPUT:
% a figure

denA1=(A1(1,1)-A1(1,2)-A1(2,1)+A1(2,2));
denA2=(A2(1,1)-A2(1,2)-A2(2,1)+A2(2,2));
M1=-(A1(1,2)-A1(2,2))/denA1; %M1(p2)=0
M2=-(A2(2,1)-A2(2,2))/denA2; %M2(p1)=0

%% Check if denA1,denA2 <0 => inequality changes from < to > and vice versa
p1=inf;
p2=inf;
if (A1(1,1)-A1(1,2)-A1(2,1)+A1(2,2))>0
    p1=0;
else
    p1=-1;
end

if (A2(1,1)-A2(1,2)-A2(2,1)+A2(2,2))>0
    p2=0;
else
    p2=-1;
end
%% Create figure
figure
clf
xlim([-0.2 1.2]);
ylim([-0.2 1.2]);
xlabel('p^{1}');
ylabel('p^{2}');
title('Best Response Functions of BiMatrix 2x2 Game: R^1(p^2) (red) and R^2(p^1) (blue)');
hold on;
%% Check if M2 out of borders, else plot regularly
if M2<0
    M2=0;
    %plot([M2 1],[1 1],'Color','blue','Linewidth',3) %hor right
    plot([M2 1],[1+p2 1+p2],'Color','blue','Linewidth',3)%hor right
    hold on
elseif M2>1
    M2=1;
    line([0 M2],[0-p2 0-p2],'Color','blue','Linewidth',3)%hor left
    hold on
else
    line([0 M2],[0-p2 0-p2],'Color','blue','Linewidth',3)%hor left
    hold on
    plot([M2 1],[1+p2 1+p2],'Color','blue','Linewidth',3)%hor right
    hold on
    line([M2 M2],[0 1],'Color','blue','Linewidth',3)%ver
    hold on 
end

if M1<0
    M1=0;
    %plot([1 1],[M1 1],'Color','red','Linewidth',3)%ver right
    plot([1+p1 1+p1],[M1 1],'Color','red','Linewidth',3)%ver right
    hold on
elseif M1>1
    M1=1;
    line([0-p1 0-p1],[0 M1],'Color','red','Linewidth',3)%ver left
    hold on
else
    line([0-p1 0-p1],[0 M1],'Color','red','Linewidth',3)%ver left
    hold on
    plot([1+p1 1+p1],[M1 1],'Color','red','Linewidth',3)%ver right
    hold on
    line([0 1],[M1 M1],'Color','red','Linewidth',3)%hor    
end

end

%% 2.3.8, 2.3.9, 2.3.11
%A1=[2 -1;-1 1];
%A2=[1 -1;-1 2];

%A1=[-4 2;2 1];
%A2=[1 0;2 3];

%A1=[-5 0;-20 -1];
%A2=[-5 -20;0 -1];
