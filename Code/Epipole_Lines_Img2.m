function Epipole_Lines_Img2( matchedImage1,image2,fLMedS, inliers )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

epiLines2 = epipolarLine(fLMedS, matchedImage1(inliers, :).Location);
points2 = lineToBorderPoints(epiLines2, size(image2));
imshow(image2);
hold on;
line(points2(:, [1,3])', points2(:, [2,4])');
[isIn,epipole] = isEpipoleInImage(fLMedS, size(image2));
if isIn
    plot_circle(epipole, 10, 'fillcolor', 'r', 'LineWidth', 2);
end


end

