%% foreman height and witdth narrowing/widening 
% for all models for the c5-c6 left hand side foreman under lateral bending (5n)
% 36572,16215,31500,37435
k=21;
zero1=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

mag15y=zero1;
mag15x=zero1;
width15=zero1;
height15=zero1;

mag14y=zero1;
mag14x=zero1;
width14=zero1;
height14=zero1;

mag13y=zero1;
mag13x=zero1;
width13=zero1;
height13=zero1;

mag6y=zero1;
mag6x=zero1;
width6=zero1;
height6=zero1;

mag5y=zero1;
mag5x=zero1;
width5=zero1;
height5=zero1;

mag4y=zero1;
mag4x=zero1;
width4=zero1;
height4=zero1;

mag3y=zero1;
mag3x=zero1;
width3=zero1;
height3=zero1;


mag2y=zero1;
mag2x=zero1;
width2=zero1;
height2=zero1;

mag1y=zero1;
mag1x=zero1;
width1=zero1;
height1=zero1;
% 36572,16215,31500,37435
%% model15_intact_TLC_4N
t15=[];

% 36572
aa1=12.3763+[];
aa2=446.738+[];
aa3=-714.659+[];

% 16215
ab1=12.1679+[];
ab2=446.385+[];
ab3=-705.203+[];

% 31500
ac1=9.70641+[];
ac2=444.062+[];
ac3=-707.068+[];

% 37435
ad1=16.2708+[];
ad2=449.059+[];
ad3=-710.186+[];

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

%% model1_slideslide_tether/S2_4N
t1=[];
% 36572
ae1=12.3763+[];
ae2=446.738+[];
ae3=-714.659+[];

% 16215
af1=12.1679+[];
af2=446.385+[];
af3=-705.203+[];

% 31500
ag1=9.70641+[];
ag2=444.066+[];
ag3=-707.086+[];

% 37435
ah1=16.2708+[];
ah2=449.059+[];
ah3=-710.186+[];

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
%% model2_SlideSlide_NoTether/S2_4N
t2=[];

% 36572
ai1=+[];
ai2=+[];
ai3=+[];

% 16215
aj1=+[];
aj2=+[];
aj3=+[];

% 31500
ak1=+[];
ak2=+[];
ak3=+[];

% 37435
al1=+[];
al2=+[];
al3=+[];

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

%% model3_APSlide_Tether/S2_4N
t3=[];
% 36572
am1=+[];
am2=+[];
am3=+[];
% 16215
an1=+[];
an2=+[];
an3=+[];
% 31500
ao1=+[];
ao2=+[];
ao3=+[];
% 37435
ap1=+[];
ap2=+[];
ap3=+[];

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


%% model4_APSlide_NoTether/S2_4N
t4=[];
% 36572
aq1=+[];
aq2=+[];
aq3=+[];
% 16215
ar1=+[];
ar2=+[];
ar3=+[];
% 31500
as1=+[];
as2=+[];
as3=+[];
% 37435
at1=+[];
at2=+[];
at3=+[];

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

%% model5_LatSlide_Tether/S2_4N
t5=[];
% 36572
au1=+[];
au2=+[];
au3=+[];
% 16215
av1=+[];
av2=+[];
av3=+[];
% 31500
aw1=+[];
aw2=+[];
aw3=+[];
% 37435
ax1=+[];
ax2=+[];
ax3=+[];

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


%% model6_LatSlide_NoTether/S2_4N
t6=[];
% 36572
ay1=+[];
ay2=+[];
ay3=+[];
% 16215
az1=+[];
az2=+[];
az3=+[];
% 31500
ba1=+[];
ba2=+[];
ba3=+[];
% 37435
bb1=+[];
bb2=+[];
bb3=+[];

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


%% model13_Fixed_Tether_S2_4N
t13=[];
% 36572
bc1=+[];
bc2=+[];
bc3=+[];
% 16215
bd1=+[];
bd2=+[];
bd3=+[];
% 31500
be1=+[];
be2=+[];
be3=+[];
% 37435
bf1=+[];
bf2=+[];
bf3=+[];

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


%% model14_Fixed_NoTether/S2_4N
t14=[];
% 36572
bg1=+[];
bg2=+[];
bg3=+[];
% 16215
bh1=+[];
bh2=+[];
bh3=+[];
% 31500
bi1=+[];
bi2=+[];
bi3=+[];
% 37435
bk1=+[];
bk2=+[];
bk3=+[];

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

PC=[pc15;pc1;pc2;pc3;pc4;pc5;pc6;pc13;pc14];
bar(PC)
xticklabels({'Intact','Model 1','Model 2', 'Model 3','Model 4','Model 5','Model 6','Model 13','model 14'})
ylabel('Percent Change')
legend('Height','Width','location','northwest')
title('Absolute Foraminal Percent Change Under 2 N-m of extension (4n)')

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
title('C5-C6 Left Hand Foreman Narrowing/Widening Under 2 N-m of Extension (4N)')
legend('intact height','intact width','model 1 height', 'model 1 width','model 2 height','model 2 width','model 3 height', 'model 3 width','model 4 height','model 4 width','model 5 height','model 5 width','model 6 height','model 6 width','model 13 height','model 13 width','model 14 height','model 14 width','location','southwest')
