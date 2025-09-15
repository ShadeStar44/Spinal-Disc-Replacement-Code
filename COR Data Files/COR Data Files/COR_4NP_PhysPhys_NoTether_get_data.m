% Sophie Turner
% Nick Gallizioli
% Dr. Erich McAllister 

%% Get Data Phys Phys No Tether (Model 8) 

%This is the test transformation, we're just going to make sure we can
%recover it.

% A = [[-1,0,0];[0,-1,0];[0,0,1]]
% D = [[0,0,A0,0];[2,2,2,2];[0,0,0,0]]
 
axis=zeros(3,21); 
Data = xlsread('COR_4NP_PhysPhys_NoTether'); %getting all data for the three directions

% The matrix X has the initial position vectors of your markers as columns.
%Y is the matrix of corresponding terminal positions. IRL these would be
%measured, not determined by Y = A*X+D.
s=0;
% C4 vertebrae  
C4=Data(1:42,:);

% C5 vertebrae   
C5=Data(48:89,:);

% C6 vertebrae   
C6=Data(95:136,:);

filename='dperp_8.xlsx';
clf

%% C6 Theata angles  
UR1_6 = C6(1:42,33); 
Dperp_vec6=zeros(3,42);
col = 1;
for i=1:42
    if (i==1)
        X6 = [C6(1,[3:5]); C6(1,[9:11]); C6(1,[15:17]); C6(1,[21:23]) ]';
        Y6 = [C6(1,[6:8]); C6(1,[12:14]); C6(1,[18:20]); C6(1,[24:26]) ]';
    else 
% time 0 C5 previous deformed data - C7 fixed position 3x4 maxtrix 
    X6 = [C6(i-1,[3:5])-C6(i,[27:29]); C6(i-1,[9:11])-C6(i,[27:29]); C6(i-1,[15:17])-C6(i,[27:29]); C6(i-1,[21:23])-C6(i,[27:29]); ]';

% time 0 C5 current deformed data - C7 fixed position 3x4 maxtrix 
    Y6 = [C6(i-1,[6:8])-C6(i,[27:29]); C6(i-1,[12:14])-C6(i,[27:29]); C6(i-1,[18:20])-C6(i,[27:29]); C6(i-1,[24:26])-C6(i,[27:29]); ]';
%Y=A*X + D
    end 

%Xbar and Ybar are matrices that have repeats of the centroids of the cols
%of X and Y as their columns. I made them matrices for later convenience.
Xbar6 = X6*ones(4)/4;
Ybar6 = Y6*ones(4)/4;

%Xnew and Ynew are the matrices of "prime" vectors in
%http://www.kwon3d.com/theory/jkinem/rotmat.html. We use those to solve for
%A.
Xnew6 = X6-Xbar6;
Ynew6 = Y6-Ybar6;

