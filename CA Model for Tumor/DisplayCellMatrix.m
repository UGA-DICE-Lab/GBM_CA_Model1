function DisplayCellMatrix(cellMatrix,h,mastMat)
sz=size(cellMatrix);

imageMat=zeros(sz(1),sz(2),3);



% For state 1 - Live Cells (White Color)
imageMat(:,:,1)=imageMat(:,:,1)+(cellMatrix==1).*1;
imageMat(:,:,2)=imageMat(:,:,2)+(cellMatrix==1).*1;
imageMat(:,:,3)=imageMat(:,:,3)+(cellMatrix==1).*1;

% For state 0 - Dead Cells (Black Color)
imageMat(:,:,1)=imageMat(:,:,1)+(cellMatrix==0).*255;
imageMat(:,:,2)=imageMat(:,:,2)+(cellMatrix==0).*0;
imageMat(:,:,3)=imageMat(:,:,3)+(cellMatrix==0).*0;

% For state 2 - Quiecent Cells (Red Color)
imageMat(:,:,1)=imageMat(:,:,1)+(cellMatrix==2).*255;
imageMat(:,:,2)=imageMat(:,:,2)+(cellMatrix==2).*255;
imageMat(:,:,3)=imageMat(:,:,3)+(cellMatrix==2).*0;

% For state 3 - Proliferating Cells (Yellow Color)
imageMat(:,:,1)=imageMat(:,:,1)+(cellMatrix==3).*0;
imageMat(:,:,2)=imageMat(:,:,2)+(cellMatrix==3).*255;
imageMat(:,:,3)=imageMat(:,:,3)+(cellMatrix==3).*0;

% For state 4 - Invasive Cells (Green Color) % Not using Invasive cells
% now.
%imageMat(:,:,1)=imageMat(:,:,1)+(cellMatrix==4).*0;
%imageMat(:,:,2)=imageMat(:,:,2)+(cellMatrix==4).*255;
%imageMat(:,:,3)=imageMat(:,:,3)+(cellMatrix==4).*0;



% For state 4 - Oedema Cells (Blue Color)
imageMat(:,:,1)=imageMat(:,:,1)+(cellMatrix==4).*0;
imageMat(:,:,2)=imageMat(:,:,2)+(cellMatrix==4).*0;
imageMat(:,:,3)=imageMat(:,:,3)+(cellMatrix==4).*255;

figure(h)
imshow(uint8(imageMat).*mastMat)

end