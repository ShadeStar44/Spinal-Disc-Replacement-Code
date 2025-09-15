% This script modifies the Abaqus txt files for spatial displacements
% related to foramen narrowing and widening for 5n Models at C3/C4. 

% LEFT 5n : 1297, 16439, 17116, 14886
clear,clc
% 1297 Modify SlideSlide_Teth and save 
FID=fopen('SlideSlide_Teth_1297_5n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A = datacell{1};
SlideSlide_Teth_1297_5n = [A(:,2)'; A(:,3)'; A(:,4)']; % Good 
save('SlideSlide_Teth_1297_5n_mat', 'SlideSlide_Teth_1297_5n', '-ascii');% Good 

% 16439 Modify SlideSlide_Teth and save 
FID=fopen('SlideSlide_Teth_16439_5n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A1 = datacell{1};
SlideSlide_Teth_16439_5n = [A1(:,2)'; A1(:,3)'; A1(:,4)']; 
save('SlideSlide_Teth_16439_5n_mat', 'SlideSlide_Teth_16439_5n', '-ascii'); 

% 17116 Modify SlideSlide_Teth and save 
FID=fopen('SlideSlide_Teth_17116_5n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A2 = datacell{1};
SlideSlide_Teth_17116_5n = [A2(:,2)'; A2(:,3)'; A2(:,4)']; 
save('SlideSlide_Teth_17116_5n_mat', 'SlideSlide_Teth_17116_5n', '-ascii'); 

% 14886 Modify SlideSlide_Teth and save
FID=fopen('SlideSlide_Teth_14886_5n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A3 = datacell{1};
SlideSlide_Teth_14886_5n = [A3(:,2)'; A3(:,3)'; A3(:,4)']; 
save('SlideSlide_Teth_14886_5n_mat', 'SlideSlide_Teth_14886_5n', '-ascii');

% RIGHT 5n: 4457, 20101, 9037, 21922

% 4457 Modify SlideSlide_Teth and save
FID=fopen('SlideSlide_Teth_4457_5n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A4 = datacell{1};
SlideSlide_Teth_4457_5n = [A4(:,2)'; A4(:,3)'; A4(:,4)']; 
save('SlideSlide_Teth_4457_5n_mat', 'SlideSlide_Teth_4457_5n', '-ascii');

% 20101 Modify SlideSlide_Teth and save 
FID=fopen('SlideSlide_Teth_20101_5n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A5 = datacell{1};
SlideSlide_Teth_20101_5n = [A5(:,2)'; A5(:,3)'; A5(:,4)']; 
save('SlideSlide_Teth_20101_5n_mat', 'SlideSlide_Teth_20101_5n', '-ascii');

% 9037 Modify SlideSlide_Teth and save
FID=fopen('SlideSlide_Teth_9037_5n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A6 = datacell{1};
SlideSlide_Teth_9037_5n = [A6(:,2)'; A6(:,3)'; A6(:,4)']; 
save('SlideSlide_Teth_9037_5n_mat', 'SlideSlide_Teth_9037_5n', '-ascii');

% 21922 Modify SlideSlide_Teth and save 
FID=fopen('SlideSlide_Teth_21922_5n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A7 = datacell{1};
SlideSlide_Teth_21922_5n = [A7(:,2)'; A7(:,3)'; A7(:,4)']; 
save('SlideSlide_Teth_21922_5n_mat', 'SlideSlide_Teth_21922_5n', '-ascii');