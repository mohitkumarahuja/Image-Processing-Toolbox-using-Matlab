function varargout = Mohit_Figure_VP_Project(varargin)
% This Function was created by Mohit Kumar Ahuja
% For Computer Vision Toolbox
%
% MOHIT_FIGURE_VP_PROJECT MATLAB code for Mohit_Figure_VP_Project.fig
%      MOHIT_FIGURE_VP_PROJECT, by itself, creates a new MOHIT_FIGURE_VP_PROJECT or raises the existing
%      singleton*.
%
%      H = MOHIT_FIGURE_VP_PROJECT returns the handle to a new MOHIT_FIGURE_VP_PROJECT or the handle to
%      the existing singleton*.
%
%      MOHIT_FIGURE_VP_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOHIT_FIGURE_VP_PROJECT.M with the given input arguments.
%
%      MOHIT_FIGURE_VP_PROJECT('Property','Value',...) creates a new MOHIT_FIGURE_VP_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mohit_Figure_VP_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mohit_Figure_VP_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mohit_Figure_VP_Project

% Last Modified by GUIDE v2.5 06-Jun-2017 11:04:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mohit_Figure_VP_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Mohit_Figure_VP_Project_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Mohit_Figure_VP_Project is made visible.
function Mohit_Figure_VP_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mohit_Figure_VP_Project (see VARARGIN)
% Find Matches

% Global Variables
global FirstImage;
global SecondImage;
FirstImage = [];
SecondImage = [];
global Image;
Image = [];
global Homo_FirstImage;
Homo_FirstImage = [];
global Homo_SecondImage;
Homo_SecondImage = [];
global tx;
tx = [];
global oa;
oa = [];
global o;
o = [];
global I;
I = [];

axes(handles.axes1);
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{})
axes(handles.axes2);
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{})
% Choose default command line output for Mohit_Figure_VP_Project
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Mohit_Figure_VP_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mohit_Figure_VP_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in LoadImage.
function LoadImage_Callback(hObject, eventdata, handles)

% Load Image Function 
filename = imgetfile;
global Image;
Image = imread(filename);
im = Image;
axes1 = im;
axes(handles.axes1);
image(axes1)
axes(handles.axes1);
set(handles.axes1,'XTickLabel',{})
set(handles.axes1,'YTickLabel',{})



% --- Executes on button press in SaltAndPepperNoise.
function SaltAndPepperNoise_Callback(hObject, eventdata, handles)

% Adding Salt and pepper Noise
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im = Image;
str=get(handles.edit1, 'string');
noiseDensity= str2num(str);
im1 = imnoise(im, 'salt & pepper', noiseDensity);
axes2 = im1;
axes(handles.axes2);
image(axes2)
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})

% --- Executes on button press in Speckle.
function Speckle_Callback(hObject, eventdata, handles)

% Adding Speckle Noise
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im = Image;
str=get(handles.edit5, 'string');
Variance= str2num(str);
im1 = imnoise(im, 'speckle', Variance);
axes2 = im1;
axes(handles.axes2);
image(axes2)
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})

% --- Executes on button press in AddLogo_2.
function AddLogo_2_Callback(hObject, eventdata, handles)

% Adding Logo-2
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
[logo, map, alpha] = imread('logo3.png');
[ alphaResize,logoResize,rows,cols] = Add_Logo( logo, map, alpha  );

% Mix in the logo with the image
im_2(end-rows+1:end,end-cols+1:end,:) = uint8(alphaResize.*double(logoResize) + ...
                       (1-alphaResize).*double(im_2(end-rows+1:end,end-cols+1:end,:)));
axes2 = im_2;
axes(handles.axes2);
image(axes2)
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})
                   
                   
% --- Executes on button press in AddLogo_1.
function AddLogo_1_Callback(hObject, eventdata, handles)

% Adding Logo-1
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
[logo, map, alpha] = imread('Logo.png');
[ alphaResize,logoResize,rows,cols] = Add_Logo( logo, map, alpha  );

% Mix in the logo with the image
im_2(end-rows+1:end,end-cols+1:end,:) = uint8(alphaResize.*double(logoResize) + ...
                       (1-alphaResize).*double(im_2(end-rows+1:end,end-cols+1:end,:)));
axes2 = im_2;
axes(handles.axes2);
image(axes2)
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})






function edit1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Variance_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Variance_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in up_1.
function up_1_Callback(hObject, eventdata, handles)

