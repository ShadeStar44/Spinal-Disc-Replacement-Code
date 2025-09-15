%% foramen height and width narrowing/widening 
% for all models for the c3-c4 right hand side foramen under lateral bending (_n)
% 4457,20101,9037,21922

% 4N!!

% Values for displacement and base coordinates have not yet been updated from copy paste.

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
% 4457,20101,9037,21922
%% model15_intact_TLC_4N
t15=[2 2.05 2.1 2.15 2.2 2.25 2.30198 2.35365 2.40358 2.45421 2.50322 2.55384 2.60384 2.65565 2.70225 2.75206 2.80139 2.85108 2.90339 2.95085 3];

% 4457
aa1=-9.37506+[];
aa2=448.144+[];
aa3=-689.149+[];

% 20101
ab1=-11.8681+[];
ab2=447.151+[];
ab3=-698.575+[];

% 9037
ac1=-7.50723+[];
ac2=444.719+[];
ac3=-690.512+[];

% 21922
ad1=-12.9198+[];
ad2=450.785+[];
ad3=-694.998+[];

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
t1=[2 2.05126 2.11533 2.17471 2.20404 2.25121 2.30289 2.35286 2.41117 2.46025 2.51267 2.5564 2.60334 2.66048 2.70822 2.759 2.80923 2.85061 2.90524 2.95003 3];

% 4457
ae1=-9.37506+[];
ae2=448.144+[];
ae3=-689.149+[];

% 20101
af1=-11.8681+[];
af2=447.151+[];
af3=-698.575+[];

% 9037
ag1=-7.50723+[];
ag2=444.719+[];
ag3=-690.512+[];

% 21922
ah1=-12.9198+[];
ah2=450.785+[];
ah3=-694.998+[];

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
t2=[2 2.05126 2.1153 2.17471 2.20447 2.25221 2.30059 2.35788 2.41099 2.45099 2.50605 2.55427 2.60174 2.65492 2.70335 2.75569 2.80363 2.85302 2.90564 2.95047 3];

% 4457
ai1=-9.37506+[];
ai2=448.144+[];
ai3=-689.149+[];

% 20101
aj1=-11.8681+[];
aj2=447.151+[];
aj3=-698.575+[];

% 9037
ak1=-7.50723+[];
ak2=444.719+[];
ak3=-690.512+[];

% 21922
al1=-12.9198+[];
al2=450.785+[];
al3=-694.998+[];

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
t3=[2 2.05126 2.11533 2.16533 2.20361 2.25215 2.30482 2.35211 2.4011 2.4565 2.50468 2.55973 2.60432 2.65144 2.70196 2.75595 2.80367 2.85248 2.91084 2.96199 3];
% 4457
am1=-9.37506+[];
am2=448.144+[];
am3=-689.149+[];
% 20101
an1=-11.8681+[];
an2=447.151+[];
an3=-698.575+[];
% 9037
ao1=-7.50723+[];
ao2=444.719+[];
ao3=-690.512+[];
% 21922
ap1=-12.9198+[];
ap2=450.785+[];
ap3=-694.998+[];

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
t4=[2 2.0622 2.11523 2.15852 2.20492 2.25001 2.30364 2.35417 2.40231 2.45225 2.50547 2.55011 2.60474 2.65523 2.70472 2.7507 2.80007 2.85772 2.90074 2.95442 3];
% 4457
aq1=-9.37506+[];
aq2=448.144+[];
aq3=689.149+[];
% 20101
ar1=-11.8681+[];
ar2=447.151+[];
ar3=-698.575+[];
% 9037
as1=-7.50723+[];
as2=444.719+[];
as3=-690.512+[];
% 21922
at1=-12.9198+[];
at2=450.785+[];
at3=-694.998+[];

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
t5=[2 2.05126 2.11533 2.17471 2.20404 2.25806 2.30703 2.35279 2.40109 2.45138 2.50274 2.55389 2.60894 2.65187 2.70418 2.75649 2.80083 2.85242 2.90526 2.95387 3];
% 4457
au1=-9.37506+[];
au2=448.144+[];
au3=-689.149+[];
% 20101
av1=-11.8681+[];
av2=447.151+[];
av3=-698.575+[];
% 9037
aw1=-7.50723+[];
aw2=444.719+[];
aw3=-690.512+[];
% 21922
ax1=-12.9198+[];
ax2=450.785+[];
ax3=-694.998+[];

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
t6=[2 2.05467 2.1077 2.15244 2.20335 2.25035 2.30555 2.35774 2.40313 2.45015 2.50252 2.55284 2.60017 2.65712 2.70364 2.75106 2.80515 2.85128 2.90047 2.95082 3];
% 4457
ay1=-9.37506+[];
ay2=448.144+[];
ay3=-689.149+[];
% 20101
az1=-11.8681+[];
az2=447.151+[];
az3=-698.575+[];
% 9037
ba1=-7.50723+[];
ba2=444.719+[];
ba3=-690.512+[];
% 21922
bb1=-12.9198+[];
bb2=450.785+[];
bb3=-694.998+[];

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
t13=[2 2.05126 2.11533 2.16533 2.2247 2.25107 2.31707 2.35251 2.40079 2.4548 2.50774 2.55564 2.60228 2.65931 2.70659 2.75382 2.80395 2.85431 2.90296 2.95231 3];
% 4457
bc1=-9.37506+[];
bc2=448.144+[];
bc3=-689.149+[];
% 20101
bd1=-11.8681+[];
bd2=447.151+[];
bd3=-698.575+[];
% 9037
be1=-7.50723+[];
be2=444.719+[];
be3=-690.512+[];
% 21922
bf1=-12.9198+[];
bf2=450.785+[];
bf3=-694.998+[];

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
t14=[2 2.05126 2.11533 2.17471 2.20107 2.25678 2.30078 2.35474 2.41562 2.45083 2.5117 2.55021 2.60026 2.65289 2.70081 2.75198 2.8011 2.85607 2.90043 2.95245 3];

% 4457
bg1=-9.37506+[];
bg2=448.144+[];
bg3=-689.149+[];
% 20101
bh1=-11.8681+[];
bh2=447.151+[];
bh3=-698.575+[];
% 9037
bi1=-7.50723+[];
bi2=444.719+[];
bi3=-690.512+[];
% 21922
bk1=-12.9198+[];
bk2=450.785+[];
bk3=-694.998+[];

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
title('C4-C5 Right Hand Foreman Narrowing/Widening Under 2 N-m of Extension (4N)')
legend('intact height','intact width','model 1 height', 'model 1 width','model 2 height','model 2 width','model 3 height', 'model 3 width','model 4 height','model 4 width','model 5 height','model 5 width','model 6 height','model 6 width','model 13 height','model 13 width','model 14 height','model 14 width','location','southwest')