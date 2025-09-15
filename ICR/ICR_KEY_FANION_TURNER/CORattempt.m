%% Perpendicular Bisect Method Attempt for C6-7
% Christopher Key
% 08/19/2020
clear,clc
k = 21;
% Import data 
data = xlsread('CORattempt.xlsx');
% Posterior Superior Origin node: 101623
oy=4.51162e+02; oz = -7.47905e+02;
% Anterior Node : 74773
ay = data(1,3)+data(1:21,10)-oy;
az = data(1,4)+data(1:21,11)-oz;
% Posterior Node: [76403]
py = data(22,3)+data(22:42,10)-oy;
pz = data(22,4)+data(22:42,11)-oz;
% midpoint between time step n and n-1
for n = 2:k
    amidy(n-1) = 0.5.*(-ay(n-1)+ay(n))+ay(n-1);
    amidz(n-1) = 0.5.*(-az(n-1)+az(n))+az(n-1);
    pmidy(n-1) = 0.5.*(-py(n-1)+py(n))+py(n-1);
    pmidz(n-1) = 0.5.*(-pz(n-1)+pz(n))+pz(n-1);
end

plot(ay,az,'bo-')
hold on 
plot(amidy,amidz,'go')
plot(py,pz,'ko-')
plot(pmidy,pmidz,'go')
xlabel('y (mm)')
ylabel('z (mm)')
title('Instantaneous Center of Rotation')
legend('Displacement of reference nodes','midpoint of movement','Instantaneous Center of Rotation','autoupdate','off','location','northwest')


% the angles "tao" between points
for n = 2:k
    taoa(n-1) = atan((az(n)-az(n-1))/(ay(n)-ay(n-1)));
    taob(n-1) = atan((pz(n)-pz(n-1))/(py(n)-py(n-1)));
end
% location of the center of rotation
for n = 2:k
matrix = [amidy(n-1) pmidy(n-1) amidz(n-1) pmidz(n-1)]';
matrix1 = [1 0 -sin(taoa(n-1)) 0;1 0 0 -sin(taob(n-1));0 1 cos(taoa(n-1)) 0; 0 1 0 cos(taob(n-1))];
matrixfinal = matrix1\matrix;
mat(n,:) = matrixfinal';
end

plot(mat(2:20,1),mat(2:20,2),'ko-')
for n = 2:k

plot([amidy(n-1) mat(n,1) pmidy(n-1)],[amidz(n-1) mat(n,2) pmidz(n-1)],'g--')
end

hold off
figure(2)
plot(mat(2:20,1),mat(2:20,2),'ko-')


% biggest moves per time increment
for n = 2:k
    dAy(n) = ay(n)-ay(n-1);
    dAz(n) = az(n)-az(n-1);
    dPy(n) = py(n)-py(n-1);
    dPz(n) = pz(n)-pz(n-1);
end

for n = 1:k
    maga(n) = sqrt(dAy(n)^2+dAz(n)^2);
    magpie(n) = sqrt(dPy(n)^2+dPz(n)^2);
end
max1 = max(maga)

mux = max(magpie)