% Shifting Logo-1 Up
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
[logo, map, alpha] = imread('Logo.png');
[ alphaResize,logoResize,rows,cols] = Add_Logo( logo, map, alpha  );

% Mix in the logo with the image
im_2(1:rows,end-cols+1:end,:) = uint8(alphaResize.*double(logoResize) + ...
(1-alphaResize).*double(im_2(1:rows,end-cols+1:end,:)));
axes2 = im_2;
axes(handles.axes2);
image(axes2)
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Down_1.
function Down_1_Callback(hObject, eventdata, handles)

% Shifting Logo-1 Down
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
[logo, map, alpha] = imread('Logo.png');
[ alphaResize,logoResize,rows,cols] = Add_Logo( logo, map, alpha  );

% Mix in the logo with the image
im_2(end-rows+1:end,end-cols+1:end,:) = uint8(alphaResize.*double(logoResize) + ...
                       (1-alphaResize).*double(im_2(end-rows+1:end,end-cols+1:end,:)));
axes2 = im_2;
axes(handles.axes2);
image(axes2)
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Up_2.
function Up_2_Callback(hObject, eventdata, handles)

% Shifting Logo-2 Up
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
[logo, map, alpha] = imread('logo3.png');
[ alphaResize,logoResize,rows,cols] = Add_Logo( logo, map, alpha  );

% Mix in the logo with the image
im_2(1:rows,end-cols+1:end,:) = uint8(alphaResize.*double(logoResize) + ...
(1-alphaResize).*double(im_2(1:rows,end-cols+1:end,:)));
axes2 = im_2;
axes(handles.axes2);
image(axes2)
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Down_2.
function Down_2_Callback(hObject, eventdata, handles)

% Shifting Logo-2 Down
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;[logo, map, alpha] = imread('logo3.png');
[ alphaResize,logoResize,rows,cols] = Add_Logo( logo, map, alpha  );

% Mix in the logo with the image
im_2(end-rows+1:end,end-cols+1:end,:) = uint8(alphaResize.*double(logoResize) + ...
                       (1-alphaResize).*double(im_2(end-rows+1:end,end-cols+1:end,:)));
axes2 = im_2;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in ColorSpaceRGB.
function ColorSpaceRGB_Callback(hObject, eventdata, handles)

% Changing Colour space 
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
rgb = (im_2);
axes2 = rgb;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})

% --- Executes on button press in Indexed.
function Indexed_Callback(hObject, eventdata, handles)

% Changing Colour space 
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
str=get(handles.Index, 'string');
Color= str2num(str);

[IND,map] = rgb2ind(im_2,Color);
axes2 = IND;
axes(handles.axes2);
image(axes2);
colormap(map)
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in YCBCR.
function YCBCR_Callback(hObject, eventdata, handles)

% Changing Colour space 
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
YCBCR = rgb2ycbcr(im_2);
axes2 = YCBCR;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in NTSC.
function NTSC_Callback(hObject, eventdata, handles)

% Changing Colour space 
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
YIQ = rgb2ntsc(im_2);
axes2 = YIQ;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})

function Index_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function Index_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Compute_Histogram.
function Compute_Histogram_Callback(hObject, eventdata, handles)

% Compute Histogram
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
imhist(rgb2gray(im_2));
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Equalize_Hisogram.
function Equalize_Hisogram_Callback(hObject, eventdata, handles)

% Equalize Histogram
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
im_3 = histeq(rgb2gray(im_2));
imhist(im_3);
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)

% Morphological Function
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
se1 = strel('square',11) ; 
Closing = imclose(im_2,se1);
axes2 = Closing;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in ERODE.
function ERODE_Callback(hObject, eventdata, handles)

% Morphological Function
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
se1 = strel('square',11) ; 
Erosion = imerode(im_2,se1);
axes2 = Erosion;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in OPEN.
function OPEN_Callback(hObject, eventdata, handles)

% Morphological Function
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
se1 = strel('square',11) ; 
Opening = imopen(im_2,se1);
axes2 = Opening;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Dilate.
function Dilate_Callback(hObject, eventdata, handles)

% Morphological Function
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
se1 = strel('square',11) ; 
Dilating = imdilate(im_2,se1);
axes2 = Dilating;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Blur.
function Blur_Callback(hObject, eventdata, handles)

