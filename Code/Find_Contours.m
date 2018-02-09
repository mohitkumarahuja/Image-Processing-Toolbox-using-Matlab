function Find_Contours( Image )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

im = Image;
Image = im2double(im);
Image = rgb2gray(Image);
Image = edge(Image, 'canny');
contourLevels = 1;
imshow(im);hold on;
imcontour(Image, contourLevels);

end

