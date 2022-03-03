A = double(imread('_MG_7735.JPG'))/255;
B = double(imread('_MG_7737.JPG'))/255;
Bd = imtranslate(B,[20, -20]);
Am = (A+Bd)/2;

% histogram(rgb2gray(Am))

Ac0 = imadjust(Am, [0 0 0; 0.3 0.3 0.3]);
imwrite(Ac, 'Ac0.png');

g_Am = gpuArray(Am);
g_Ac = arrayfun(@(x) (3*x).^2, g_Am);
Ac1 = gather(g_Ac);
imwrite(Ac1, 'Ac1.png');

[H,S,L] = convertToHSL(Am);
L2 = log(L);

%histogram(L2,'Normalization','probability','EdgeColor','none');
%xlabel('Adjusted lightness (a.u.)')
%ylabel('Normalized pixel count')

blacklevel = -3;
L2 = rescale(L2,"InputMin",blacklevel);
saturation = 0.9;
S2 = saturation*S;
Ac2 = convertFromHSL(H,S2,L2);
imwrite(Ac2, 'Ac2.png');

Ac3 = imlocalbrighten(Ac3, 0.2);
imwrite(Ac3, 'Ac3.png');

%montage({Am, Ac0, Ac1, Ac2, Ac4})
montage({Am,Ac3,Ac4})