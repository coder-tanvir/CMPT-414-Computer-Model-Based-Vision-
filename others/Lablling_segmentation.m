clc;
clear all;
close all;

a=imread('cat.jpg');
figure,imshow(a);
title('original image');

b=rgb2gray(a);
figure,imshow(b);
title('grayscaleimage');

c=255-b;
figure,imshow(c);
title('complement of the original');

d=imbinarize(c);
figure,imshow(d);
title('binarized version');

e=imfill(d,'holes');
figure,imshow(e);
title('using imfill');

label=bwlabel(e);
%max(max(label))
%im1=(label==1);
%figure,imshow(im1);
%itle('if it works');

for j=1:max(max(label))
    [row,col]=find(label==j);
    len=max(row)-min(row)+2;
    breadth=max(col)-min(col)+2;
    target=uint8(zeros([len breadth]));
    sy=min(col)-1;
    sx=min(row)-1;
    
    for i=1:size(row,1)
        x=row(i,1)-sx;
        y=col(i,1)-sy;
        target(x,y)=a(row(i,1),col(i,1));
    end
    mytitle=strcat('object number:', num2str(j));
    figure,imshow(target); title(mytitle);
end

[L,n]=bwlabel(c);
disp(n);


%label=bwlabel(c);









