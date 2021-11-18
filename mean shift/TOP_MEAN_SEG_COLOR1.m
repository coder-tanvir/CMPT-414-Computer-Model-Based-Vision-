img=imread('head.jpg');
img1=imresize(img,[256,256]);
%figure,imshow(img1);
%dim=ndims(img1);
%if(dim==3)
    img11=rgb2gray(img1);
% end
wresize=256;
img=double(img11);
filt_img=img;
no_of_grp=6;
img_in=double(filt_img(:));
m=1.2;
term_thr=1e-3;
eta=2.0;
max_iter=500;
init_val=randsrc(no_of_grp,1,1:255);

[group_val,grp_loc]=segment_process(img_in,no_of_grp,[m; eta; max_iter; term_thr;1],init_val);
finalimg=zeros(256,256);


for k3= 1:no_of_grp
    img_val1=zeros(256,256);
    loc1=find(grp_loc(k3,:)==max(grp_loc));
    
    img_val1(loc1)=img(loc1);
    loc3=find(img_val1 ~=0);
    finalimg(loc3)=k3*50;
end

%figure,imshow(uint8(finalimg));
edimg=edge(finalimg);
%figure,imshow(edimg);
partimg=1-edimg;

img1=double(img1);
fullimg(:,:,1)=img1(:,:,1).*partimg;
fullimg(:,:,2)=img1(:,:,2).*partimg;
fullimg(:,:,3)=img1(:,:,3).*partimg;

figure,imshow(uint8(fullimg));



    
    
    
    
    
    
    
    
    
    







