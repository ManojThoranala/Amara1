clc
clear
clear All

original = imread('lena_gray_256.tif');
subplot(3,4,1)
imshow(original);
title('Original Image');

%%%%%%%%%%%%%%%%%Gaussian Noise Adding%%%%%%%%%%%%%%%%%%%%%%%

subplot(3,4,2)
gaussian = imnoise(original,'gaussian');%by default m=0,v=0.01, -- GaussianNoise with mean and variance to the image
imshow(gaussian)
title('Gaussian Noisy Image');

%%%%%%%%%%%%%%%%%%Filtering Gaussian Noise%%%%%%%%%%%%%%%%%%%
M=3;
N=3;
h=[M, N];
Q=1.5;
D=16;
a_mean = fspecial('average',h);
a_meanfiltered = imfilter(gaussian, a_mean, 'replicate');
g_meanFilterd = gmean(gaussian,M,N);
h_meanFilterd = harmean(gaussian,M,N);
ch_meanFilterd = charmean(gaussian,M,N,Q);
alpha_meanFilterd = alphatrim(gaussian,M,N,D);


subplot(3,4,3)
imshow(a_meanfiltered);
title('ArithmeticMean Filtered');

subplot(3,4,4)
imshow(g_meanFilterd)
title('GeometricMean Filtered');

subplot(3,4,5)
imshow(h_meanFilterd)
title('HarmonicMean Filtered');

subplot(3,4,6)

imshow(ch_meanFilterd)
title('ContraHarmonicMean Filtered');

subplot(3,4,7)

imshow(alpha_meanFilterd)
title('AlphaTrim Filtered');

subplot(3,4,8)
medImage=medfilt2(gaussian,[M,N],'symmetric');
imshow(medImage);
title('Median Filtered');

subplot(3,4,9)
medImage2=ordfilt2(gaussian,5,ones(M,N),'symmetric');
imshow(medImage2);
title('Median Filtered 2');

subplot(3,4,10)
maxImage=ordfilt2(gaussian,M*N,ones(M,N),'symmetric');
imshow(maxImage);
title('Maximum Filtered');

subplot(3,4,11)
minImage=ordfilt2(gaussian,1,ones(M,N),'symmetric');
imshow(maxImage);
title('Minimum Filtered');

subplot(3,4,12)
mdpImage = imlincomb(0.5,minImage,0.5,maxImage);
imshow(mdpImage);
title('Midpoint Filtered');









