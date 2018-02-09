function SURF_Features( Image )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

imshow(Image);
hold on;
points = detectSURFFeatures(rgb2gray(Image));
plot(points);

end

