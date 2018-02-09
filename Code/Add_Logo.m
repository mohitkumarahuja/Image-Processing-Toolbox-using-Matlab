function [ alphaResize,logoResize,rows,cols] = Add_Logo( logo, map, alpha )
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox



logoResize = imresize(logo, 0.1, 'bilinear');% Resize the MATLAB logo
alphaResize = imresize(alpha, 0.1, 'bilinear');% Make sure you do the same for the alpha map
alphaResize = repmat(alphaResize, [1 1 3]);% Duplicate the alpha map to make this three channels - This is a colour image
alphaResize = im2double(alphaResize);% Make double to ensure mixing
% Get the size of the resized logo - we need this to properly mix the stuff in
rows = size(logoResize, 1);
cols = size(logoResize, 2);

end