% Blurring
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
h1 = fspecial('average', [11 11]);
im_5 = imfilter(im_2, h1);
axes2 = im_5;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in blur_2.
function blur_2_Callback(hObject, eventdata, handles)

% Blurring
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
h1 = fspecial('disk', 11);
im_5 = imfilter(im_2, h1);
axes2 = im_5;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Blur_3.
function Blur_3_Callback(hObject, eventdata, handles)

% Blurring
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
h1 = fspecial('gaussian', [13 13], 3);
im_5 = imfilter(im_2, h1);
axes2 = im_5;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in blur_4.
function blur_4_Callback(hObject, eventdata, handles)

% Blurring
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
h1 = fspecial('motion', 20, 0);
im_5 = imfilter(im_2, h1);
axes2 = im_5;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Laplacian.
function Laplacian_Callback(hObject, eventdata, handles)

% Laplacian Operation
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
h1 = fspecial('laplacian');
im_5 = imfilter(im_2, h1);
axes2 = im_5;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)

% Sobel Operation
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
h1 = fspecial('sobel');
im_5 = imfilter(im_2, h1);
axes2 = im_5;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in CANNY_EDGE.
function CANNY_EDGE_Callback(hObject, eventdata, handles)

% Canny edge detection
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
[ image ] = Canny_Edge_Detection( im_2 );
axes2 = image;
image(axes2);
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Sharpen.
function Sharpen_Callback(hObject, eventdata, handles)

% Sharpening the image
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
im_3 = imsharpen(im_2, 'Radius', 1, 'Amount', 2, 'Threshold', 0);
axes2 = im_3;
axes(handles.axes2);
image(axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Lines.
function Lines_Callback(hObject, eventdata, handles)

% Hough operation deteting lines
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
Lines_Hough_Transform( im_2 );
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Circles.
function Circles_Callback(hObject, eventdata, handles)

% Hough Operation, Detecing Circles
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
Circles_Hough_Transform( im_2 )
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Contours.
function Contours_Callback(hObject, eventdata, handles)

% Computing Contours
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
Find_Contours( im_2 );
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Shape_Descriptor.
function Shape_Descriptor_Callback(hObject, eventdata, handles)

% Shape Descriptor
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
Shape_Descriptor( im_2 );
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Harris.
function Harris_Callback(hObject, eventdata, handles)

% Harris Corer Detection
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
Harris_Detection( im_2 );
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in FAST.
function FAST_Callback(hObject, eventdata, handles)

% FAST Feature extraction
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
FAST_Features( im_2 );
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in SURF.
function SURF_Callback(hObject, eventdata, handles)

% SURF Feature extraction
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
SURF_Features( im_2 );
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in SIFT.
function SIFT_Callback(hObject, eventdata, handles)

% SIFT Feature extraction
global Image;
if isempty(Image)
    msgbox('Please Upload a Image First.');
    return;
end
im_2 = Image;
[ry,rx]=SIFT(im_2);
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in Match_Image_1.
function Match_Image_1_Callback(hObject, eventdata, handles)

% Upload first Image to Match
im1 = uigetfile();
global FirstImage;
FirstImage = imread(im1);

% --- Executes on button press in Match_Image_2.
function Match_Image_2_Callback(hObject, eventdata, handles)

% Upload second Image to Match
im2 = uigetfile();
global SecondImage;
SecondImage = imread(im2);

% --- Executes on button press in Find_Match.
function Find_Match_Callback(hObject, eventdata, handles)

% Match both the images
global FirstImage;
global SecondImage;

if isempty(FirstImage) || isempty(SecondImage)
    msgbox('First or Second match image is empty.');
    return;
end
[ im_1, im_2, matchedImage1, matchedImage2 ] = Find_Match( FirstImage,SecondImage);
showMatchedFeatures(im_1, im_2, matchedImage1, matchedImage2, 'montage');
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})
figure;
showMatchedFeatures(im_1, im_2, matchedImage1, matchedImage2, 'montage');
title('Putatively matched points (including outliers)');

% --- Executes on button press in Calibrate.
function Calibrate_Callback(hObject, eventdata, handles)

% Camera calibration
try
    ocam_calib;
catch
    warning('Please be sure OCamCalib toolbox is installed and on the path');
end


% --- Executes on button press in Fundamental_Matrix.
function Fundamental_Matrix_Callback(hObject, eventdata, handles)

% Compute fundamental matrix by 8-point method
global FirstImage;
global SecondImage;

