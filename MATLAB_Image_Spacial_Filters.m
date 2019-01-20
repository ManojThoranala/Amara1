clc
clear
clear All

%%%%%%%%%%%%%%%%%%%%Laplacian Mask%%%%%%%%%%%%%%%%%%%%%%%%

original = imread('lena_gray_256.tif');
%fplap = [0 1 0; 1 -8 1; 0 1 0];
fplap = [0 1 0; 1 -4 1; 0 1 0];    %Laplacian at a point
filtim = imfilter(original,fplap,'symmetric', 'conv');
figure(1)
subplot(2,2,1)
imshow(original);
title('Original');
% flap1 = fspecial('laplacian', .2);
% filtim = imfilter(original,flap1,'symmetric', 'conv');

subplot(2,2,2)
imshow(filtim);
title('Laplacian Point Filtered');

subplot(2,2,3)
imshow(original-filtim);
title('Difference Image');

%%%%%%%%%%%%%%%%%%%Edge Direction Masks%%%%%%%%%%%%%%%%



fxdir = [-1 -1 -1; 2 2 2; -1 -1 -1];      %Grad in x
fydir = [-1 2 -1;-1 2 -1;-1 2 -1];     %Grad in y
f45 = [2 -1 -1; -1 2 -1; -1 -1 2];      %45 degree
f_45 = [-1 -1 2; -1 2 -1; 2 -1 -1];    %-45 degree
xedge = imfilter(original,fxdir,'symmetric', 'conv');
yedge = imfilter(original,fydir,'symmetric', 'conv');
edge45 = imfilter(original,f45,'symmetric', 'conv');
edeg_45 = imfilter(original,f_45,'symmetric', 'conv');


figure(2)
subplot(2,2,1)
imshow(xedge);
title('Horizontal Edges');

subplot(2,2,2)
imshow(yedge);
title('Verticle Edge');

subplot(2,2,3)
imshow(edge45);
title('45 degress edge');

subplot(2,2,4)
imshow(edeg_45);
title('-45 degress edge');

%%%%%%%%%%%%%%%%%%%%%%%%%%Edge detection%%%%%%%%%%%%%

BW1 = edge(original,'sobel');
BW2 = edge(original,'canny');

BW3 = edge(original,'Prewitt');
BW4 = edge(original,'Roberts');

BW5 = edge(original,'log');


figure(3)
subplot(2,2,1)
imshow(original)
title('Original Image');

subplot(2,2,2)
imshowpair(BW1,BW2,'montage')
title('Sobel Filter                                     Canny Filter');

subplot(2,2,3)
imshowpair(BW3,BW4,'montage')
title('Perwitts Filter                                  Roberts Filter');

subplot(2,2,4)
imshow(BW5)
title('LOG filter');


%%%%%%%%%%%%%% Morphological Smoothing and Morphological gradient%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Gradients%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
se = strel(ones(3,3));
basic_gradient = imdilate(original, se) - imerode(original, se);

figure(4)
subplot(2,3,1), imshow(original),title('Original');

subplot(2,3,2), imshow(basic_gradient, []), title('Basic Gradient');

internal_gradient = original - imerode(original, se);

subplot(2,3,3), imshow(internal_gradient, []),title('Internal Gradient');

external_gradient = imdilate(original, se) - original;

subplot(2,3,4), imshow(external_gradient, []),title('External Gradient');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%smoothing%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
salt_pepper = imnoise(original,'salt & pepper',0.5);
[level,EM] = graythresh(salt_pepper);
BW = imbinarize(salt_pepper,level);
A=original;
se1 = strel('disk',1);
A1=imopen(A,se1);
A2=imclose(A1,se1);
A3=imopen(A2,se1);
A4=imclose(A3,se1);
A5=imopen(A4,se1);
A6=imclose(A5,se1);
A7=imopen(A6,se1);
A8=imclose(A7,se1);
A9=imopen(A8,se1);
A10=imclose(A9,se1);
A11=imopen(A10,se1);
A12=imclose(A11,se1);


figure(5)
subplot(2,2,1)
imshow(salt_pepper)
title('Noisy Image');

subplot(2,2,2)
imshow(A4)
title('I iteration');

subplot(2,2,3)
imshow(A8)
title('II iteration');

subplot(2,2,4)
imshow(A12)
title('III iteration');







