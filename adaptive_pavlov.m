%% Nikolaos Giakoumoglou AEM: 9043
function a=st902(A1,A2)
T = size(A1,1);
global class;
%% play tft for first 6 rounds
if T==0
    a=1;
    return;%play c for 1st round
elseif T<6
    a = A2(end);
    return; %mimic opponent
end
if T==1000 a=2; end
if T==999 a=2; end
%% analyze last 6 moves
global class;
if mod(T,6)==0
    %% count frequency of last 6 [d] and [c]
    noC=0; noD=0; 
    for i=0:5
        if A2(end-i)==1;
            noC = noC + 1;
        else
            noD = noD + 1;
        end
    end
    %% define opponent based on his choices
    if noC == 6
        class = 1; %cooperative
    elseif noD >= 4
        class = 2; %alld
    elseif noD == 3
        class = 3; %stft
    else
        class = 4; %random
    end
end
%% play accordingly
if class == 4 || class == 2 
    a = 2;
    return;
elseif class == 3 %if [d,d] return d, else return c
    if A2(end) == 2 && A2(end-1) == 2 
        a = 2;
        return;
    else
        a = 1;
        return;
    end
else %class == 1 %play tft
    a = A2(end);
    return;
end     
end


