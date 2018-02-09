function Epipole_Lines_Img1( matchedImage2,image1, fLMedS, inliers )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

epiLines1 = epipolarLine(fLMedS', matchedImage2(inliers, :).Location);
points1 = lineToBorderPoints(epiLines1, size(image1));
imshow(image1);
hold on;
line(points1(:, [1,3])', points1(:, [2,4])');
[isIn, epipole] = isEpipoleInImage(fLMedS, size(image1));
if isIn
    plot_circle(epipole, 10, 'fillcolor', 'r', 'LineWidth', 2);
end




end

