function [fcr, theta, scale] = calcFCRTheta(E, F)
% [fcr, theta, scale] = calcFCRTheta(E, F)
% calculate the finite centre of rotation, the angle of rotation
% and the scale factor
% Input: E, F - lists of 2D corresponding points. These are n by 2 matrices
%        where n is the number of points and the x val is in column 
%        y val in column 2
% Output: fcr - the finite centre of rotation
%         theta - the angle of rotation between the two sets of points
%         about the fcr
%         scale - the scale factor between the two pointsets

%First check error
[rE,cE] = size(E);
[rF,cF] = size(F);
if (cE~=2) | (cF~=2)
    error('E,F should be an nx2 matriz')
end
if (rE~=rF)
    error('matrices E and F are of different size')
end

% complexify data
A = E(:,1)+E(:,2)*1i;
B = F(:,1)+F(:,2)*1i;
% calculate the mean of each of the pointsets
meanA = sum(A)/rE; 
meanB = sum(B)/rF;
% now translate both pointsets to the origin
A2= A - meanA; 
B2= B - meanB;
% now find the least squares solution to the rotation between A and B
x = pinv(B2)*A2;
theta = angle(x);
scale = abs(x);

% the optimal rotation matrix
R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
% the optimal translation vector
v = [real(meanA) imag(meanA)] - [real(meanB) imag(meanB)]*R';
% calculate the fcr
fcr(1,1) = (v(1,1)-v(1,2)*cot(theta/2))/2;
fcr(2,1) = (v(1,2)+v(1,1)*cot(theta/2))/2;




