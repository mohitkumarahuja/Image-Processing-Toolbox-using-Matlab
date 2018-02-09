function [ img_1, img_2, matchedImage1, matchedImage2 ] = Find_Match( img_1,img_2)
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

img_1 = rgb2gray(img_1);
img_2 = rgb2gray(img_2);

pointsImage1  = detectSURFFeatures(img_1);
pointsImage2 = detectSURFFeatures(img_2);

[featuresImage1,   validPointsImage1]  = extractFeatures(img_1,  pointsImage1);
[featuresImage2, validPointsImage2]  = extractFeatures(img_2, pointsImage2);
indexPairs = matchFeatures(featuresImage1, featuresImage2);

matchedImage1  = validPointsImage1(indexPairs(:, 1));
matchedImage2 = validPointsImage2(indexPairs(:, 2));


end

