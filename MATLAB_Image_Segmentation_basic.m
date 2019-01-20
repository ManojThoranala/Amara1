clc
clear
clear All

circles=imread('circles.png');
original = rgb2gray(circles);


%%%%%%%%%%%%%%%%Boundary Extraction%%%%%%%%%%%%%%

B8=bwperim(original,8);
B4=bwperim(original,4);
se = strel('disk',4);
B = original - imerode(original,se);

subplot(2,3,1)
imshow(original);
title('Original Image');

subplot(2,3,2)
imshowpair(B8,B4,'montage');
title('Boundary segmenting by 4 and 8 Connectivity');

subplot(2,3,3)
imshow(B);
title('Boundary Extraction - Morphology');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Region Filling%%%%%%%%%%%%%%%%%

[level2,EM2] = graythresh(original);
BW= imbinarize(original,level2);
R1 =imfill(BW,'holes');
%R2 = imfill(BW);
subplot(2,3,4)
imshow(R1)
title('Region Fill');
%subplot(2,3,4)
%imshow(R2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
thin=bwmorph(BW,'thin',10);
thick=bwmorph(BW,'thicken',10);
subplot(2,3,5)
imshow(thin)
title('Thinning');

subplot(2,3,6)
imshow(thick)
title('Thickening');

