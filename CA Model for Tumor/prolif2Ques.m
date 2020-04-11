function [cellMatrix modifMatrix]=prolif2Ques(cellMatrix,modifMatrix,PlifeCounter,P_pq)
sz=size(cellMatrix);
cellMatrix1=cellMatrix;
modifMatrix=zeros(sz);
[eLx eLy]=find(cellMatrix==3 & modifMatrix==0);

for i=1:length(eLx)
    
    Lx=eLx(i);
    Ly=eLy(i);
    
    life=PlifeCounter(Lx,Ly)
    Ppq=(1-(1-P_pq)^life)
    P=rand(1)
%      pause(10)
    if P<Ppq 
         cellMatrix(Lx,Ly)=2;
         modifMatrix(Lx,Ly)=1;
    end
    
    

    end






end