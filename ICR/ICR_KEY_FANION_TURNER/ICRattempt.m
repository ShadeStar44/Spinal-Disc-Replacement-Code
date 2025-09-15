%% This will attempt to find the instantaneous Center of Rotation Generically
clear,clc
% Number of time steps (k)
k = 21;
% first the anterior and posterior nodes and the original positions of the nodes are needed
% appended to the nodes are the location of each node for the nth time step
% Anterior Node: 48025
% anodex = .690084; this is commented out because motion in the y,z plane
% is needed
anodey = 433.003+[0.0426379 -0.0757545 -0.0845906 0.0060263 0.180537 0.4264 0.732903 1.07275 1.43613 1.83854 2.2551 2.70914 3.17524 3.6604 4.07669 4.49005 4.84884 5.15352 5.43123 5.65186 5.86669];
anodez = -728.01+[-0.26043 -0.295993 -0.233165 -0.104378 0.0770283 0.298211 0.546033 0.7963 1.04059 1.28613 1.51353 1.73074 1.92708 2.11288 2.26453 2.40784 2.53617 2.6514 2.75739 2.84356 2.92923 ];
% posterior node: 49541
% pnodex=1.05125
pnodey=448.452+[0.0901372 -0.0308943 -0.0327768 0.0709056 0.261011 0.521296 0.837981 1.18044 1.53768 1.92407 2.3155 2.73382 3.15471 3.58347 3.94164 4.28759 4.57645 4.81254 5.02249 5.18481 5.33974  ];
pnodez=-726.226+[-0.682486 -0.685294 -0.700613 -0.734214 -0.784086 -0.849115 -0.941246 -1.05493 -1.18279 -1.32749 -1.48152 -1.65712 -1.84917 -2.05957 -2.25563 -2.46553 -2.66376 -2.83985 -2.99941 -3.1274 -3.24991 ];

% midpoint between time step n and n-1
for n = 2:k
    amidy(n-1) = 0.5.*(-anodey(n-1)+anodey(n))+anodey(n-1);
    amidz(n-1) = 0.5.*(-anodez(n-1)+anodez(n))+anodez(n-1);
    pmidy(n-1) = 0.5.*(-pnodey(n-1)+pnodey(n))+pnodey(n-1);
    pmidz(n-1) = 0.5.*(-pnodez(n-1)+pnodez(n))+pnodez(n-1);
end

plot(anodey,anodez,'bo-')
hold on 
plot(amidy,amidz,'go')
plot(pnodey,pnodez,'bo-')
plot(pmidy,pmidz,'go-')

% the angles "tao" between points
for n = 2:k
    taoa(n-1) = atan((anodez(n)-anodez(n-1))/(anodey(n)-anodey(n-1)));
    taob(n-1) = atan((pnodez(n)-pnodez(n-1))/(pnodey(n)-pnodey(n-1)));
end

% location of the center of rotation
for n = 2:k
matrix = [amidy(n-1) pmidy(n-1) amidz(n-1) pmidz(n-1)]';
matrix1 = [1 0 -sin(taoa(n-1)) 0;1 0 0 -sin(taob(n-1));0 1 cos(taoa(n-1)) 0; 0 1 0 cos(taob(n-1))];
matrixfinal = matrix1\matrix;
mat(n,:) = matrixfinal';
end

plot(mat(3:20,1),mat(3:20,2),'ko-')
legend('anterior/posterior node location','Instantaneous Center of Rotation','autoupdate','off')
for n = 3:k
plot([amidy(n-1) mat(n,1) pmidy(n-1)],[amidz(n-1) mat(n,2) pmidz(n-1)],'g--')
end

hold off
figure(2)
plot(mat(3:20,1),mat(3:20,2),'ko-')




