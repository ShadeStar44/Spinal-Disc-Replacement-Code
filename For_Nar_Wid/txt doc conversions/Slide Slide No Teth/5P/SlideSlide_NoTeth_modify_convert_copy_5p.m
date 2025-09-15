% This script modifies the Abaqus txt files for spatial displacements
% related to foramen narrowing and widening for 5p Models at C3/C4. 

% LEFT 5p : 1297, 16439, 17116, 14886
clear,clc
% 1297 Modify SlideSlide_NoTeth and save 
FID=fopen('SlideSlide_NoTeth_1297_5p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A = datacell{1};
SlideSlide_NoTeth_1297_5p = [A(:,2)'; A(:,3)'; A(:,4)']; % Good 
save('SlideSlide_NoTeth_1297_5p_mat', 'SlideSlide_NoTeth_1297_5p', '-ascii');% Good 

% 16439 Modify SlideSlide_NoTeth and save 
FID=fopen('SlideSlide_NoTeth_16439_5p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A1 = datacell{1};
SlideSlide_NoTeth_16439_5p = [A1(:,2)'; A1(:,3)'; A1(:,4)']; 
save('SlideSlide_NoTeth_16439_5p_mat', 'SlideSlide_NoTeth_16439_5p', '-ascii'); 

% 17116 Modify SlideSlide_NoTeth and save 
FID=fopen('SlideSlide_NoTeth_17116_5p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A2 = datacell{1};
SlideSlide_NoTeth_17116_5p = [A2(:,2)'; A2(:,3)'; A2(:,4)']; 
save('SlideSlide_NoTeth_17116_5p_mat', 'SlideSlide_NoTeth_17116_5p', '-ascii'); 

% 14886 Modify SlideSlide_NoTeth and save
FID=fopen('SlideSlide_NoTeth_14886_5p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A3 = datacell{1};
SlideSlide_NoTeth_14886_5p = [A3(:,2)'; A3(:,3)'; A3(:,4)']; 
save('SlideSlide_NoTeth_14886_5p_mat', 'SlideSlide_NoTeth_14886_5p', '-ascii');

% RIGHT 5p: 4457, 20101, 9037, 21922

% 4457 Modify SlideSlide_NoTeth and save
FID=fopen('SlideSlide_NoTeth_4457_5p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A4 = datacell{1};
SlideSlide_NoTeth_4457_5p = [A4(:,2)'; A4(:,3)'; A4(:,4)']; 
save('SlideSlide_NoTeth_4457_5p_mat', 'SlideSlide_NoTeth_4457_5p', '-ascii');

% 20101 Modify SlideSlide_NoTeth and save 
FID=fopen('SlideSlide_NoTeth_20101_5p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A5 = datacell{1};
SlideSlide_NoTeth_20101_5p = [A5(:,2)'; A5(:,3)'; A5(:,4)']; 
save('SlideSlide_NoTeth_20101_5p_mat', 'SlideSlide_NoTeth_20101_5p', '-ascii');

% 9037 Modify SlideSlide_NoTeth and save
FID=fopen('SlideSlide_NoTeth_9037_5p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A6 = datacell{1};
SlideSlide_NoTeth_9037_5p = [A6(:,2)'; A6(:,3)'; A6(:,4)']; 
save('SlideSlide_NoTeth_9037_5p_mat', 'SlideSlide_NoTeth_9037_5p', '-ascii');

% 21922 Modify SlideSlide_NoTeth and save 
FID=fopen('SlideSlide_NoTeth_21922_5p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A7 = datacell{1};
SlideSlide_NoTeth_21922_5p = [A7(:,2)'; A7(:,3)'; A7(:,4)']; 
save('SlideSlide_NoTeth_21922_5p_mat', 'SlideSlide_NoTeth_21922_5p', '-ascii');