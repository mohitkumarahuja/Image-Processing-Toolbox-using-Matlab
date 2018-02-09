function [ Image_out ] = Canny_Edge_Detection( image )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

threshold = 2;
sigma = 1.5;
if nargin < 2
    threshold = [];
    sigma = sqrt(2);
elseif nargin < 3
    sigma = sqrt(2);
end

if size(image, 3) > 1
    image = rgb2gray(image);
end

Image_out = edge(image, 'canny', threshold, sigma);

end

