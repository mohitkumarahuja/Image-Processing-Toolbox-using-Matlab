function Harris_Detection( Image )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

im = Image;
image = im2bw(im);
image = imfill(image, 'holes');
image = bwlabel(image);
imshow(im);
hold on;
corners = corner(image, 'Harris', 200);
hold on;
plot(corners(:, 1), corners(:, 2), 'r*');
% im = Image;
% imshow(im);
% hold on;
% corners = detectFASTFeatures(rgb2gray(im));
% plot(corners);
end