% B = (pinv(Xnew')*Ynew')'
%B was my attempt at reconstructing A with either a pseudoinverse or left
%divide. It only works if the rows of Xnew are linearly indepepndent.
%Otherwise there is not a unique solution for A and those algorithms don't
%find the one we want (with A orthogonal and orientation preserving).


C = (Ynew6*Xnew6')/4;
[U,S,V] = svd(C);
Afound6 = U*V';
det(Afound6);
%If det(Afound = -1) let P = [[1,0,0];[0,1,0];[0,0,-1]] and replace Afound
%with U*P*V'.

%saving afound into afound_vec 
Afound_vec6([1:3],[col:col+2])=Afound6
col = col + 3;
%Now we've got A, so we need to recover the shift D. Since we know Y =
%A*X+D, just take D = Y-A*X (we know A now). You should get a matrix with
%the same column N times.

Dfound = Y6 - Afound6*X6;
Dfound2= Dfound*ones(4)/4;  % centroid of the four points 

%Now to find the axis of rotation.
%The direction of the axis is easy. It will be in the direction of the eigenvector of A with eigenvalue =1.

[P,L] = eig(Afound6);

%Now we have to find a point on the axis. Following 
%https://en.wikipedia.org/wiki/Screw_axis, we get

Dperp = Dfound2(:,1)-P(:,3)'*Dfound2(:,1)*P(:,3)
% new_Dperp=Dperp_6(:,i)-Dperp; 

% saving the Axis points 
Dperp_vec6([1:3],i)=Dperp;

%To find the point C on the helical axis, we can use pinv, this is the
%solution to (I-A)C = dperp in the orthogonal complement to the null space
%of I-A. That null space is precisely the span of the eigenvector of A with eigenvalue =1. 

Axis_point = pinv(eye(3)-Afound6)*Dperp;  % coordinates of a point relative to the origin 
%fprintf("Axis point for row %i = %3f, %3f, %3f \n", i, Axis_point)
%Now C+t*P(:,1) will be a parametrization of the screw axis.

% saving the Axis points 
axis([1:3],i)=Axis_point;


fprintf("Row %i: x=%f y=%f z=%f\n",i, Axis_point)

%To find the angle of rotation, find the angle between A*Dperp and Dperp
%using your favorite method.
theta(i) = acos(((Afound6*Dperp)'*Dperp)/(Dperp'*Dperp));


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

writematrix(Dperp_vec6,filename)
writematrix(Afound_vec6, filename,'Sheet',2)

% Plotting C6 negative theta (matlab and abaqus) 
figure(1)
hold on 
plot(C6(1:42,2),s(:,1:42),'ko')
plot(C6(1:42,2),UR1_6(1:42,:),'b*')
xlabel('Moment')
ylabel('Theta')
title('Theta Phys Phys No Tether (Model 8)')
legend('Matlab C6 ','Abaqus C6','location', 'north')
hold off


%% C5 Theta angles 

UR1_5 = C5(1:42,33); 
Dperp_vec5=zeros(3,21);
col = 1;
for k=1:42
    if (k==1)
        X5 = [C5(1,[3:5]); C5(1,[9:11]); C5(1,[15:17]); C5(1,[21:23]) ]';
        Y5 = [C5(1,[6:8]); C5(1,[12:14]); C5(1,[18:20]); C5(1,[24:26]) ]';
    else 
% time 0 C5 previous deformed data - C7 fixed position 3x4 maxtrix 
    X5 = [C5(k-1,[3:5])-C5(k,[27:29]); C5(k-1,[9:11])-C5(k,[27:29]); C5(k-1,[15:17])-C5(k,[27:29]); C5(k-1,[21:23])-C5(k,[27:29]); ]';

% time 0 C5 current deformed data - C7 fixed position 3x4 maxtrix 
    Y5 = [C5(k-1,[6:8])-C5(k,[27:29]); C5(k-1,[12:14])-C5(k,[27:29]); C5(k-1,[18:20])-C5(k,[27:29]); C5(k-1,[24:26])-C5(k,[27:29]); ]';
%Y=A*X + D
end 
%Xbar and Ybar are matrices that have repeats of the centroids of the cols
%of X and Y as their columns. I made them matrices for later convenience.
Xbar5 = X5*ones(4)/4;
Ybar5 = Y5*ones(4)/4;

%Xnew and Ynew are the matrices of "prime" vectors in
%http://www.kwon3d.com/theory/jkinem/rotmat.html. We use those to solve for
%A.
Xnew5 = X5-Xbar5;
Ynew5 = Y5-Ybar5;

% B = (pinv(Xnew')*Ynew')'
%B was my attempt at reconstructing A with either a pseudoinverse or left
%divide. It only works if the rows of Xnew are linearly indepepndent.
%Otherwise there is not a unique solution for A and those algorithms don't
%find the one we want (with A orthogonal and orientation preserving).


C = (Ynew5*Xnew5')/4;
[U,S,V] = svd(C);
Afound5 = U*V';
det(Afound5);
%If det(Afound = -1) let P = [[1,0,0];[0,1,0];[0,0,-1]] and replace Afound
%with U*P*V'.

%saving afound into afound_vec 
Afound_vec5([1:3],[col:col+2])=Afound5
col = col + 3;
%Now we've got A, so we need to recover the shift D. Since we know Y =
%A*X+D, just take D = Y-A*X (we know A now). You should get a matrix with
%the same column N times.

Dfound = Y5 - Afound5*X5;
Dfound2= Dfound*ones(4)/4;  % centroid of the four points 

%Now to find the axis of rotation.
%The direction of the axis is easy. It will be in the direction of the eigenvector of A with eigenvalue =1.

[P,L] = eig(Afound5);

%Now we have to find a point on the axis. Following 
%https://en.wikipedia.org/wiki/Screw_axis, we get

Dperp = Dfound2(:,1)-P(:,3)'*Dfound2(:,1)*P(:,3)
% new_Dperp=Dperp_6(:,i)-Dperp; 

% saving the Axis points 
Dperp_vec5([1:3],k)=Dperp;

%To find the point C on the helical axis, we can use pinv, this is the
%solution to (I-A)C = dperp in the orthogonal complement to the null space
%of I-A. That null space is precisely the span of the eigenvector of A with eigenvalue =1. 

Axis_point = pinv(eye(3)-Afound5)*Dperp;  % coordinates of a point relative to the origin 
%fprintf("Axis point for row %i = %3f, %3f, %3f \n", i, Axis_point)
%Now C+t*P(:,1) will be a parametrization of the screw axis.

% saving the Axis points 
axis([1:3],k)=Axis_point;


fprintf("Row %i: x=%f y=%f z=%f\n",k, Axis_point)

%To find the angle of rotation, find the angle between A*Dperp and Dperp
%using your favorite method.
theta(k) = acos(((Afound5*Dperp)'*Dperp)/(Dperp'*Dperp));


% if(i<=21) %% Negating the 4N
%     theta(i)=-theta(i);
% end 

%fprintf("theta for row %i = %3f\n", i, theta(i)); % setting the first summation to 0+theta
if(k==1)
    s(1)=theta(1);
else 
    s(k)=s(k-1)+theta(k); 
    %fprintf("sum theta for row %i = %3f\n", i, s(i));
end 

end

writematrix(Dperp_vec5,filename,'Sheet',3)
writematrix(Afound_vec5, filename,'Sheet',4)

% Plotting C5 negative theta (matlab and abaqus) 
figure(3)
hold on 
plot(C5(1:42,2),s(:,1:42),'ko')
plot(C5(1:42,2),UR1_5(1:42,:),'b*')
xlabel('Moment')
ylabel('Theta')
title('Theta Phys Phys No Tether (Model 8)')
legend('Matlab C5','Abaqus C5','location', 'north')
hold off


%% C4 Theta angles

UR1_4 = C4(1:42,33); 
Dperp_vec4=zeros(3,21);
col = 1;
for j=1:42
    if (j==1)
        X4 = [C4(1,[3:5]); C4(1,[9:11]); C4(1,[15:17]); C4(1,[21:23]) ]';
        Y4 = [C4(1,[6:8]); C4(1,[12:14]); C4(1,[18:20]); C4(1,[24:26]) ]';
    else 
% time 0 C5 previous deformed data - C7 fixed position 3x4 maxtrix 
    X4 = [C4(j-1,[3:5])-C4(j,[27:29]); C4(j-1,[9:11])-C4(j,[27:29]); C4(j-1,[15:17])-C4(j,[27:29]); C4(j-1,[21:23])-C4(j,[27:29]); ]';

% time 0 C5 current deformed data - C7 fixed position 3x4 maxtrix 
    Y4 = [C4(j-1,[6:8])-C4(j,[27:29]); C4(j-1,[12:14])-C4(j,[27:29]); C4(j-1,[18:20])-C4(j,[27:29]); C4(j-1,[24:26])-C4(j,[27:29]); ]';
%Y=A*X + D
end 
%Xbar and Ybar are matrices that have repeats of the centroids of the cols
%of X and Y as their columns. I made them matrices for later convenience.
Xbar4 = X4*ones(4)/4;
Ybar4 = Y4*ones(4)/4;

%Xnew and Ynew are the matrices of "prime" vectors in
%http://www.kwon3d.com/theory/jkinem/rotmat.html. We use those to solve for
%A.
Xnew4 = X4-Xbar4;
Ynew4 = Y4-Ybar4;

% B = (pinv(Xnew')*Ynew')'
%B was my attempt at reconstructing A with either a pseudoinverse or left
%divide. It only works if the rows of Xnew are linearly indepepndent.
%Otherwise there is not a unique solution for A and those algorithms don't
%find the one we want (with A orthogonal and orientation preserving).


C = (Ynew4*Xnew4')/4;
[U,S,V] = svd(C);
Afound4 = U*V';
det(Afound4);
%If det(Afound = -1) let P = [[1,0,0];[0,1,0];[0,0,-1]] and replace Afound
%with U*P*V'.

%saving afound into afound_vec 
Afound_vec4([1:3],[col:col+2])=Afound4
col = col + 3;
%Now we've got A, so we need to recover the shift D. Since we know Y =
%A*X+D, just take D = Y-A*X (we know A now). You should get a matrix with
%the same column N times.

Dfound = Y4 - Afound4*X4;
Dfound2= Dfound*ones(4)/4;  % centroid of the four points 

%Now to find the axis of rotation.
%The direction of the axis is easy. It will be in the direction of the eigenvector of A with eigenvalue =1.

[P,L] = eig(Afound4);

%Now we have to find a point on the axis. Following 
%https://en.wikipedia.org/wiki/Screw_axis, we get

Dperp = Dfound2(:,1)-P(:,3)'*Dfound2(:,1)*P(:,3)
% new_Dperp=Dperp_6(:,i)-Dperp; 

% saving the Axis points 
Dperp_vec4([1:3],j)=Dperp;

%To find the point C on the helical axis, we can use pinv, this is the
%solution to (I-A)C = dperp in the orthogonal complement to the null space
%of I-A. That null space is precisely the span of the eigenvector of A with eigenvalue =1. 

Axis_point = pinv(eye(3)-Afound4)*Dperp;  % coordinates of a point relative to the origin 
%fprintf("Axis point for row %i = %3f, %3f, %3f \n", i, Axis_point)
%Now C+t*P(:,1) will be a parametrization of the screw axis.

% saving the Axis points 
axis([1:3],j)=Axis_point;


fprintf("Row %i: x=%f y=%f z=%f\n",j, Axis_point)

%To find the angle of rotation, find the angle between A*Dperp and Dperp
%using your favorite method.
theta(j) = acos(((Afound4*Dperp)'*Dperp)/(Dperp'*Dperp));


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

writematrix(Dperp_vec4,filename,'Sheet',5)
writematrix(Afound_vec4, filename,'Sheet',6)

% Plotting C4 negative theta (matlab and abaqus) 
figure(5)
hold on 
plot(C4(1:42,2),s(:,1:42),'ko')
plot(C4(1:42,2),UR1_4(1:42,:),'b*')
xlabel('Moment')
ylabel('Theta')
title('Theta Phys Phys No Tether (Model 8)')
legend('Matlab C4','Abaqus C4','location', 'north')
hold off
