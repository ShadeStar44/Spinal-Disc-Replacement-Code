%% foreman height and witdth narrowing/widening 
% for all models for the c5-c6 right hand side foreman under lateral bending (5n)
% 40182, 62515, 45870, 65935
k=21;

mag15y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
mag15x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
width15=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
height15=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

mag14y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
mag14x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
width14=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
height14=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

mag13y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
mag13x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
width13=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
height13=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

mag6y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
mag6x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
width6=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
height6=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

mag5y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
mag5x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
width5=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
height5=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

mag4y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
mag4x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
width4=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
height4=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

mag3y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
mag3x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
width3=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
height3=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];


mag2y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
mag2x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
width2=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
height2=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

mag1y=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
mag1x=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
width1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
height1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

%% model15_intact_TLC_5N
t15=[];

% 40182U
aa1=-13.5191+[];
aa2=447.04+[];
aa3=-720.839+[];

% 62515L
ab1=-13.5397+[];
ab2=448.593+[];
ab3=-730.72+[];

% 45870
ac1=-9.75965+[];
ac2=445.175+[];
ac3=-723.489+[];

% 65935R
ad1=-14.8651+[];
ad2=449.401+[];
ad3=-725.184+[];

ya1=aa1-ab1;
ya2=aa2-ab2;
ya3=aa3-ab3;
xa1=ad1-ac1;
xa2=ad2-ac2;
xa3=ad3-ac3;
x15=[xa1',xa2',xa3'];
y15=[ya1',ya2',ya3'];

for n=1:k
    mag15x(n)=sqrt(x15(n,1)^2+x15(n,2)^2+x15(n,3)^2);
end
for n=1:k
    mag15y(n)=sqrt(y15(n,1)^2+y15(n,2)^2+y15(n,3)^2);
end
for n=1:k
    width15(n)=mag15x(1,1)-mag15x(1,n);
end
for n=1:k
    height15(n)=mag15y(1,1)-mag15y(1,n);
end

%% model1_slideslide_tether/S2_5N
t1=[];
% 40182U
ae1=-13.5191+[];
ae2=447.04+[];
ae3=-720.839+[];
% 62515L
af1=-13.5397+[];
af2=448.593+[];
af3=-730.72+[];
% 45870
ag1=-9.75965+[];
ag2=445.175+[];
ag3=-723.489+[];
% 65935R
ah1=-14.8651+[];
ah2=449.401+[];
ah3=-725.184+[];

xb1=ah1-ag1;
xb2=ah2-ag2;
xb3=ah3-ag3;
yb1=ae1-af1;
yb2=ae2-af2;
yb3=ae3-af3;
y1=[yb1',yb2',yb3'];
x1=[xb1',xb2',xb3'];

for n=1:k
    mag1x(n)=sqrt(x1(n,1)^2+x1(n,2)^2+x1(n,3)^2);
end
for n=1:k
    mag1y(n)=sqrt(y1(n,1)^2+y1(n,2)^2+y1(n,3)^2);
end
for n=1:k
    height1(n)=mag1y(1,1)-mag1y(1,n);
end
for n=1:k
    width1(n)=mag1x(1,1)-mag1x(1,n);
end
%% model2_SlideSlide_NoTether/S2_5N
t2=[];
% 40182U
ai1=-13.5191+[];
ai2=447.04+[];
ai3=-720.839+[];
% 62515L
aj1=-13.5397+[];
aj2=448.593+[];
aj3=-730.72+[];
% 45870
ak1=-9.75965+[];
ak2=445.175+[];
ak3=-723.489+[];
% 65935R
al1=-14.8651+[];
al2=449.401+[];
al3=-725.184+[];

xc1=al1-ak1;
xc2=al2-ak2;
xc3=al3-ak3;
yd1=ai1-aj1;
yd2=ai2-aj2;
yd3=ai3-aj3;
y2=[yd1',yd2',yd3'];
x2=[xc1',xc2',xc3'];

for n=1:k
    mag2x(n)=sqrt(x2(n,1)^2+x2(n,2)^2+x2(n,3)^2);
end
for n=1:k
    mag2y(n)=sqrt(y2(n,1)^2+y2(n,2)^2+y2(n,3)^2);
end
for n=1:k
    height2(n)=mag2y(1,1)-mag2y(1,n);
end
for n=1:k
    width2(n)=mag2x(1,1)-mag2x(1,n);
end

%% model3_APSlide_Tether/S2_5N
t3=[];
% 40182U
am1=-13.5191+[];
am2=447.04+[];
am3=-720.839+[];
% 62515L
an1=-13.5397+[];
an2=448.593+[];
an3=-730.72+[];
% 45870
ao1=-9.75965+[];
ao2= 445.175+[];
ao3= -723.489+[];
% 65935R
ap1=-14.8651+[];
ap2=449.401+[];
ap3=-725.184+[];

xe1=ap1-ao1;
xe2=ap2-ao2;
xe3=ap3-ao3;
yf1=am1-an1;
yf2=am2-an2;
yf3=am3-an3;
y3=[yf1',yf2',yf3'];
x3=[xe1',xe2',xe3'];

for n=1:k
    mag3x(n)=sqrt(x3(n,1)^2+x3(n,2)^2+x3(n,3)^2);
end
for n=1:k
    mag3y(n)=sqrt(y3(n,1)^2+y3(n,2)^2+y3(n,3)^2);
end
for n=1:k
    height3(n)=mag3y(1,1)-mag3y(1,n);
end
for n=1:k
    width3(n)=mag3x(1,1)-mag3x(1,n);
end


%% model4_APSlide_NoTether/S2_5N
t4=[];
% 40182U
aq1=-13.5191+[];
aq2= 447.04+[];
aq3=-720.839+[];
% 62515L
ar1=-13.5397+[];
ar2=448.593+[];
ar3=-730.72+[];
% 45870
as1=-9.75965+[];
as2=445.175+[];
as3=-723.489+[];
% 65935R
at1=-14.8651+[];
at2=449.401+[];
at3=-725.184+[];

xg1=at1-as1;
xg2=at2-as2;
xg3=at3-as3;
yh1=aq1-ar1;
yh2=aq2-ar2;
yh3=aq3-ar3;
y4=[yh1',yh2',yh3'];
x4=[xg1',xg2',xg3'];

for n=1:k
    mag4x(n)=sqrt(x4(n,1)^2+x4(n,2)^2+x4(n,3)^2);
end
for n=1:k
    mag4y(n)=sqrt(y4(n,1)^2+y4(n,2)^2+y4(n,3)^2);
end
for n=1:k
    height4(n)=mag4y(1,1)-mag4y(1,n);
end
for n=1:k
    width4(n)=mag4x(1,1)-mag4x(1,n);
end

%% model5_LatSlide_Tether/S2_5N
t5=[];
% 40182U
au1=-13.5191+[];
au2=447.04+[];
au3=-720.839+[];
% 62515L
av1=-13.5397+[];
av2=448.593+[];
av3=-730.72+[];
% 45870
aw1=-9.75965+[];
aw2=445.175+[];
aw3=-723.489+[];
% 65935R
ax1=-14.8651+[];
ax2=449.401+[];
ax3=-725.184+[];

xi1=ax1-aw1;
xi2=ax2-aw2;
xi3=ax3-aw3;
yj1=au1-av1;
yj2=au2-av2;
yj3=au3-av3;
y5=[yj1',yj2',yj3'];
x5=[xi1',xi2',xi3'];

for n=1:k
    mag5x(n)=sqrt(x5(n,1)^2+x5(n,2)^2+x5(n,3)^2);
end
for n=1:k
    mag5y(n)=sqrt(y5(n,1)^2+y5(n,2)^2+y5(n,3)^2);
end
for n=1:k
    height5(n)=mag5y(1,1)-mag5y(1,n);
end
for n=1:k
    width5(n)=mag5x(1,1)-mag5x(1,n);
end


%% model6_LatSlide_NoTether/S2_5N
t6=[];
% 40182U
ay1=-13.5191+[];
ay2=447.04+[];
ay3=-720.839+[];
% 62515L
az1=-13.5397+[];
az2=448.593+[];
az3=-730.72+[];
% 45870
ba1=-9.75965+[];
ba2=445.175+[];
ba3=-723.489+[];
% 65935R
bb1=-14.8651+[];
bb2=449.401+[];
bb3=-725.184+[];

xk1=bb1-ba1;
xk2=bb2-ba2;
xk3=bb3-ba3;
yl1=ay1-az1;
yl2=ay2-az2;
yl3=ay3-az3;
y6=[yl1',yl2',yl3'];
x6=[xk1',xk2',xk3'];

for n=1:k
    mag6x(n)=sqrt(x6(n,1)^2+x6(n,2)^2+x6(n,3)^2);
end
for n=1:k
    mag6y(n)=sqrt(y6(n,1)^2+y6(n,2)^2+y6(n,3)^2);
end
for n=1:k
    height6(n)=mag6y(1,1)-mag6y(1,n);
end
for n=1:k
    width6(n)=mag6x(1,1)-mag6x(1,n);
end


%% model13_Fixed_Tether_S2_5N
t13=[];
% 40182U
bc1=-13.5191+[];
bc2=447.04+[];
bc3=-720.839+[];
% 62515L
bd1=-13.5397+[];
bd2=448.593+[];
bd3=-730.72+[];
% 45870
be1=-9.75965+[];
be2=445.175+[];
be3=-723.489+[];
% 65935R
bf1=-14.8651+[];
bf2=449.401+[];
bf3=-725.184+[];

xm1=bf1-be1;
xm2=bf2-be2;
xm3=bf3-be3;
yn1=bc1-bd1;
yn2=bc2-bd2;
yn3=bc3-bd3;
y13=[yn1',yn2',yn3'];
x13=[xm1',xm2',xm3'];

for n=1:k
    mag13x(n)=sqrt(x13(n,1)^2+x13(n,2)^2+x13(n,3)^2);
end
for n=1:k
    mag13y(n)=sqrt(y13(n,1)^2+y13(n,2)^2+y13(n,3)^2);
end
for n=1:k
    height13(n)=mag13y(1,1)-mag13y(1,n);
end
for n=1:k
    width13(n)=mag13x(1,1)-mag13x(1,n);
end


%% model14_Fixed_NoTether/S2_5N
t14=[];
% 40182U
bg1=-13.5191+[];
bg2=447.04+[];
bg3=-720.839+[];
% 62515L
bh1=-13.5397+[];
bh2=448.593+[];
bh3=-730.72+[];
% 45870
bi1=-9.75965+[];
bi2=445.175+[];
bi3=-723.489+[];
% 65935R
bk1=-14.8651+[];
bk2=449.401+[];
bk3=-725.184+[];

xo1=bk1-bi1;
xo2=bk2-bi2;
xo3=bk3-bi3;
yp1=bg1-bh1;
yp2=bg2-bh2;
yp3=bg3-bh3;
x14=[xo1',xo2',xo3'];
y14=[yp1',yp2',yp3'];

for n=1:k
    mag14x(n)=sqrt(x14(n,1)^2+x14(n,2)^2+x14(n,3)^2);
end
for n=1:k
    mag14y(n)=sqrt(y14(n,1)^2+y14(n,2)^2+y14(n,3)^2);
end
for n=1:k
    height14(n)=mag14y(1,1)-mag14y(1,n);
end
for n=1:k
    width14(n)=mag14x(1,1)-mag14x(1,n);
end

%% Percent change
% bar plot
figure(1)
pc15x=(mag15x(21)/mag15x(1)*100)-100;
pc15y=(mag15y(21)/mag15y(1)*100)-100;
pc15=[pc15y,pc15x];

pc1x=(mag1x(21)/mag1x(1)*100)-100;
pc1y=(mag1y(21)/mag1y(1)*100)-100;
pc1=[pc1y,pc1x];

pc2x=(mag2x(21)/mag2x(1)*100)-100;
pc2y=(mag2y(21)/mag2y(1)*100)-100;
pc2=[pc2y,pc2x];

pc3x=(mag3x(21)/mag3x(1)*100)-100;
pc3y=(mag3y(21)/mag3y(1)*100)-100;
pc3=[pc3y,pc3x];

pc4x=(mag4x(21)/mag4x(1)*100)-100;
pc4y=(mag4y(21)/mag4y(1)*100)-100;
pc4=[pc4y,pc4x];

pc5x=(mag5x(21)/mag5x(1)*100)-100;
pc5y=(mag5y(21)/mag5y(1)*100)-100;
pc5=[pc5y,pc5x];

pc6x=(mag6x(21)/mag6x(1)*100)-100;
pc6y=(mag6y(21)/mag6y(1)*100)-100;
pc6=[pc6y,pc6x];

pc13x=(mag13x(21)/mag13x(1)*100)-100;
pc13y=(mag13y(21)/mag13y(1)*100)-100;
pc13=[pc13y,pc13x];


pc14x=(mag14x(21)/mag14x(1)*100)-100;
pc14y=(mag14y(21)/mag14y(1)*100)-100;
pc14=[pc14y,pc14x];

%  These percent change were used to match my data with Dr. Leahy's
%  dissertation. Increment(16) was used due to 1.5 N-m instead of 2.
%  pc15xl=100-mag15x(16)/8.373*100;
%  pc15yl=100-mag15y(16)/9.001*100;
%  pc15l=[pc15yl,pc15xl];
%  second l is an L

PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Absolute Foraminal Percent Change Under 2 N-m of lateral bending (5n)')

%% figures
figure(2)

plot((t15-2)*(-2),-1*height15,'b')
hold on
plot((t15-2)*(-2),-1*width15,'-.b')
hold on

plot((t1-2)*(-2),-1*height1,'r')
hold on
plot((t1-2)*(-2),-1*width1,'-.r')
hold on

plot((t2-2)*(-2),-1*height2,'g')
hold on
plot((t2-2)*(-2),-1*width2,'-.g')
hold on

plot((t3-2)*(-2),-1*height3,'c')
hold on
plot((t3-2)*(-2),-1*width3,'-.c')
hold on

plot((t4-2)*(-2),-1*height4,'color',[.49 1 .63])
hold on
plot((t4-2)*(-2),-1*width4,'-.','color',[.49 1 .63])
hold on

plot((t5-2)*(-2),-1*height5,'color',[0.75, 0, 0.75])
hold on
plot((t5-2)*(-2),-1*width5,'-.','color',[0.75, 0, 0.75])
hold on

plot((t6-2)*(-2),-1*height6,'color',[0 0.5 1])
hold on
plot((t6-2)*(-2),-1*width6,'-.','color',[0 0.5 1])
hold on

plot((t13-2)*(-2),-1*height13,'color',[0.2 0 0])
hold on
plot((t13-2)*(-2),-1*width13,'-.','color',[0.2 0 0])
hold on

plot((t14-2)*(-2),-1*height14,'color',[1 .5 0])
hold on
plot((t14-2)*(-2),-1*width14,'-.','color',[1 .5 0])
hold on

xlabel('Moment (N-m)')
ylabel({'Narrowing/Widening (mm)';'(Positive is Widening, Negative is Narrowing)'})
title('C5-C6 Left Hand Foreman Narrowing/Widening Under 2 N-m of Lateral Bending (5N)')
legend('intact height','intact width','model 1 height', 'model 1 width','model 2 height','model 2 width','model 3 height', 'model 3 width','model 4 height','model 4 width','model 5 height','model 5 width','model 6 height','model 6 width','model 13 height','model 13 width','model 14 height','model 14 width','location','southwest')








