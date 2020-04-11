function [cellMatrix,modifMatrix]=edema2Prolif(cellMatrix,P_ep)
sz=size(cellMatrix);
cellMatrix1=cellMatrix;
modifMatrix=zeros(sz);


[eLx eLy]=find(cellMatrix==4)

for i=1:length(eLx)
    Lx=eLx(i);
    Ly=eLy(i);
    if Lx-1>=1 && Lx+1 <= sz(1) && Ly-1>=1 && Ly+1<=sz(2)
        subMatrix=cellMatrix1(Lx-1:Lx+1,Ly-1:Ly+1)
        totPCells=sum(sum(subMatrix==3))
        Pep=(1-(P_ep)^totPCells)
        P=rand(1)
        if P>Pep && totPCells~=0
            cellMatrix(Lx,Ly)=3;
            modifMatrix(Lx,Ly)=1;
        end
        totQCells=sum(sum(subMatrix==2 | subMatrix==0))
        if totQCells>=6
            cellMatrix(Lx,Ly)=0;
            modifMatrix(Lx,Ly)=1;
        end
        
    

    end



end

end
