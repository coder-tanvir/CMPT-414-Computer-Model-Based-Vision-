imss=imread('circles.jpg');
ima=rgb2gray(imss);
ima1=double(ima);
ima11=ima1(:);
copy=ima1;
[R,C]=size(ima1);
mu=[60 165 211];
ass1=zeros(R,C);
ass2=zeros(R,C);
ass3=zeros(R,C);
while(true)
 oldmu=mu;
 for i=1:R
     for j=1:C
         r=ima1(i,j);
         ab=abs((ima1(i,j))-mu);
         mn=find(ab==min(ab));
         if mn(1)==1
             ass1(i,j)=r;
         end
         if mn(1)==2
             ass2(i,j)=r;
         end
         if mn(1)==3
             ass3(i,j)=r;
         end
     end
 end

 co1=ass1(:);
 su1=sum(co1);
 fi1=find(co1);
 len1=length(fi1);
 mm1=su1/len1;
 mm11=round(mm1);
 
  co2=ass2(:);
 su2=sum(co2);
 fi2=find(co2);
 len2=length(fi2);
 mm2=su2/len2;
 mm22=round(mm2);
 
  co3=ass3(:);
 su3=sum(co3);
 fi3=find(co3);
 len3=length(fi3);
 mm3=su3/len3;
 mm33=round(mm3);
 
 mu=[mm11 mm22 mm33];
 if(mu==oldmu) 
     break; 
 end;
end

for i=1:R
    for j=1:C
        if ass1(i,j)>0
            ass1(i,j)=1;
        end
        if ass2(i,j)>0
            ass2(i,j)=2;
        end
            if ass3(i,j)>0
                ass3(i,j)=3;
            end
    end
end

fincluster=(ass1+ass2+ass3);
fincluster1=label2rgb(fincluster);
ff=rgb2gray(fincluster1);
%fff=im2bw(ff);
figure;
imshow(ima);
figure;
title('original image');
imshow(fincluster1);
figure;
title('clustered image');
imshow(ff);
%figure;
%title('clustered image in gray');




       

 
 
 
 
         
           
    
    
