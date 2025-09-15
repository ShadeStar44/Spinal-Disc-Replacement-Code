%% Facet Contact Mean Stress (FCMS)
% model6_LatSlide_NoTether/4n & 4p
clear all;
run('model6_4n4pa.m')
run('model6_4n4p.m')
figure(19)

for n=1:41
    % left
a(n)=c4yl(n)/c4yla(n);
b(n)=c5yl(n)/c5yla(n);
c(n)=c6yl(n)/c6yla(n);
d(n)=c7yl(n)/c7yla(n);
    % right
e(n)=c4yr(n)/c4yra(n);
f(n)=c5yr(n)/c5yra(n);
g(n)=c6yr(n)/c6yra(n);
h(n)=c7yr(n)/c7yra(n);
end

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
ylabel('Stress (kPa)')
legend([leg],'C4UL','C5UL','C6UL','C6UL','C4UR','C5UR','C6UR','C7UR')