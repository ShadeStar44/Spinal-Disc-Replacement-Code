A=linspace(1,21,21);
B=linspace(1,21,21);
%original coords
aa1=-7.90293+[0.858144 1.76178 2.94601 3.4147 4.46225 5.13055 5.93201 6.83544 7.35476 7.9807 8.47546 8.90099 9.27563 9.6461 9.94538 10.2427 10.4976 10.8125 11.0804 11.3001 11.5486 ];
%aa2=441.954+[];
aa3=-690.645+[-0.628321 -0.424771 -0.205808 -0.130099 0.013085 0.0841835 0.152347 0.204071 0.221945 0.23697 0.250637 0.268585 0.28406 0.302502 0.314961 0.326823 0.335357 0.343164 0.349 0.352223 0.353469 ];
% legt hand side node: 14718
% original coords.
ab1=9.41286+[0.808256 1.62212 2.661 3.06425 3.95111 4.50573 5.15684 5.87596 6.28303 6.76483 7.13612 7.44376 7.70857 7.97116 8.18198 8.38772 8.56162 8.77423 8.95248 9.09707 9.25976 ];
%ab2=441.501+[];
ab3=-692.656+[-1.06717 -1.39454 -1.81831 -1.98864 -2.3859 -2.65786 -3.0077 -3.42647 -3.68027 -3.99908 -4.25864 -4.48944 -4.69757 -4.89361 -5.05243 -5.2135 -5.35461 -5.53157 -5.68404 -5.81079 -5.95556 ];
E=[aa1',aa3'];
F=[ab1',ab3'];
function [fcr,theta,scale]=calcFCRTheta(E,F)


% [frc,theta,scale] = calcFCRTheta(E,F)
 % calculate the finite centre of rotation, the angle of rotation, and the
 % scale factor
% Input: E, F - lists of 2D corresponding points. these are n by 2 matrices
%             where n is the number of points and and the x val is in
%             column 1 y val in column 2.
% Output: fcr - the finite centre of rotation
%       theta - the angle of rotation between the two sets of points about
%       the fcr.
%       scale - the scale factor between the two pointsets
% first do some error checking

% right hand side node: 8826


[E, E] = size(E);
[F, F] = size(F);
if (E ~= 2) | (F ~= 2)
    error('E, F should be an nx2 matrix')
end
if (E ~= F)
    error('matrices E and F are of different size')
end

% complexify the data
A = E(:,1) + E(:,2)*i;
B = F(:,1) + F(:,2)*i;

% calculate the mean of each of the pointsets
meanA = sum(A)/E;
meanB = sum(B)/F;
% now translate both pointsets to the origin 
A2 = A - meanA;
B2 = B - meanB;
% now find the least squares solution to the rotation between A and B 
x = pinv(B2)*A2; 
theta = angle(x); 
scale = abs(x)
% the optimal rotation matrix
R = [cos(theta), -sin(theta); sin(theta), cos(theta)]; 
% the optimal translation vector 
v = [real(meanA) imag(meanA)] - [real(meanB) imag(meanB)]*R'; 
% calculate the fcr 
fcr(1,1) = (v(1,1)-v(1,2)*cot(theta/2))/2; 
fcr(2,1) = (v(1,2)+v(1,1)*cot(theta/2))/2;
end












