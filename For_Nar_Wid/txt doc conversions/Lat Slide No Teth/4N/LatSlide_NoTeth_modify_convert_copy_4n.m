% This script modifies the Abaqus txt files for spatial displacements
% related to foramen narrowing and widening for 4N Models at C3/C4. 

% LEFT 4N : 1297, 16439, 17116, 14886
clear,clc
% 1297 Modify LatSlide_NoTeth and save 
FID=fopen('LatSlide_NoTeth_1297_4n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A = datacell{1};
LatSlide_NoTeth_1297_4n = [A(:,2)'; A(:,3)'; A(:,4)']; % Good 
save('LatSlide_NoTeth_1297_4n_mat', 'LatSlide_NoTeth_1297_4n', '-ascii');% Good 

% 16439 Modify LatSlide_NoTeth and save 
FID=fopen('LatSlide_NoTeth_16439_4n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A1 = datacell{1};
LatSlide_NoTeth_16439_4n = [A1(:,2)'; A1(:,3)'; A1(:,4)']; 
save('LatSlide_NoTeth_16439_4n_mat', 'LatSlide_NoTeth_16439_4n', '-ascii'); 

% 17116 Modify LatSlide_NoTeth and save 
FID=fopen('LatSlide_NoTeth_17116_4n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A2 = datacell{1};
LatSlide_NoTeth_17116_4n = [A2(:,2)'; A2(:,3)'; A2(:,4)']; 
save('LatSlide_NoTeth_17116_4n_mat', 'LatSlide_NoTeth_17116_4n', '-ascii'); 

% 14886 Modify LatSlide_NoTeth and save
FID=fopen('LatSlide_NoTeth_14886_4n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A3 = datacell{1};
LatSlide_NoTeth_14886_4n = [A3(:,2)'; A3(:,3)'; A3(:,4)']; 
save('LatSlide_NoTeth_14886_4n_mat', 'LatSlide_NoTeth_14886_4n', '-ascii');

% RIGHT 4N: 4457, 20101, 9037, 21922

% 4457 Modify LatSlide_NoTeth and save
FID=fopen('LatSlide_NoTeth_4457_4n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A4 = datacell{1};
LatSlide_NoTeth_4457_4n = [A4(:,2)'; A4(:,3)'; A4(:,4)']; 
save('LatSlide_NoTeth_4457_4n_mat', 'LatSlide_NoTeth_4457_4n', '-ascii');

% 20101 Modify LatSlide_NoTeth and save 
FID=fopen('LatSlide_NoTeth_20101_4n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A5 = datacell{1};
LatSlide_NoTeth_20101_4n = [A5(:,2)'; A5(:,3)'; A5(:,4)']; 
save('LatSlide_NoTeth_20101_4n_mat', 'LatSlide_NoTeth_20101_4n', '-ascii');

% 9037 Modify LatSlide_NoTeth and save
FID=fopen('LatSlide_NoTeth_9037_4n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A6 = datacell{1};
LatSlide_NoTeth_9037_4n = [A6(:,2)'; A6(:,3)'; A6(:,4)']; 
save('LatSlide_NoTeth_9037_4n_mat', 'LatSlide_NoTeth_9037_4n', '-ascii');

% 21922 Modify LatSlide_NoTeth and save 
FID=fopen('LatSlide_NoTeth_21922_4n.txt');
datacell = textscan(FID, '%f%f%f%f', 'HeaderLines', 3, 'CollectOutput', 1);
fclose(FID);
A7 = datacell{1};
LatSlide_NoTeth_21922_4n = [A7(:,2)'; A7(:,3)'; A7(:,4)']; 
save('LatSlide_NoTeth_21922_4n_mat', 'LatSlide_NoTeth_21922_4n', '-ascii');