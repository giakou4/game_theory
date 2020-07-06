function [U] = BackInd(v,U,A,O)
% function [U] = BackInd(v,U,A,O)
% BACKIND  performs backwards induction is the tree game defined by a
% directred tree given within an adjacency matrix A and a root v. The
% payoffs of the leaves are defined in the payoff matrix O and the
% ownership of each vertex is defined in the owndership matrix O
% The current code is only for 2 players.
% INPUT:
% v         : start vertex
% U         : payoffs of each leaf in the graph with dimensions nx2
% A         : adjacency matrix with dimension nxn, where n is equal to the 
%             number of vertices
% O         : ownership matrix: 1 for P1, 2 for P2, 0 for leaf with
%             dimension nx1
%
% OUTPUT:
% U         : ( U(1,1), U(1,2) ) is the NE and the SPE of the game tree

succ=find(A(v,:)==1);
K=length(succ);
if K>0
    UnBest=-inf;
    for k=1:K
        U=BackInd(succ(k),U,A,O);
        if U(succ(k),O(v))>UnBest
            U(v,:)=U(succ(k),:);
            UnBest=U(succ(k),O(v));
        end
    end
end
%disp([v U(v,:)]);
end

% e.g.: Ultimatum game
%{
A = zeros(7,7);
A(1,2)=1; A(1,3)=1; A(2,4)=1; A(2,5)=1; A(3,6)=1; A(3,7)=1;
O=[ 1 2 2 0 0 0 0];
U=[0 0;0 0; 0 0; 5 5; 0 0; 8 2; 0 0];
v = 1;
U = BackInd(v,U,A,O);
disp(['SPE is (',num2str(U(1,1)),', ',num2str(U(1,2)),')']);
%}

% e.g.: A random game
%{
A=zeros(9,9);
A(1,2)=1; A(2,4)=1; A(2,5)=1; A(1,3)=1; A(3,6)=1; A(3,7)=1; A(7,8)=1; A(7,9)=1;
O=[1, 2, 2, 0, 0, 0, 1, 0, 0];
U=[0,0; 0,0; 0,0; 3,8; 8,3; 5,5; 0,0; 2,10; 1,0];
v=1;
U=BackInd(v,U,A,O);
disp(['SPE is (',num2str(U(1,1)),', ',num2str(U(1,2)),')']);
%}
