clc;
clear all;
close all;
h=figure;
%cellMatrix= ones(256,256);
% cellMatrix=randi(5,[256,256])-1; %Test Matrix Random
cellMatrix=ones(256,256);
cellMatrix(60:196,60:196)=4
cellMatrix(123:133,123:133)=3

P_ep=0.7
P_pq=0.2;
P_qd=0.01


DisplayCellMatrix(cellMatrix,h);
PlifeCounter=zeros(256,256)



for  iters=1:1000
DisplayCellMatrix(cellMatrix,h);
PlifeCounter=pLifeUpdate(cellMatrix,PlifeCounter);

[cellMatrix modifMatrix]=edema2Prolif(cellMatrix,P_ep);
[cellMatrix modifMatrix]=prolif2Ques(cellMatrix,modifMatrix,PlifeCounter,P_pq);

[cellMatrix modifMatrix]=ques2Dead(cellMatrix,modifMatrix,P_qd);

[cellMatrix modifMatrix]=hel2Dead(cellMatrix,modifMatrix);





end

