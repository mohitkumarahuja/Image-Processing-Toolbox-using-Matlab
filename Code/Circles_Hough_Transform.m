function Circles_Hough_Transform( Image )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

radius=[15 30];
A = Image;
imshow(A);hold on;
[centers, radii] = imfindcircles(A, radius);
viscircles(centers, radii, 'EdgeColor', 'b');

end

