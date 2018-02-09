function  Lines_Hough_Transform( image )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox

image = im2double(image);
image = rgb2gray(image);
image = edge(image, 'canny');
[H, T, R] = hough(image);
threshold = ceil(0.5 * max(H(:)));
P  = houghpeaks(H, 100, 'threshold', threshold);
fillGap = 20;
minLineLength=8;
lines = houghlines(image, T, R, P, 'FillGap', fillGap, 'MinLength', minLineLength);
lineCount = length(lines);
hold on;
for k = 1 : lineCount
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'green');
    plot(xy(1,1), xy(1,2), 'x', 'LineWidth', 2, 'Color', 'yellow');
    plot(xy(2,1), xy(2,2), 'x', 'LineWidth', 2, 'Color', 'red');
end
hold off;


end

