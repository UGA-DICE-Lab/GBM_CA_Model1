function [XDEN,cfsDEN,dimCFS] = func_denoise_dw2d(X)
% FUNC_DENOISE_DW2D Saved Denoising Process.
%   X: matrix of data
%   -----------------
%   XDEN: matrix of denoised data
%   cfsDEN: decomposition vector (see WAVEDEC2)
%   dimCFS: corresponding bookkeeping matrix

%  Auto-generated by Wavelet Toolbox on 28-Aug-2018 13:00:13

% Analysis parameters.
%---------------------
wname = 'db5';
level = 4;

% Denoising parameters.
%-----------------------
% meth = 'sqtwolog';
% scal_OR_alfa = one;
sorh = 's';    % Specified soft or hard thresholding
thrSettings =  [...
    4.419412595622351      4.122375646177510      3.828086543499061      3.565419375247712 ; ...
    4.419412595622351      4.122375646177510      3.828086543499061      3.565419375247712 ; ...
    4.419412595622351      4.122375646177510      3.828086543499061      3.565419375247712   ...
    ];
roundFLAG = true;

% Denoise using WDENCMP.
%----------------------
[coefs,sizes] = wavedec2(X,level,wname);
[XDEN,cfsDEN,dimCFS] = wdencmp('lvd',coefs,sizes, ...
    wname,level,thrSettings,sorh);
if roundFLAG , XDEN = round(XDEN); end
if isequal(class(X),'uint8') , XDEN = uint8(XDEN); end
