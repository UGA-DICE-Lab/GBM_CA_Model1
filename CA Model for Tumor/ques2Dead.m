function [cellMatrix,modifMatrix]=ques2Dead(cellMatrix,modifMatrix,P_pd)


sz=size(cellMatrix);
cellMatrix1=cellMatrix;
modifMatrix=zeros(sz);
[hLx hLy]=find(cellMatrix==1| cellMatrix==4);

[eLx eLy]=find(cellMatrix==2 & modifMatrix==0);

for i=1:length(eLx)
    
    Lx=eLx(i);
    Ly=eLy(i);
    Mdist=min(sqrt((hLx-Lx).^2+(hLy-Ly).^2))

   
    Ppd=(1-(1-P_pd)^Mdist)
    P=rand(1)
%      pause(10)
    if P<Ppd 
         cellMatrix(Lx,Ly)=0;
         modifMatrix(Lx,Ly)=1;
    end
    
    

    end



end



