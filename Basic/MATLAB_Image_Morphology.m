
%%%%%%%%%%%%%%%%%%% Otsu's Method%%%%%%%%%%%%%%%using graythresh%%%%%%%%%%%

clc
clear
clear All

original1 = imread('lena_gray_256.tif');



circles = imread('circles.png');

original2 = rgb2gray(circles);

figure(1)
subplot(2,1,1)
%level1 = graythresh(original1);
[level1,EM1] = graythresh(original1);
BW1 = imbinarize(original1,level1);
imshowpair(original1,BW1,'montage'), title('Otsu Thresholding');


subplot(2,1,2)
% level2 = graythresh(original2);
[level2,EM2] = graythresh(original2);
BW2 = imbinarize(original2,level2);
imshowpair(original2,BW2,'montage')


%%%%%%%%%%%%%%%%%%%%%%Morphological Methods%%%%%%%%%%%%%%%%%%%


A=BW1;%%%%%%%%%%lena%%%%%%%%%%%%%%%  
B=BW2;%%%%%%%%%%Circles%%%%%%%%%%%%

%se = strel(shape, parameters)
se1 = strel('diamond',8);%B1=[0 1 0; 1 1 1; 0 1 0];%%%%%SE%%%%%
se2 = strel('square', 3);%%3=width%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
se3 = strel('disk',2);%%3=radius%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
se4 = strel('rectangle',[3,1]);%%[3,1]=Rectangle size%%%%%%%%%%

%%%%%%%%%%%%%%%%se1 and se2%%%%%%%%%%%%%%%%
A11=imdilate(A,se1);
A12=imerode(A,se1);
A13=imopen(A,se1);
A14=imclose(A13,se1);
interval1 = [0 -1 -1
            1  1 -1
            0  1  0];
A15=bwhitmiss(A,interval1);
%%%%%%%%%%%%%%%%%%%se2 and se4%%%%%%%%%%%%
A21=imdilate(A,se2);
A22=imerode(A,se2);
A23=imopen(A,se2);
A24=imclose(A23,se2);
interval2 = [0 -1 -1 1
            1  1 -1 0
            0  1  0 -1];
A25=bwhitmiss(A,interval2);
%%%%%%%%%%%%%%%%display%%%%%%%%%%%%%%%%%%%
figure(2)
subplot(2,5,1)
imshow(A11)
title('Lena Image Dilated 1');

subplot(2,5,2)
imshow(A12)
title('Lena Image Eroded 1');

subplot(2,5,3)
imshow(A13)
title('Lena Image Opened 1');

subplot(2,5,4)
imshow(A14)
title('Lena Image Closed 1');

subplot(2,5,5)
imshow(A15)
title('Lena Image Hit/Miss 1');
%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,5,6)
imshow(A21)
title('Lena Image Dilated 2');

subplot(2,5,7)
imshow(A22)
title('Lena Image Eroded 2');

subplot(2,5,8)
imshow(A23)
title('Lena Image Opened 2');

subplot(2,5,9)
imshow(A24)
title('Lena Image Closed 2');

subplot(2,5,10)
imshow(A25)
title('Lena Image Hit/Miss 2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

B11=bwmorph(B,'dilate',5);
B12=bwmorph(B,'erode',5);
B13=bwmorph(B,'open',5);
B14=bwmorph(B13,'close',5);
interval3 = [0 -1 -1 -1
            1  1 -1 0
            0  1  0 1];
B15=bwhitmiss(B,interval3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B21=imdilate(B,se3);
B22=imerode(B,se3);
B23=imopen(B,se3);
B24=imclose(B23,se3);
interval4= [0 -1 -1
            1  1 -1
            0  1  0];
B25=bwhitmiss(B,interval4);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
subplot(2,5,1)
imshow(B11)
title('Circles Dilated 1');

subplot(2,5,2)
imshow(B12)
title('Circles Eroded 1');

subplot(2,5,3)
imshow(B13)
title('Circles Opened 1');

subplot(2,5,4)
imshow(B14)
title('Circles Closed 1');

subplot(2,5,5)
imshow(B15)
title('Circles Hit/Miss 1');
%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,5,6)
imshow(B21)
title('Circles Dilated 2');

subplot(2,5,7)
imshow(B22)
title('Circles Eroded 2');

subplot(2,5,8)
imshow(B23)
title('Circles Opened 2');

subplot(2,5,9)
imshow(B24)
title('Circles Closed 2');

subplot(2,5,10)
imshow(B25)
title('Circles Hit/Miss 2');






