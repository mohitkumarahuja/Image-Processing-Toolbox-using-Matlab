function FAST_Features( Image )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

imshow(Image);
hold on;
corners = detectFASTFeatures(rgb2gray(Image));
plot(corners);
end

