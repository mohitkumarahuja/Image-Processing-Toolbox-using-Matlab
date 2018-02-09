function  Shape_Descriptor( Image )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

imshow(Image);hold on;
image = im2bw(Image);
image = imfill(image, 'holes');
image = bwlabel(image);
hold on;
rp = regionprops(image, 'BoundingBox');
boundingBoxCount = length(rp);
showAsCircle = true;
for i = 1 : boundingBoxCount
    if showAsCircle
        rectangle('Position', rp(i).BoundingBox, 'Linewidth', 3, 'EdgeColor', 'r', 'Curvature', [1 1]);
    else
        rectangle('Position', rp(i).BoundingBox, 'Linewidth', 3, 'EdgeColor', 'r');
    end   
end





end

