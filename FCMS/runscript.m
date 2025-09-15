%% this file runs all models for facet contact mean stress
% and produces all figures and subplots
clear variables
close all

%% intact
run('E:\results\FCMS\intact\intact6n6p')
figure(30)
subplot(3,3,1)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for intact model under axial rotation (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR','location','north')


run('E:\results\FCMS\intact\intact5n5p')
figure(31)
subplot(3,3,1)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for intact model under lateral bending (5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')


run('E:\results\FCMS\intact\intact4n4p')
figure(32)
subplot(3,3,1)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);
leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for intact model under flexion/extension (4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')


% model 1
run('E:\results\FCMS\model1\model16n6p.m')
figure(30)
subplot(3,3,2)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);
hold on

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 1 under axial rotation(6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model1\model15n5p.m')
figure(31)
subplot(3,3,2)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 1 under lateral bending (5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model1\model14n4p.m')
figure(32)
subplot(3,3,2)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 1 under flexion/extension(4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')


% model 2
run('E:\results\FCMS\model2\model26n6p.m')
figure(30)
subplot(3,3,3)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 2 under axial rotaiton (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model2\model25n5p.m')
figure(31)
subplot(3,3,3)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 2 under lateral bending(5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model2\model24n4p.m')
figure(32)
subplot(3,3,3)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 2 under flexion/extension(4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')
% model 3
run('E:\results\FCMS\model3\model36n6p.m')
figure(30)
subplot(3,3,4)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 3 under axial rotation (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model3\model35n5p.m')
figure(31)
subplot(3,3,4)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 3 under lateral bending(5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model3\model34n4p.m')
figure(32)
subplot(3,3,4)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 3 under flexion/extension(4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

% model 4
run('E:\results\FCMS\model4\model46n6p.m')
figure(30)
subplot(3,3,5)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 4 under axial rotation (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model4\model45n5p.m')
figure(31)
subplot(3,3,5)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 4 under lateral bending(5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model4\model44n4p.m')
figure(32)
subplot(3,3,5)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 4 under flexion/extension(4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

% model 5
run('E:\results\FCMS\model5\model56n6p.m')
figure(30)
subplot(3,3,6)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 5 under axial rotaiton (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')


run('E:\results\FCMS\model5\model55n5p.m')
figure(31)
subplot(3,3,6)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 5 under lateral bending (5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model5\model54n4p.m')
figure(32)
subplot(3,3,6)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 5 under flexion/extension (4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')


% model 6
run('E:\results\FCMS\model6\model66n6p.m')
figure(30)
subplot(3,3,7)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 6 under axial rotaiton (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model6\model65n5p.m')
figure(31)
subplot(3,3,7)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 6 under lateral bending (5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model6\model64n4p.m')
figure(32)
subplot(3,3,7)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 6 under flexion/extension (4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

% model 13
run('E:\results\FCMS\model13\model136n6p.m')
figure(30)
subplot(3,3,8)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 13 under axial rotaiton (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model13\model135n5p.m')
figure(31)
subplot(3,3,8)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 13 under lateral bending (5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model13\model134n4p.m')
figure(32)
subplot(3,3,8)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 13 under flexion/extension (4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

% model 14
run('E:\results\FCMS\model14\model146n6p.m')
figure(30)
subplot(3,3,9)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 14 under axial rotaiton (6P/6N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model14\model145n5p.m')
figure(31)
subplot(3,3,9)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 14 under lateral bending (5P/5N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

run('E:\results\FCMS\model14\model144n4p.m')
figure(32)
subplot(3,3,9)
i=plot(c4xl,a,'r');
hold on
j=plot(c5xl,b,'g');
hold on
k=plot(c6xl,c,'b');
hold on
l=plot(c7xl,d,'c');
hold on
m=plot(c4xr,e,'color',[0.75, 0, 0.75]);
hold on
q=plot(c5xr,f,'color',[0 0.5 1]);
hold on
o=plot(c6xr,g,'color',[0.2 0 0]);
hold on
p=plot(c7xr,h,'color',[1 .5 0]);

leg=[i,j,k,l,m,q,o,p];
title('Facet Contact Mean Stress for model 14 under flexion/extension (4P/4N)')
xlabel('Moment (N-m)')
ylabel('Stress (Pa)')
legend(leg,'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')

figure(30)
figure(31)
figure(32)

