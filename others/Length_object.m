clc;
close all;
clear all;

imagea=imread('differentobjects.jpg');
figure;
imshow(imagea);
title('Original');

imageb=rgb2gray(imagea);
%figure(2);
%imshow(imageb)
%title('Grayscale');


thresh=250;
imgthresh=imageb>200;
cones=imbinarize(imageb, thresh/255);
%figure(3),imshow(cones);


cones=bwareaopen(cones,50);
%figure(4),imshow(cones);

%objects below 150 pixels will be dropped
cone=imcomplement(cones);
[B,L]=bwboundaries(cone,'noholes');
numRegions=max(L(:));
%imshow(label2rgb(L));
%only want thing longer than 150 pixels are bordered red
imagestats=regionprops(cone,'MajorAxisLength');
imageLengths=[imagestats.MajorAxisLength];
keepers=find(imageLengths > 30);  %change the pixel value here
%figure(5),imshow(cone);
title('Things that are kept');
for index=1:length(keepers)
    outline=B{keepers(index)};
    line(outline(:,2),outline(:,1),'color','r','LineWidth',2);
end

















