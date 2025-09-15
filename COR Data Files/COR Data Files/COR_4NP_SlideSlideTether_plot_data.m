% Sophie Turner
% Nick Gallizioli
% Dr. Erich McAllister 

%% Plot Data Slide Slide Tether (Model 1) 

axis=zeros(3,21); 
Dperp_vec=zeros(3,21);
Data = xlsread('COR_4NP_SlideSlide_Tether');

% pulling the previous dperp and afound data from the file. 
Dperp_6=xlsread('dperp_1','Sheet1');
afound6=xlsread('dperp_1', 'Sheet2');
Dperp_5=xlsread('dperp_1','Sheet3');
afound5=xlsread('dperp_1', 'Sheet4');
Dperp_4=xlsread('dperp_1','Sheet5');
afound4=xlsread('dperp_1', 'Sheet6');

% C4 vertebrae  
C4=Data(1:42,:);

% C5 vertebrae   
C5=Data(48:89,:);

% C6 vertebrae   
C6=Data(95:136,:);



%% C5 COR 
col =1; 
%The matrix X has the initial position vectors of your markers as columns.
%Y is the matrix of corresponding terminal positions. IRL these would be
%measured, not determined by Y = A*X+D.
s=0;

for i=1:42
    if (i==1)
        X5 = [C5(1,[3:5]); C5(1,[9:11]); C5(1,[15:17]); C5(1,[21:23]) ]';
        Y5 = [C5(1,[6:8]); C5(1,[12:14]); C5(1,[18:20]); C5(1,[24:26]) ]';
    else 
% time 0 C5 previous deformed data - C7 fixed position 3x4 maxtrix 
    X5 = [C5(i-1,[3:5])-C5(i,[27:29]); C5(i-1,[9:11])-C5(i,[27:29]); C5(i-1,[15:17])-C5(i,[27:29]); C5(i-1,[21:23])-C5(i,[27:29]); ]';

% time 0 C5 current deformed data - C7 fixed position 3x4 maxtrix 
    Y5 = [C5(i-1,[6:8])-C5(i,[27:29]); C5(i-1,[12:14])-C5(i,[27:29]); C5(i-1,[18:20])-C5(i,[27:29]); C5(i-1,[24:26])-C5(i,[27:29]); ]';
%Y=A*X + D
end 


%Xbar and Ybar are matrices that have repeats of the centroids of the cols
%of X and Y as their columns. I made them matrices for later convenience.
Xbar = X5*ones(4)/4;
Ybar = Y5*ones(4)/4;

%Xnew and Ynew are the matrices of "prime" vectors in
%http://www.kwon3d.com/theory/jkinem/rotmat.html. We use those to solve for
%A.
Xnew = X5-Xbar;
Ynew = Y5-Ybar;

