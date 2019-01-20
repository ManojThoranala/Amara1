clc
clear
clear All

original = imread('lena_gray_256.tif');

mean_shift(original,40,3,3);