
%% 2.1 DoG

clear all;
close all;
clc;

img1 = imread('gauche.jpg');
img2 = imread('droite.jpg');

figure;
imshow(img1);

figure;
imshow(img2);

img1G = double(rgb2gray(img1)) / 255 ;
img2G = double(rgb2gray(img2)) / 255;

figure;
imshow(img1G);

figure;
imshow(img2G);

pyr1 = GaussianPyramid(img1G,3,1);
pyr2 = GaussianPyramid(img2G,3,1);

printGaussPyramid(pyr1);
printGaussPyramid(pyr2);

DoG1 = DoG(img1G,3,1);
DoG2 = DoG(img2G,3,1);

printDoG(DoG1);
printDoG(DoG2);

%%

[start1,med1,new_med1,kpts1] = detectKeypoints(DoG1);
[start2,med2,new_med2,kpts2] = detectKeypoints(DoG2);

%%

plotKeypoints(img1G,kpts1);
plotKeypoints(img2G,kpts2);

kptsOri1 = assignOrientations(kpts1,pyr1);
kptsOri2 = assignOrientations(kpts2,pyr2);

plotKeypointsOri(img1G,kptsOri1);
plotKeypointsOri(img2G,kptsOri2);

%%

[mags1,thts1] = getGradient(pyr1);
[mags2,thts2] = getGradient(pyr2);

desc1 = getDescriptors(kptsOri1,mags1,thts1);
desc2 = getDescriptors(kptsOri2,mags2,thts2);


%%

distanceM = distanceInterpoints(desc1,desc2);

[points1,points2] = matchingPoints(50,distanceM,desc1,desc2);

plotKeypointsMatch(img1G,img2G,points1,points2);

%%

H = getHomography(points1,points2);

P = getPano(img1,img2,H);

figure;
imshow(P,[]);

% Comments
% Before considering 2 points as matching, I should make sure the have the
% same scale. And discard the pair if they don't.







    

