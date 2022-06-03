I = imread("20220420_124034.jpg");
BW = rgb2gray(I);

imhist(BW);
BIN = BW > 90;

%BIN = imbinarize(BW);

imshow(BIN);

% Trobar els contorns

%2236 1728
%2234 1755
%2305 1725
%2307 1755
%70x30

movingPoints=[440 194; 3746 88; 3806 2517; 510 2486];
fixedPoints=[1 1; 4608 1; 4608 2592; 1 2592];

TFORM = fitgeotrans(movingPoints,fixedPoints,'projective');

R=imref2d(size(BW),[1 size(BW,2)],[1 size(BW,1)]);

imgTransformed=imwarp(BW,R,TFORM,'OutputView',R);

%[rows, cols] = find(BIN);
%rowmin = min(rows);
%rowmax = max(rows);
%colmin = min(cols);
%colmax = max(cols);
%colmax
%IR = I(rowmin:rowmax, colmin:colmax);

%imshow(IR);

% Binarització local
BIN_L = colfilt(imgTransformed, [3 2],"sliding",@bin_local_fun);
imshow(BIN_L);

%{labeledImage = bwconncomp(BIN_L);
			%measurements = regionprops(labeledImage,'BoundingBox');
%for k = 1 : length(measurements)
%thisBB = measurements(k).BoundingBox;
%rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
%'EdgeColor','r','LineWidth',2 )
%end%}