if isempty(FirstImage) || isempty(SecondImage)
    msgbox('First or Second match image is empty.');
    return;
end
[ im_1, im_2, matchedImage1, matchedImage2 ] = Find_Match( FirstImage,SecondImage);
showMatchedFeatures(im_1, im_2, matchedImage1, matchedImage2, 'montage');
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})
FundamentalMatrix = estimateFundamentalMatrix(matchedImage1, matchedImage2, ...
        'Method', 'Norm8Point')


% --- Executes on button press in Epipolar_lines.
function Epipolar_lines_Callback(hObject, eventdata, handles)

% Detect Epipolar Lines in both images
global FirstImage;
global SecondImage;

if isempty(FirstImage) || isempty(SecondImage)
    msgbox('First or Second match image is empty.');
    return;
end
image1 = (FirstImage);
image2 = (SecondImage);
[ ~, ~, matchedImage1, matchedImage2 ] = Find_Match( image1,image2);
[fLMedS, inliers] = estimateFundamentalMatrix(matchedImage1, matchedImage2); %, 'NumTrials', 4000);
Epipole_Lines_Img1( matchedImage2,image1,fLMedS, inliers )
axes(handles.axes1);
set(handles.axes1,'XTickLabel',{})
set(handles.axes1,'YTickLabel',{})

Epipole_Lines_Img2( matchedImage1,image2,fLMedS, inliers )
axes(handles.axes2);
set(handles.axes2,'XTickLabel',{})
set(handles.axes2,'YTickLabel',{})


% --- Executes on button press in HOMO_1stImage.
function HOMO_1stImage_Callback(hObject, eventdata, handles)

% Upload First Image
im1 = uigetfile();
global Homo_FirstImage;
Homo_FirstImage = imread(im1);


% --- Executes on button press in HOMO_2ndImage.
function HOMO_2ndImage_Callback(hObject, eventdata, handles)

% Upload Second Image
im2 = uigetfile();
global Homo_SecondImage;
Homo_SecondImage = imread(im2);


% --- Executes on button press in Compute_Homography.
function Compute_Homography_Callback(hObject, eventdata, handles)

% Compute Homography
global Homo_FirstImage;
global Homo_SecondImage;
global tx;
global oa;
global o;
global I;

if isempty(Homo_FirstImage) || isempty(Homo_SecondImage)
    msgbox('First or Second match image is empty.');
    return;
end
image1 = rgb2gray(Homo_FirstImage);
image2 = rgb2gray(Homo_SecondImage);
image1O = image1;
image2O = image2;
pointsImage1  = detectSURFFeatures(image1);
pointsImage2 = detectSURFFeatures(image2);
[featuresImage1,   validPointsImage1]  = extractFeatures(image1,  pointsImage1);
[featuresImage2, validPointsImage2]  = extractFeatures(image2, pointsImage2);
indexPairs = matchFeatures(featuresImage1, featuresImage2);
matchedImage1  = validPointsImage1(indexPairs(:, 1));
matchedImage2 = validPointsImage2(indexPairs(:, 2));
o = image1O;
oa = image2O;
I = image1;

tx = estimateGeometricTransform(matchedImage1, matchedImage2, 'projective');


% --- Executes on button press in join.
function join_Callback(hObject, eventdata, handles)

% Mosian both images
global Homo_FirstImage;
global Homo_SecondImage;
global tx;
global oa;
global o;
global I;

if isempty(Homo_FirstImage) || isempty(Homo_SecondImage)
    msgbox('First or Second match image is empty.');
    return;
end

tao = [oa zeros(size(oa))];
aoo =  imref2d(size(tao)); 
ooo = imwarp(o, tx, 'OutputView', aoo);

mask = imwarp(ones(size(I)), tx , 'OutputView', aoo) >= 1;
blend = vision.AlphaBlender('Operation', 'Binary mask', 'MaskSource', 'Input port');
mosaic = step(blend, tao, ooo, mask);
figure, imshow(mosaic);


% --- Executes on button press in Stitch_Image1.
function Stitch_Image1_Callback(hObject, eventdata, handles)

% Stiching
% Load images.
buildingDir = fullfile(toolboxdir('vision'), 'visiondata', 'building');
buildingScene = imageDatastore(buildingDir);

% Display images to be stitched
montage(buildingScene.Files)



% --- Executes on button press in Stitch.
function Stitch_Callback(hObject, eventdata, handles)
% Stitch both the images
Stitching( );
