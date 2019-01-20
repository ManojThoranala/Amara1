clc
clear
clear All

original=imread('lena_gray_256.tif');
subplot(3,5,1)
imshow(original);
title('Original Image');

subplot(3,5,2)
h=histogram(original);
title('Histogram');

desired='lena_gray.bmp';
imwrite(original,desired);
subplot(3,5,3)
imshow(desired);
title('Converted Image');

rotatedimage=imrotate(original,60);
subplot(3,5,4)
imshow(rotatedimage);
title('Rotated Image');

translatedimage=imtranslate(original,[20,25]);
subplot(3,5,5)
imshow(translatedimage);
title('Translated Image');

negativeimage=imcomplement(original);
subplot(3,5,6)
imshow(negativeimage);
title('Negated Image');

HistoeqImage=histeq(original);
subplot(3,5,7)
he=histogram(HistoeqImage);
title('Equalized Histo');

subplot(3,5,8)
imshow(HistoeqImage);
title('Equalized Image');

HistomatchImage=imhistmatch(original,HistoeqImage);
subplot(3,5,9)
imshow(HistomatchImage);
title('Matched Image');

subplot(3,5,10)
hm=histogram(HistomatchImage);
title('Matched Histo');

I=ones(3);
lowpasskernel=I/9;
noisy=imnoise(original,'gaussian');
subplot(3,5,11)
imshow(noisy);
title('Noisy Image');

Smooth=conv2(noisy,lowpasskernel);
SmoothImage=uint8(Smooth);
subplot(3,5,12)
imshow(SmoothImage);
title('Smooth Image');

MedImage=medfilt2(noisy,[3,3]);
subplot(3,5,13)
imshow(MedImage);
title('Median Filtered Image');

allpasskernel=[0,0,0;0,1,0;0,0,0];
highpasskernel=allpasskernel-lowpasskernel;
Sharp=conv2(original,highpasskernel);
SharpImage=uint8(Sharp);
subplot(3,5,14)
imshow(SharpImage);
title('Sharpened Image');

c=2;
highboostkernel=allpasskernel+(c*highpasskernel);
BoostSharp=conv2(original,highboostkernel);
BoostSharpImage=uint8(BoostSharp);
subplot(3,5,15)
imshow(BoostSharpImage);
title('Highboost Filterd Image');

zoom=imresize(original,2); 
figure('Name','Zoomed Image'),imshow(zoom);
shrink=imresize(original,0.2);
figure('Name','Shrinked Image'),imshow(shrink);


