clc;
clear all;
close all;
%% Change Values here
fleName='vol_image001echo001-10010.jpg';
trl=2; % Trial Number
%%
mastImage=imread(fleName);
h1=figure;imshow(mastImage);
deNoiseImage=denoise_dw2d_t1(mastImage);
h2=figure;subplot(131);imshow(mastImage);subplot(132);imshow(deNoiseImage);subplot(133);imshow(imabsdiff(mastImage,deNoiseImage),[]);
primImage=deNoiseImage;
mask=zeros(size(primImage));
mask(25:end-25,25:end-25)=1;
bw=activecontour(primImage,mask,300);
secImage=uint8(bw).*primImage;
h3=figure;imshow(secImage); title('Background Removal');%Background Removal
% Mark foreground objects - Morphological operation applying disks. Remove
% elements smaller than disks of size 2 pixels
% Image Erosion
se=strel('disk',2);
Ie=imerode(secImage,se);
Iobr=imreconstruct(Ie,secImage); 
h4=figure;imshow(Iobr);  title('Erosion');
% Image Dilation
Iobrd=imdilate(Iobr,se);
Iobrcbr=imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr=imcomplement(Iobrcbr);
figure;imshow(Iobrcbr); title('Dilation');
%% Fill the spots
Iobrcbr=imfill(histeq(Iobrcbr));
h5=figure;imshow(histeq(Iobrcbr)); title('Fill Spots');
dum1=histeq(Iobrcbr);
[xs,ys]=getpts(h5);
xs=round(xs);
ys=round(ys);
BW=zeros(size(mastImage));
tols=input('Enter Max. Tolerance:');
for i=tols:-1:1
    BW=BW+double(grayconnected(dum1,ys,xs,i));
 LabelMat{i}=double(grayconnected(dum1,ys,xs,i));
end

%%
h6=figure;imshow(mastImage);hold on;
Lrgb=label2rgb(BW,'jet','w');
dum2(:,:,1)=mastImage;
dum2(:,:,2)=mastImage;
dum2(:,:,3)=mastImage;
Lrgb(Lrgb==255)=1;
dum3=dum2.*Lrgb;
h7=figure;imshow(dum3);
title('Labeled Regions');
saveName=strcat(fleName(1:end-4),'_',num2str(trl));
save(saveName);
clear all;