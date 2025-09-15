% This script modifies the Abaqus txt files for spatial displacements
% related to foramen narrowing and widening for 6p Models at C3/C4. 

% LEFT 6p : 1297, 16439, 17116, 14886
clear,clc
% 1297 Modify APSlide_NoTeth and save 
FID=fopen('APSlide_NoTeth_1297_6p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A = datacell{1};
APSlide_NoTeth_1297_6p = [A(:,2)'; A(:,3)'; A(:,4)']; % Good 
save('APSlide_NoTeth_1297_6p_mat', 'APSlide_NoTeth_1297_6p', '-ascii');% Good 

% 16439 Modify APSlide_NoTeth and save 
FID=fopen('APSlide_NoTeth_16439_6p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A1 = datacell{1};
APSlide_NoTeth_16439_6p = [A1(:,2)'; A1(:,3)'; A1(:,4)']; 
save('APSlide_NoTeth_16439_6p_mat', 'APSlide_NoTeth_16439_6p', '-ascii'); 

% 17116 Modify APSlide_NoTeth and save 
FID=fopen('APSlide_NoTeth_17116_6p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A2 = datacell{1};
APSlide_NoTeth_17116_6p = [A2(:,2)'; A2(:,3)'; A2(:,4)']; 
save('APSlide_NoTeth_17116_6p_mat', 'APSlide_NoTeth_17116_6p', '-ascii'); 

% 14886 Modify APSlide_NoTeth and save
FID=fopen('APSlide_NoTeth_14886_6p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A3 = datacell{1};
APSlide_NoTeth_14886_6p = [A3(:,2)'; A3(:,3)'; A3(:,4)']; 
save('APSlide_NoTeth_14886_6p_mat', 'APSlide_NoTeth_14886_6p', '-ascii');

% RIGHT 6p: 4457, 20101, 9037, 21922

% 4457 Modify APSlide_NoTeth and save
FID=fopen('APSlide_NoTeth_4457_6p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A4 = datacell{1};
APSlide_NoTeth_4457_6p = [A4(:,2)'; A4(:,3)'; A4(:,4)']; 
save('APSlide_NoTeth_4457_6p_mat', 'APSlide_NoTeth_4457_6p', '-ascii');

% 20101 Modify APSlide_NoTeth and save 
FID=fopen('APSlide_NoTeth_20101_6p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A5 = datacell{1};
APSlide_NoTeth_20101_6p = [A5(:,2)'; A5(:,3)'; A5(:,4)']; 
save('APSlide_NoTeth_20101_6p_mat', 'APSlide_NoTeth_20101_6p', '-ascii');

% 9037 Modify APSlide_NoTeth and save
FID=fopen('APSlide_NoTeth_9037_6p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A6 = datacell{1};
APSlide_NoTeth_9037_6p = [A6(:,2)'; A6(:,3)'; A6(:,4)']; 
save('APSlide_NoTeth_9037_6p_mat', 'APSlide_NoTeth_9037_6p', '-ascii');

% 21922 Modify APSlide_NoTeth and save 
FID=fopen('APSlide_NoTeth_21922_6p.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A7 = datacell{1};
APSlide_NoTeth_21922_6p = [A7(:,2)'; A7(:,3)'; A7(:,4)']; 
save('APSlide_NoTeth_21922_6p_mat', 'APSlide_NoTeth_21922_6p', '-ascii');