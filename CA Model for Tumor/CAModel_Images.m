clc;
clear all;
close all;

load('vol_image001echo0010006_2.mat')

sumLab=zeros(size(LabelMat{1}))

h=figure;
h1=figure;
maxIter=100;
for i=1:length(LabelMat)
   sumLab=sumLab+(LabelMat{i}>0); 
end

unqs=unique(sumLab)

cellMat=zeros(size(sumLab));


% pause(10)
cellMat(sumLab==unqs(end))=3
cellMat(sumLab==unqs(end-1))=4
cellMat(sumLab==unqs(end-2))=4
cellMat(sumLab==unqs(end-3))=4
cellMat(sumLab==unqs(end-4))=1

cellMatrix=cellMat

necroArea=sum(sum(cellMatrix==0));
quesArea=sum(sum(cellMatrix==2));
proflifArea=sum(sum(cellMatrix==3));
edemaArea=sum(sum(cellMatrix==4));

necroArea=0;





P_ep=0.2
P_pq=0.05;
P_qd=0.01;


DisplayCellMatrix(cellMatrix,h,mastImage);
PlifeCounter=zeros(256,256)
pause(0.01)
for  iters=1:maxIter
    
figure(h1);
plot(necroArea,'r');hold on;
plot(quesArea,'y')
plot(proflifArea,'g')
plot(edemaArea,'b')
xlim([0 maxIter]);grid on;xlabel('Iterations'); ylabel('Area');
legend({'Necrotic Region','Quiescent Region', 'Proliferating Region', 'Edema Region'});
hold off;
DisplayCellMatrix(cellMatrix,h,mastImage);
PlifeCounter=pLifeUpdate(cellMatrix,PlifeCounter);

[cellMatrix modifMatrix]=edema2Prolif(cellMatrix,P_ep);
[cellMatrix modifMatrix]=prolif2Ques(cellMatrix,modifMatrix,PlifeCounter,P_pq);

[cellMatrix modifMatrix]=ques2Dead(cellMatrix,modifMatrix,P_qd);

[cellMatrix modifMatrix]=hel2Dead(cellMatrix,modifMatrix);


necroArea=[necroArea sum(sum(cellMatrix==0))];
quesArea=[quesArea sum(sum(cellMatrix==2))];
proflifArea=[proflifArea sum(sum(cellMatrix==3))];
edemaArea=[edemaArea sum(sum(cellMatrix==4))];

end