% B = (pinv(Xnew')*Ynew')'
%B was my attempt at reconstructing A with either a pseudoinverse or left
%divide. It only works if the rows of Xnew are linearly indepepndent.
%Otherwise there is not a unique solution for A and those algorithms don't
%find the one we want (with A orthogonal and orientation preserving).

C = (Ynew*Xnew')/4;
[U,S,V] = svd(C);
Afound = U*V';
det(Afound);
%If det(Afound = -1) let P = [[1,0,0];[0,1,0];[0,0,-1]] and replace Afound
%with U*P*V'.

% subtracting the current (C5) afound from C6 afound 

new_Afound5 = afound6([1:3],[col:col+2])-Afound;
col = col + 3;
%Now we've got A, so we need to recover the shift D. Since we know Y =
%A*X+D, just take D = Y-A*X (we know A now). You should get a matrix with
%the same column N times.

Dfound = Y5 - new_Afound5*X5;
Dfound2= Dfound*ones(4)/4;  % centroid of the four points 

%Now to find the axis of rotation.
%The direction of the axis is easy. It will be in the direction of the eigenvector of A with eigenvalue =1.

[P,L] = eig(new_Afound5);

%Now we have to find a point on the axis. Following 
%https://en.wikipedia.org/wiki/Screw_axis, we get

Dperp = Dfound2(:,1)-P(:,3)'*Dfound2(:,1)*P(:,3)
% subtracting the current (C5) Dperpendicular from the previous C6 Dperp. 
new_Dperp=Dperp_6(:,i)-Dperp; 


% saving the Axis points 
Dperp_vec([1:3],i)=Dperp;

%To find the point C on the helical axis, we can use pinv, this is the
%solution to (I-A)C = dperp in the orthogonal complement to the null space
%of I-A. That null space is precisely the span of the eigenvector of A with eigenvalue =1. 

Axis_point = pinv(eye(3)-new_Afound5)*new_Dperp;  % coordinates of a point relative to the origin 
%fprintf("Axis point for row %i = %3f, %3f, %3f \n", i, Axis_point)
%Now C+t*P(:,1) will be a parametrization of the screw axis.

% saving the Axis points 
axis([1:3],i)=Axis_point;


fprintf("Row %i: x=%f y=%f z=%f\n",i, Axis_point)

%To find the angle of rotation, find the angle between A*Dperp and Dperp
%using your favorite method.
theta(i) = acos(((new_Afound5*new_Dperp)'*new_Dperp)/(new_Dperp'*new_Dperp));

% if(i<=21) %% Negating the 4N
%     theta(i)=-theta(i);
% end 

%fprintf("theta for row %i = %3f\n", i, theta(i)); % setting the first summation to 0+theta
if(i==1)
    s(1)=theta(1);
else 
    s(i)=s(i-1)+theta(i); 
    %fprintf("sum theta for row %i = %3f\n", i, s(i));
end 

end

figure(3)
plot(axis(2,1:21),axis(3,1:21),'r.-','markersize',10)
xlabel('Y')
ylabel('Z')
xlim([-20 20])
ylim([-45 -35])
title('Theta Slide Slide Tether (Model 1)')
legend('C5 4N axis points','location','northwest')
hold off

figure(4)
plot(axis(2,21:42),axis(3,21:42),'m.-','markersize',10)
title('COR Slide Slide Tether (Model 1)')
xlabel('Y')
ylabel('Z')
xlim([-6 15])
ylim([-43 -37])
legend('C5 4P axis points','location','northwest')
hold off

%% C4 COR 
col =1; 
%The matrix X has the initial position vectors of your markers as columns.
%Y is the matrix of corresponding terminal positions. IRL these would be
%measured, not determined by Y = A*X+D.
s=0;

for j=1:42
    if (j==1)
        X4 = [C4(1,[3:5]); C4(1,[9:11]); C4(1,[15:17]); C4(1,[21:23]) ]';
        Y4 = [C4(1,[6:8]); C4(1,[12:14]); C4(1,[18:20]); C4(1,[24:26]) ]';
    else 
% time 0 C4 previous deformed data - C7 fixed position 3x4 maxtrix 
    X4 = [C4(j-1,[3:5])-C4(j,[27:29]); C4(j-1,[9:11])-C4(j,[27:29]); C4(j-1,[15:17])-C4(j,[27:29]); C4(j-1,[21:23])-C4(j,[27:29]); ]';

% time 0 C4 current deformed data - C7 fixed position 3x4 maxtrix 
    Y4 = [C4(j-1,[6:8])-C4(j,[27:29]); C4(j-1,[12:14])-C4(j,[27:29]); C4(j-1,[18:20])-C4(j,[27:29]); C4(j-1,[24:26])-C4(j,[27:29]); ]';
%Y=A*X + D
end 


%Xbar and Ybar are matrices that have repeats of the centroids of the cols
%of X and Y as their columns. I made them matrices for later convenience.
Xbar = X4*ones(4)/4;
Ybar = Y4*ones(4)/4;

%Xnew and Ynew are the matrices of "prime" vectors in
%http://www.kwon3d.com/theory/jkinem/rotmat.html. We use those to solve for
%A.
Xnew = X4-Xbar;
Ynew = Y4-Ybar;

% B = (pinv(Xnew')*Ynew')'
%B was my attempt at reconstructing A with either a pseudoinverse or left
%divide. It only works if the rows of Xnew are linearly indepepndent.
%Otherwise there is not a unique solution for A and those algorithms don't
%find the one we want (with A orthogonal and orientation preserving).

C = (Ynew*Xnew')/4;
[U,S,V] = svd(C);
Afound = U*V';
det(Afound);
%If det(Afound = -1) let P = [[1,0,0];[0,1,0];[0,0,-1]] and replace Afound
%with U*P*V'.

% subtracting the current (C4) afound from C4 afound 

new_Afound4 = afound5([1:3],[col:col+2])-Afound;
col = col + 3;
%Now we've got A, so we need to recover the shift D. Since we know Y =
%A*X+D, just take D = Y-A*X (we know A now). You should get a matrix with
%the same column N times.

Dfound = Y4 - new_Afound4*X4;
Dfound2= Dfound*ones(4)/4;  % centroid of the four points 

%Now to find the axis of rotation.
%The direction of the axis is easy. It will be in the direction of the eigenvector of A with eigenvalue =1.

[P,L] = eig(new_Afound4);

%Now we have to find a point on the axis. Following 
%https://en.wikipedia.org/wiki/Screw_axis, we get

Dperp = Dfound2(:,1)-P(:,3)'*Dfound2(:,1)*P(:,3)
% subtracting the current (C4) Dperpendicular from the previous C6 Dperp. 
new_Dperp=Dperp_6(:,j)-Dperp; 


% saving the Axis points 
Dperp_vec([1:3],j)=Dperp;

%To find the point C on the helical axis, we can use pinv, this is the
%solution to (I-A)C = dperp in the orthogonal complement to the null space
%of I-A. That null space is precisely the span of the eigenvector of A with eigenvalue =1. 

Axis_point = pinv(eye(3)-new_Afound4)*new_Dperp;  % coordinates of a point relative to the origin 
%fprintf("Axis point for row %i = %3f, %3f, %3f \n", i, Axis_point)
%Now C+t*P(:,1) will be a parametrization of the screw axis.

% saving the Axis points 
axis([1:3],j)=Axis_point;


fprintf("Row %i: x=%f y=%f z=%f\n",j, Axis_point)

%To find the angle of rotation, find the angle between A*Dperp and Dperp
%using your favorite method.
theta(j) = acos(((new_Afound4*new_Dperp)'*new_Dperp)/(new_Dperp'*new_Dperp));

% if(i<=21) %% Negating the 4N
%     theta(i)=-theta(i);
% end 

%fprintf("theta for row %i = %3f\n", i, theta(i)); % setting the first summation to 0+theta
if(j==1)
    s(1)=theta(1);
else 
    s(j)=s(j-1)+theta(j); 
    %fprintf("sum theta for row %i = %3f\n", i, s(i));
end 

end

figure(5)
plot(axis(2,1:21),axis(3,1:21),'r.-','markersize',10)
xlabel('Y')
ylabel('Z')
xlim([-30 25])
ylim([-80 40])
title('Theta Slide Slide Tether (Model 1)')
legend('C4 4N axis points','location','northwest')
hold off

figure(6)
plot(axis(2,21:42),axis(3,21:42),'m.-','markersize',10)
title('COR Slide Slide Tether (Model 1)')
xlabel('Y')
ylabel('Z')
xlim([-20 23])
ylim([-70 -52])
legend('C4 4P axis points','location','northwest')
hold off