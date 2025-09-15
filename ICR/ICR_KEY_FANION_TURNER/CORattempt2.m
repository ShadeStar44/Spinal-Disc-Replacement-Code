%% COR attempt 2
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

% Find the midpoint of points
for n = 2:k
    amidy(n-1) = 0.5*(ay(n)-ay(n-1))+ay(n-1);
    amidz(n-1) = 0.5*(az(n)-az(n-1))+az(n-1);
    pmidy(n-1) = 0.5*(py(n)-py(n-1))+py(n-1);
    pmidz(n-1) = 0.5*(pz(n)-pz(n-1))+pz(n-1);
end

% Plot the yz data for each time step and midpoints between timesteps
plot(ay,az,'ko'),hold on,  plot(py,pz,'ko'),plot(amidy,amidz,'go'),plot(pmidy,pmidz,'go')

% the angles "tao" between points
for n = 2:k
    taoa(n-1) = atan((az(n)-az(n-1))/(ay(n)-ay(n-1)));
    taob(n-1) = atan((pz(n)-pz(n-1))/(py(n)-py(n-1)));
end




