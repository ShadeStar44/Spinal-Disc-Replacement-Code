%% this script plots relative range of motion of vertabrae segments
close all
clear all
%% intact
% c4-c5 
run('model15_intact_ROM.m')
%4n
aaa1=ur1c-ur1e;
aaa2=ur2c-ur2e;
aaa3=ur3c-ur3e;

%4p
aab1=ur1d-ur1f;
aab2=ur2d-ur2f;
aab3=ur3d-ur3f;

%5n
aac1=ur1c5-ur1e5;
aac2=ur2c5-ur2e5;
aac3=ur3c5-ur3e5;

%5p
aad1=ur1d5-ur1f5;
aad2=ur2d5-ur2f5;
aad3=ur3d5-ur3f5;

%6n
aae1=ur1c6-ur1e6;
aae2=ur2c6-ur2e6;
aae3=ur3c6-ur3e6;

%6p
aaf1=ur1d6-ur1f6;
aaf2=ur2d6-ur2f6;
aaf3=ur3d6-ur3f6;

% join data
%4n4p
t3;
zza1=[flip(aaa1(2:21)),aab1];
zza2=[flip(aaa2(2:21)),aab2];
zza3=[flip(aaa3(2:21)),aab3];

%5n5p
t4;
zzb1=[flip(aac1(2:21)),aad1];
zzb2=[flip(aac2(2:21)),aad2];
zzb3=[flip(aac3(2:21)),aad3];

%6n6p
t20;
zzc1=[flip(aae1(2:21)),aaf1];
zzc2=[flip(aae2(2:21)),aaf2];
zzc3=[flip(aae3(2:21)),aaf3];

% plot data

%4n4p
figure(46)
f29=plot(t3,zza1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during flexion/extension (4n4p)')
legend(f29,'intact')
hold on

figure(47)
f30=plot(t3,zza2,'k');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p')
legend(f30,'intact')
hold on

figure(48)
f31=plot(t3,zza3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')
legend(f31,'intact')
hold on

%5n5p
figure(49)
f32=plot(t4,zzb1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')
legend(f32,'intact')
hold on

figure(50)
f33=plot(t4,zzb2,'k');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')
legend(f33,'intact')
hold on

figure(51)
f34=plot(t4,zzb3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')
legend(f34,'intact')
hold on


%6n6p
figure(52)
f35=plot(t20,zzc1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
legend(f35,'intact')
hold on

figure(53)
f36=plot(t20,zzc2,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
legend(f36,'intact')
hold on

figure(54)
f37=plot(t20,zzc3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
legend(f37,'intact')
hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(3,3,1)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 intact')
legend([f1,f2,f3],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','southeast')

figure(65)
subplot(3,3,1)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 intact')
legend([f4,f5,f6],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','southeast')

figure(66)
subplot(3,3,1)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 intact')
legend([f7,f8,f9],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','southeast')

% C5-C6 

% 4n
aag1=ur1e-ur1g;
aag2=ur2e-ur2g;
aag3=ur3e-ur3g;

% 4p
aah1=ur1f-ur1h;
aah2=ur2f-ur2h;
aah3=ur3f-ur2h;

% 5n
aai1=ur1e5-ur1g5;
aai2=ur2e5-ur2g5;
aai3=ur3e5-ur3g5;

% 5p
aaj1=ur1f5-ur1h5;
aaj2=ur2f5-ur2h5;
aaj3=ur3f5-ur3h5;

% 6n
aak1=ur1e6-ur1g6;
aak2=ur2e6-ur2g6;
aak3=ur3e6-ur3g6;

% 6p
aal1=ur1f6-ur1h6;
aal2=ur2f6-ur2h6;
aal3=ur3f6-ur3h6;

% join data

%4n4p
t5;
zzd1=[flip(aag1(2:21)),aah1];
zzd2=[flip(aag2(2:21)),aah2];
zzd3=[flip(aag3(2:21)),aah3];

%5n5p
t6;
zze1=[flip(aai1(2:21)),aaj1];
zze2=[flip(aai2(2:21)),aaj2];
zze3=[flip(aai3(2:21)),aaj3];

%6n6p
t21;
zzf1=[flip(aak1(2:21)),aal1];
zzf2=[flip(aak2(2:21)),aal2];
zzf3=[flip(aak3(2:21)),aal3];

% plot data
% 4n4p
figure(55)
f38=plot(t5,zzd1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend(f38,'intact')
hold on

figure(56)
f39=plot(t5,zzd2,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend(f39,'intact')
hold on

figure(57)
f40=plot(t5,zzd3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend(f40,'intact')
hold on

% 5n5p
figure(58)
f41=plot(t6,zze1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend(f41,'intact')
hold on

figure(59)
f42=plot(t6,zze2,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend(f42,'intact')
hold on

figure(60)
f43=plot(t6,zze3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')
legend(f43,'intact')
hold on

%6n6p
figure(61)
f44=plot(t21,zzf1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
legend(f44,'intact')
hold on

figure(62)
f45=plot(t21,zzf2,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
legend(f45,'intact')
hold on

figure(63)
f46=plot(t21,zzf3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
legend(f46,'intact')
hold on

% plot ROM data with coupled motion

figure(67)
subplot(3,3,1)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion/Extension ROM C5-C6 intact')
legend([f10,f11,f12],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')


figure(68)
subplot(3,3,1)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 intact')
legend([f13,f14,f15],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(69)
subplot(3,3,1)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 intact')
legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% c3-c7

%4n
aam1=ur1a-ur1i;
aam2=ur2a-ur2i;
aam3=ur3a-ur3i;

%4p
aan1=ur1b-ur1j;
aan2=ur2b-ur2j;
aan3=ur3b-ur3j;

%5n
aao1=ur1a5-ur1i5;
aao2=ur2a5-ur2i5;
aao3=ur3a5-ur3i5;

%5p
aap1=ur1b5-ur1j5;
aap2=ur2b5-ur2j5;
aap3=ur3b5-ur3j5;

%6n
aaq1=ur1a6-ur1j6;
aaq2=ur2a6-ur2j6;
aaq3=ur3a6-ur3j6;

%6p
aar1=ur1b6-ur1i6;
aar2=ur2b6-ur2i6;
aar3=ur3b6-ur3i6;

%join data

%4n4p
t1;
zzg1=[flip(aam1(2:21)),aan1];
zzg2=[flip(aam2(2:21)),aan2];
zzg3=[flip(aam3(2:21)),aan3];

%5n5p
t2;
zzh1=[flip(aao1(2:21)),aap1];
zzh2=[flip(aao2(2:21)),aap2];
zzh3=[flip(aao3(2:21)),aap3];

%6n6p
tab6;
zzi1=[flip(aaq1(2:21)),aar1];
zzi2=[flip(aaq2(2:21)),aar2];
zzi3=[flip(aaq3(2:21)),aar3];

% plot data
figure(70)
f47=plot(t1,zzg1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend(f47,'intact')
hold on

figure(71)
f48=plot(t1,zzg2,'k');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend(f48,'intact')
hold on

figure(72)
f49=plot(t1,zzg3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend(f49,'intact')
hold on

figure(73)
f50=plot(t2,zzh1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend(f50,'intact')
hold on

figure(74)
f51=plot(t2,zzh2,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend(f51,'intact')
hold on

figure(75)
f52=plot(t2,zzh3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative about z-axis under lateral bending (5n5p)')
legend(f52,'intact')
hold on

figure(76)
f53=plot(tab6,zzi1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative about x-axis under axial rotation (6n6p)')
legend(f53,'intact')
hold on

figure(77)
f54=plot(tab6,zzi2,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative about y-axis under axial rotation (6n6p)')
legend(f54,'intact')
hold on

figure(78)
f55=plot(tab6,zzi3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative about z-axis under axial rotation (6n6p)')
legend(f55,'intact')
hold on

% plot data with coupled rotation

figure(79)
subplot(3,3,1)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion/Extension ROM C3-C7 intact')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(3,3,1)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 intact')
legend([f23,f24,f25],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(81)
subplot(3,3,1)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 intact')
legend([f26,f27,f28],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')
%% model 1
% c4-c5 
run('model1_slideslide_tether_ROM.m')
%4n
aaa1=ur1c-ur1e;
aaa2=ur2c-ur2e;
aaa3=ur3c-ur3e;

%4p
aab1=ur1d-ur1f;
aab2=ur2d-ur2f;
aab3=ur3d-ur3f;

%5n
aac1=ur1c5-ur1e5;
aac2=ur2c5-ur2e5;
aac3=ur3c5-ur3e5;

%5p
aad1=ur1d5-ur1f5;
aad2=ur2d5-ur2f5;
aad3=ur3d5-ur3f5;

%6n
aae1=ur1c6-ur1e6;
aae2=ur2c6-ur2e6;
aae3=ur3c6-ur3e6;

%6p
aaf1=ur1d6-ur1f6;
aaf2=ur2d6-ur2f6;
aaf3=ur3d6-ur3f6;

% join data
%4n4p
t3;
zza1=[flip(aaa1(2:21)),aab1];
zza2=[flip(aaa2(2:21)),aab2];
zza3=[flip(aaa3(2:21)),aab3];

%5n5p
t4;
zzb1=[flip(aac1(2:21)),aad1];
zzb2=[flip(aac2(2:21)),aad2];
zzb3=[flip(aac3(2:21)),aad3];

%6n6p
t20;
zzc1=[flip(aae1(2:21)),aaf1];
zzc2=[flip(aae2(2:21)),aaf2];
zzc3=[flip(aae3(2:21)),aaf3];

% plot data

%4n4p
figure(46)
f56=plot(t3,zza1,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during flexion/extension (4n4p)')
legend([f29,f56],'intact','model 1')
hold on

figure(47)
f64=plot(t3,zza2,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')
legend([f30,f64],'intact','model 1')
hold on

figure(48)
f72=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')
legend([f31,f72],'intact','model 1')
hold on

%5n5p
figure(49)
f80=plot(t4,zzb1,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')
legend([f32,f80],'intact','model 1')
hold on

figure(50)
f87=plot(t4,zzb2,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')
legend([f33,f87],'intact','model 1')
hold on

figure(51)
f95=plot(t4,zzb3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')
legend([f34,f95],'intact','model 1')
hold on


%6n6p
figure(52)
f103=plot(t20,zzc1,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
legend([f35,f103],'intact','model 1')
hold on

figure(53)
f111=plot(t20,zzc2,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
legend([f36,f111],'intact','model 1')
hold on

figure(54)
f119=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
legend([f37,f119],'intact','model 1')
hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(3,3,2)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 model 1')
legend([f1,f2,f3],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','southeast')

figure(65)
subplot(3,3,2)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 model 1')
legend([f4,f5,f6],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','southeast')

figure(66)
subplot(3,3,2)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 model 1')
legend([f7,f8,f9],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','southeast')

% C5-C6 

% 4n
aag1=ur1e-ur1g;
aag2=ur2e-ur2g;
aag3=ur3e-ur3g;

% 4p
aah1=ur1f-ur1h;
aah2=ur2f-ur2h;
aah3=ur3f-ur2h;

% 5n
aai1=ur1e5-ur1g5;
aai2=ur2e5-ur2g5;
aai3=ur3e5-ur3g5;

% 5p
aaj1=ur1f5-ur1h5;
aaj2=ur2f5-ur2h5;
aaj3=ur3f5-ur3h5;

% 6n
aak1=ur1e6-ur1g6;
aak2=ur2e6-ur2g6;
aak3=ur3e6-ur3g6;

% 6p
aal1=ur1f6-ur1h6;
aal2=ur2f6-ur2h6;
aal3=ur3f6-ur3h6;

% join data

%4n4p
t5;
zzd1=[flip(aag1(2:21)),aah1];
zzd2=[flip(aag2(2:21)),aah2];
zzd3=[flip(aag3(2:21)),aah3];

%5n5p
t6;
zze1=[flip(aai1(2:21)),aaj1];
zze2=[flip(aai2(2:21)),aaj2];
zze3=[flip(aai3(2:21)),aaj3];

%6n6p
t21;
zzf1=[flip(aak1(2:21)),aal1];
zzf2=[flip(aak2(2:21)),aal2];
zzf3=[flip(aak3(2:21)),aal3];

% plot data
% 4n4p
figure(55)
f127=plot(t5,zzd1,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f38,f127],'intact','model 1')
hold on

figure(56)
f137=plot(t5,zzd2,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f39,f137],'intact','model 1')
hold on

figure(57)
f145=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f40,f145],'intact','model 1')
hold on

% 5n5p
figure(58)
f153=plot(t6,zze1,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f41,f153],'intact','model 1')
hold on

figure(59)
f161=plot(t6,zze2,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f42,f161],'intact','model 1')
hold on

figure(60)
f169=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')
legend([f43,f169],'intact','model 1')
hold on

%6n6p
figure(61)
f177=plot(t21,zzf1,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
legend([f44,f177],'intact','model 1')
hold on

figure(62)
f185=plot(t21,zzf2,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
legend([f45,f185],'intact','model 1')
hold on

figure(63)
f193=plot(t21,zzf3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
legend([f46,f193],'intact','model 1')
hold on

% plot ROM data with coupled motion

figure(67)
subplot(3,3,2)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion/Extension ROM C5-C6 model 1')
legend([f10,f11,f12],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')


figure(68)
subplot(3,3,2)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 1')
legend([f13,f14,f15],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(69)
subplot(3,3,2)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 1')
legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% c3-c7

%4n
aam1=ur1a-ur1i;
aam2=ur2a-ur2i;
aam3=ur3a-ur3i;

%4p
aan1=ur1b-ur1j;
aan2=ur2b-ur2j;
aan3=ur3b-ur3j;

%5n
aao1=ur1a5-ur1i5;
aao2=ur2a5-ur2i5;
aao3=ur3a5-ur3i5;

%5p
aap1=ur1b5-ur1j5;
aap2=ur2b5-ur2j5;
aap3=ur3b5-ur3j5;

%6n
aaq1=ur1a6-ur1j6;
aaq2=ur2a6-ur2j6;
aaq3=ur3a6-ur3j6;

%6p
aar1=ur1b6-ur1i6;
aar2=ur2b6-ur2i6;
aar3=ur3b6-ur3i6;

%join data

%4n4p
t1;
zzg1=[flip(aam1(2:21)),aan1];
zzg2=[flip(aam2(2:21)),aan2];
zzg3=[flip(aam3(2:21)),aan3];

%5n5p
t2;
zzh1=[flip(aao1(2:21)),aap1];
zzh2=[flip(aao2(2:21)),aap2];
zzh3=[flip(aao3(2:21)),aap3];

%6n6p
tab6;
zzi1=[flip(aaq1(2:21)),aar1];
zzi2=[flip(aaq2(2:21)),aar2];
zzi3=[flip(aaq3(2:21)),aar3];

% plot data
figure(70)
f201=plot(t1,zzg1,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f47,f201],'intact','model 1')
hold on

figure(71)
f209=plot(t1,zzg2,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f48,f209],'intact','model 1')
hold on

figure(72)
f215=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f49,f215],'intact','model 1')
hold on

figure(73)
f223=plot(t2,zzh1,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f50,f223],'intact','model 1')
hold on

figure(74)
f231=plot(t2,zzh2,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f51,f231],'intact','model 1')
hold on

figure(75)
f239=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')
legend([f52,f239],'intact','model 1')
hold on

figure(76)
f257=plot(tab6,zzi1,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')
legend([f53,f257],'intact','model 1')
hold on

figure(77)
f265=plot(tab6,zzi2,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')
legend([f54,f265],'intact','model 1')
hold on

figure(78)
f273=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
legend([f55,f273],'intact','model 1')
hold on

% plot data with coupled rotation

figure(79)
subplot(3,3,2)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion/Extension ROM C3-C7 model 1')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(3,3,2)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 1')
legend([f23,f24,f25],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(81)
subplot(3,3,2)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 1')
legend([f26,f27,f28],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')
%% model 2
% c4-c5 
run('model2_slideslide_NoTether_ROM.m')
%4n
aaa1=ur1c-ur1e;
aaa2=ur2c-ur2e;
aaa3=ur3c-ur3e;

%4p
aab1=ur1d-ur1f;
aab2=ur2d-ur2f;
aab3=ur3d-ur3f;

%5n
aac1=ur1c5-ur1e5;
aac2=ur2c5-ur2e5;
aac3=ur3c5-ur3e5;

%5p
aad1=ur1d5-ur1f5;
aad2=ur2d5-ur2f5;
aad3=ur3d5-ur3f5;

%6n
aae1=ur1c6-ur1e6;
aae2=ur2c6-ur2e6;
aae3=ur3c6-ur3e6;

%6p
aaf1=ur1d6-ur1f6;
aaf2=ur2d6-ur2f6;
aaf3=ur3d6-ur3f6;

% join data
%4n4p
t3;
zza1=[flip(aaa1(2:21)),aab1];
zza2=[flip(aaa2(2:21)),aab2];
zza3=[flip(aaa3(2:21)),aab3];

%5n5p
t4;
zzb1=[flip(aac1(2:21)),aad1];
zzb2=[flip(aac2(2:21)),aad2];
zzb3=[flip(aac3(2:21)),aad3];

%6n6p
t20;
zzc1=[flip(aae1(2:21)),aaf1];
zzc2=[flip(aae2(2:21)),aaf2];
zzc3=[flip(aae3(2:21)),aaf3];

% plot data

%4n4p
figure(46)
f57=plot(t3,zza1,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during flexion/extension (4n4p)')
legend([f29,f56,f57],'intact','model 1','model 2')
hold on

figure(47)
f65=plot(t3,zza2,'g');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')
legend([f30,f64,f65],'intact','model 1','model 2')
hold on

figure(48)
f73=plot(t3,zza3,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')
legend([f31,f72,f73],'intact','model 1','model 2')
hold on

%5n5p
figure(49)
f81=plot(t4,zzb1,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')
legend([f32,f80,f81],'intact','model 1','model 2')
hold on

figure(50)
f88=plot(t4,zzb2,'g');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p')
legend([f33,f87,f88],'intact','model 1','model 2')
hold on

figure(51)
f96=plot(t4,zzb3,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')
legend([f34,f95,f96],'intact','model 1','model 2')
hold on


%6n6p
figure(52)
f104=plot(t20,zzc1,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
legend([f35,f103,f104],'intact','model 1','model 2')
hold on

figure(53)
f112=plot(t20,zzc2,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
legend([f36,f111,f112],'intact','model 1','model 2')
hold on

figure(54)
f120=plot(t20,zzc3,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
legend([f37,f119,f120],'intact','model 1','model 2')
hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(3,3,3)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 model 2')
legend([f1,f2,f3],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','southeast')

figure(65)
subplot(3,3,3)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 model 2')
legend([f4,f5,f6],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','southeast')

figure(66)
subplot(3,3,3)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 model 2')
legend([f7,f8,f9],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','southeast')

% C5-C6 

% 4n
aag1=ur1e-ur1g;
aag2=ur2e-ur2g;
aag3=ur3e-ur3g;

% 4p
aah1=ur1f-ur1h;
aah2=ur2f-ur2h;
aah3=ur3f-ur2h;

% 5n
aai1=ur1e5-ur1g5;
aai2=ur2e5-ur2g5;
aai3=ur3e5-ur3g5;

% 5p
aaj1=ur1f5-ur1h5;
aaj2=ur2f5-ur2h5;
aaj3=ur3f5-ur3h5;

% 6n
aak1=ur1e6-ur1g6;
aak2=ur2e6-ur2g6;
aak3=ur3e6-ur3g6;

% 6p
aal1=ur1f6-ur1h6;
aal2=ur2f6-ur2h6;
aal3=ur3f6-ur3h6;

% join data

%4n4p
t5;
zzd1=[flip(aag1(2:21)),aah1];
zzd2=[flip(aag2(2:21)),aah2];
zzd3=[flip(aag3(2:21)),aah3];

%5n5p
t6;
zze1=[flip(aai1(2:21)),aaj1];
zze2=[flip(aai2(2:21)),aaj2];
zze3=[flip(aai3(2:21)),aaj3];

%6n6p
t21;
zzf1=[flip(aak1(2:21)),aal1];
zzf2=[flip(aak2(2:21)),aal2];
zzf3=[flip(aak3(2:21)),aal3];

% plot data
% 4n4p
figure(55)
f128=plot(t5,zzd1,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f38,f127,f128],'intact','model 1','model 2')
hold on

figure(56)
f138=plot(t5,zzd2,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f39,f137,f138],'intact','model 1','model 2')
hold on

figure(57)
f146=plot(t5,zzd3,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f40,f145,f146],'intact','model 1','model 2')
hold on

% 5n5p
figure(58)
f154=plot(t6,zze1,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f41,f153,f154],'intact','model 1','model 2')
hold on

figure(59)
f162=plot(t6,zze2,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f42,f161,f162],'intact','model 1','model 2')
hold on

figure(60)
f170=plot(t6,zze3,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')
legend([f43,f169,f170],'intact','model 1','model 2')
hold on

%6n6p
figure(61)
f178=plot(t21,zzf1,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
legend([f44,f177,f178],'intact','model 1','model 2')
hold on

figure(62)
f186=plot(t21,zzf2,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
legend([f45,f185,f186],'intact','model 1','model 2')
hold on

figure(63)
f194=plot(t21,zzf3,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
legend([f46,f193,f194],'intact','model 1','model 2')
hold on

% plot ROM data with coupled motion

figure(67)
subplot(3,3,3)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion/Extension ROM C5-C6 model 2')
legend([f10,f11,f12],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')


figure(68)
subplot(3,3,3)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 2')
legend([f13,f14,f15],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(69)
subplot(3,3,3)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 2')
legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% c3-c7

%4n
aam1=ur1a-ur1i;
aam2=ur2a-ur2i;
aam3=ur3a-ur3i;

%4p
aan1=ur1b-ur1j;
aan2=ur2b-ur2j;
aan3=ur3b-ur3j;

%5n
aao1=ur1a5-ur1i5;
aao2=ur2a5-ur2i5;
aao3=ur3a5-ur3i5;

%5p
aap1=ur1b5-ur1j5;
aap2=ur2b5-ur2j5;
aap3=ur3b5-ur3j5;

%6n
aaq1=ur1a6-ur1j6;
aaq2=ur2a6-ur2j6;
aaq3=ur3a6-ur3j6;

%6p
aar1=ur1b6-ur1i6;
aar2=ur2b6-ur2i6;
aar3=ur3b6-ur3i6;

%join data

%4n4p
t1;
zzg1=[flip(aam1(2:21)),aan1];
zzg2=[flip(aam2(2:21)),aan2];
zzg3=[flip(aam3(2:21)),aan3];

%5n5p
t2;
zzh1=[flip(aao1(2:21)),aap1];
zzh2=[flip(aao2(2:21)),aap2];
zzh3=[flip(aao3(2:21)),aap3];

%6n6p
tab6;
zzi1=[flip(aaq1(2:21)),aar1];
zzi2=[flip(aaq2(2:21)),aar2];
zzi3=[flip(aaq3(2:21)),aar3];

% plot data
figure(70)
f202=plot(t1,zzg1,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f47,f201,f202],'intact','model 1','model 2')
hold on

figure(71)
f210=plot(t1,zzg2,'g');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f48,f209,f210],'intact','model 1','model 2')
hold on

figure(72)
f216=plot(t1,zzg3,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f49,f215,f216],'intact','model 1','model 2')
hold on

figure(73)
f224=plot(t2,zzh1,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f50,f223,f224],'intact','model 1','model 2')
hold on

figure(74)
f232=plot(t2,zzh2,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f51,f231,f232],'intact','model 1','model 2')
hold on

figure(75)
f240=plot(t2,zzh3,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')
legend([f52,f239,f240],'intact','model 1','model 2')
hold on

figure(76)
f258=plot(tab6,zzi1,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')
legend([f53,f257,f258],'intact','model 1','model 2')
hold on

figure(77)
f266=plot(tab6,zzi2,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')
legend([f54,f265,f266],'intact','model 1','model 2')
hold on

figure(78)
f274=plot(tab6,zzi3,'g');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
legend([f55,f273,f274],'intact','model 1','model 2')
hold on

% plot data with coupled rotation

figure(79)
subplot(3,3,3)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion/Extension ROM C3-C7 model 2')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(3,3,3)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 2')
legend([f23,f24,f25],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(81)
subplot(3,3,3)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 2')
legend([f26,f27,f28],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')
%% model 3
% c4-c5 
run('model3_APslide_Tether_ROM.m')
%4n
aaa1=ur1c-ur1e;
aaa2=ur2c-ur2e;
aaa3=ur3c-ur3e;

%4p
aab1=ur1d-ur1f;
aab2=ur2d-ur2f;
aab3=ur3d-ur3f;

%5n
aac1=ur1c5-ur1e5;
aac2=ur2c5-ur2e5;
aac3=ur3c5-ur3e5;

%5p
aad1=ur1d5-ur1f5;
aad2=ur2d5-ur2f5;
aad3=ur3d5-ur3f5;

%6n
aae1=ur1c6-ur1e6;
aae2=ur2c6-ur2e6;
aae3=ur3c6-ur3e6;

%6p
aaf1=ur1d6-ur1f6;
aaf2=ur2d6-ur2f6;
aaf3=ur3d6-ur3f6;

% join data
%4n4p
t3;
zza1=[flip(aaa1(2:21)),aab1];
zza2=[flip(aaa2(2:21)),aab2];
zza3=[flip(aaa3(2:21)),aab3];

%5n5p
t4;
zzb1=[flip(aac1(2:21)),aad1];
zzb2=[flip(aac2(2:21)),aad2];
zzb3=[flip(aac3(2:21)),aad3];

%6n6p
t20;
zzc1=[flip(aae1(2:21)),aaf1];
zzc2=[flip(aae2(2:21)),aaf2];
zzc3=[flip(aae3(2:21)),aaf3];

% plot data

%4n4p
figure(46)
f58=plot(t3,zza1,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during flexion/extension (4n4p)')
legend([f29,f56,f57,f58],'intact','model 1','model 2','model 3')
hold on

figure(47)
f66=plot(t3,zza2,'b');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')
legend([f30,f64,f65,f66],'intact','model 1','model 2','model 3')
hold on

figure(48)
f74=plot(t3,zza3,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')
legend([f31,f72,f73,f74],'intact','model 1','model 2','model 3')
hold on

%5n5p
figure(49)
f82=plot(t4,zzb1,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')
legend([f32,f80,f81,f82],'intact','model 1','model 2','model 3')
hold on

figure(50)
f89=plot(t4,zzb2,'b');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')
legend([f33,f87,f88,f89],'intact','model 1','model 2','model 3')
hold on

figure(51)
f97=plot(t4,zzb3,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')
legend([f34,f95,f96,f97],'intact','model 1','model 2','model 3')
hold on


%6n6p
figure(52)
f105=plot(t20,zzc1,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
legend([f35,f103,f104,f105],'intact','model 1','model 2','model 3')
hold on

figure(53)
f113=plot(t20,zzc2,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
legend([f36,f111,f112,f113],'intact','model 1','model 2','model 3')
hold on

figure(54)
f121=plot(t20,zzc3,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
legend([f37,f119,f120,f121],'intact','model 1','model 2','model 3')
hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(3,3,4)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 model 3')
legend([f1,f2,f3],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','southeast')

figure(65)
subplot(3,3,4)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 model 3')
legend([f4,f5,f6],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','southeast')

figure(66)
subplot(3,3,4)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 model 3')
legend([f7,f8,f9],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','southeast')

% C5-C6 

% 4n
aag1=ur1e-ur1g;
aag2=ur2e-ur2g;
aag3=ur3e-ur3g;

% 4p
aah1=ur1f-ur1h;
aah2=ur2f-ur2h;
aah3=ur3f-ur2h;

% 5n
aai1=ur1e5-ur1g5;
aai2=ur2e5-ur2g5;
aai3=ur3e5-ur3g5;

% 5p
aaj1=ur1f5-ur1h5;
aaj2=ur2f5-ur2h5;
aaj3=ur3f5-ur3h5;

% 6n
aak1=ur1e6-ur1g6;
aak2=ur2e6-ur2g6;
aak3=ur3e6-ur3g6;

% 6p
aal1=ur1f6-ur1h6;
aal2=ur2f6-ur2h6;
aal3=ur3f6-ur3h6;

% join data

%4n4p
t5;
zzd1=[flip(aag1(2:21)),aah1];
zzd2=[flip(aag2(2:21)),aah2];
zzd3=[flip(aag3(2:21)),aah3];

%5n5p
t6;
zze1=[flip(aai1(2:21)),aaj1];
zze2=[flip(aai2(2:21)),aaj2];
zze3=[flip(aai3(2:21)),aaj3];

%6n6p
t21;
zzf1=[flip(aak1(2:21)),aal1];
zzf2=[flip(aak2(2:21)),aal2];
zzf3=[flip(aak3(2:21)),aal3];

% plot data
% 4n4p
figure(55)
f129=plot(t5,zzd1,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f38,f127,f128,f129],'intact','model 1','model 2','model 3')
hold on

figure(56)
f139=plot(t5,zzd2,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f39,f137,f138,f139],'intact','model 1','model 2','model 3')
hold on

figure(57)
f147=plot(t5,zzd3,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f40,f145,f146,f147],'intact','model 1','model 2','model 3')
hold on

% 5n5p
figure(58)
f155=plot(t6,zze1,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f41,f153,f154,f155],'intact','model 1','model 2','model 3')
hold on

figure(59)
f163=plot(t6,zze2,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f42,f161,f162,f163],'intact','model 1','model 2','model 3')
hold on

figure(60)
f171=plot(t6,zze3,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')
legend([f43,f169,f170,f171],'intact','model 1','model 2','model 3')
hold on

%6n6p
figure(61)
f179=plot(t21,zzf1,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
legend([f44,f177,f178,f179],'intact','model 1','model 2','model 3')
hold on

figure(62)
f187=plot(t21,zzf2,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
legend([f45,f185,f186,f187],'intact','model 1','model 2','model 3')
hold on

figure(63)
f195=plot(t21,zzf3,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
legend([f46,f193,f194,f195],'intact','model 1','model 2','model 3')
hold on

% plot ROM data with coupled motion

figure(67)
subplot(3,3,4)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C5-C6 model 3')
legend([f10,f11,f12],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')


figure(68)
subplot(3,3,4)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 3')
legend([f13,f14,f15],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(69)
subplot(3,3,4)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 3')
legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% c3-c7

%4n
aam1=ur1a-ur1i;
aam2=ur2a-ur2i;
aam3=ur3a-ur3i;

%4p
aan1=ur1b-ur1j;
aan2=ur2b-ur2j;
aan3=ur3b-ur3j;

%5n
aao1=ur1a5-ur1i5;
aao2=ur2a5-ur2i5;
aao3=ur3a5-ur3i5;

%5p
aap1=ur1b5-ur1j5;
aap2=ur2b5-ur2j5;
aap3=ur3b5-ur3j5;

%6n
aaq1=ur1a6-ur1j6;
aaq2=ur2a6-ur2j6;
aaq3=ur3a6-ur3j6;

%6p
aar1=ur1b6-ur1i6;
aar2=ur2b6-ur2i6;
aar3=ur3b6-ur3i6;

%join data

%4n4p
t1;
zzg1=[flip(aam1(2:21)),aan1];
zzg2=[flip(aam2(2:21)),aan2];
zzg3=[flip(aam3(2:21)),aan3];

%5n5p
t2;
zzh1=[flip(aao1(2:21)),aap1];
zzh2=[flip(aao2(2:21)),aap2];
zzh3=[flip(aao3(2:21)),aap3];

%6n6p
tab6;
zzi1=[flip(aaq1(2:21)),aar1];
zzi2=[flip(aaq2(2:21)),aar2];
zzi3=[flip(aaq3(2:21)),aar3];

% plot data
figure(70)
f203=plot(t1,zzg1,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f47,f201,f202,f203],'intact','model 1','model 2','model 3')
hold on

figure(71)
f211=plot(t1,zzg2,'b');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f48,f209,f210,f211],'intact','model 1','model 2','model 3')
hold on

figure(72)
f217=plot(t1,zzg3,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f49,f215,f216,f217],'intact','model 1','model 2','model 3')
hold on

figure(73)
f225=plot(t2,zzh1,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f50,f223,f224,f225],'intact','model 1','model 2','model 3')
hold on

figure(74)
f233=plot(t2,zzh2,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f51,f231,f232,f233],'intact','model 1','model 2','model 3')
hold on

figure(75)
f241=plot(t2,zzh3,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')
legend([f52,f239,f240,f241],'intact','model 1','model 2','model 3')
hold on

figure(76)
f259=plot(tab6,zzi1,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')
legend([f53,f257,f258,f259],'intact','model 1','model 2','model 3')
hold on

figure(77)
f267=plot(tab6,zzi2,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')
legend([f54,f265,f266,f267],'intact','model 1','model 2','model 3')
hold on

figure(78)
f275=plot(tab6,zzi3,'b');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
legend([f55,f273,f274,f275],'intact','model 1','model 2','model 3')
hold on

% plot data with coupled rotation

figure(79)
subplot(3,3,4)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C3-C7 model 3')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(3,3,4)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 3')
legend([f23,f24,f25],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(81)
subplot(3,3,4)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 3')
legend([f26,f27,f28],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')
%% model 4
% c4-c5 
run('model4_APslide_NoTether_ROM.m')
%4n
aaa1=ur1c-ur1e;
aaa2=ur2c-ur2e;
aaa3=ur3c-ur3e;

%4p
aab1=ur1d-ur1f;
aab2=ur2d-ur2f;
aab3=ur3d-ur3f;

%5n
aac1=ur1c5-ur1e5;
aac2=ur2c5-ur2e5;
aac3=ur3c5-ur3e5;

%5p
aad1=ur1d5-ur1f5;
aad2=ur2d5-ur2f5;
aad3=ur3d5-ur3f5;

%6n
aae1=ur1c6-ur1e6;
aae2=ur2c6-ur2e6;
aae3=ur3c6-ur3e6;

%6p
aaf1=ur1d6-ur1f6;
aaf2=ur2d6-ur2f6;
aaf3=ur3d6-ur3f6;

% join data
%4n4p
t3;
zza1=[flip(aaa1(2:21)),aab1];
zza2=[flip(aaa2(2:21)),aab2];
zza3=[flip(aaa3(2:21)),aab3];

%5n5p
t4;
zzb1=[flip(aac1(2:21)),aad1];
zzb2=[flip(aac2(2:21)),aad2];
zzb3=[flip(aac3(2:21)),aad3];

%6n6p
t20;
zzc1=[flip(aae1(2:21)),aaf1];
zzc2=[flip(aae2(2:21)),aaf2];
zzc3=[flip(aae3(2:21)),aaf3];

% plot data

%4n4p
figure(46)
f59=plot(t3,zza1,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during flexion/extension (4n4p)')
legend([f29,f56,f57,f58,f59],'intact','model 1','model 2','model 3','model 4')
hold on

figure(47)
f67=plot(t3,zza2,'c');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')
legend([f30,f64,f65,f66,f67],'intact','model 1','model 2','model 3','model 4')
hold on

figure(48)
f75=plot(t3,zza3,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')
legend([f31,f72,f73,f74,f75],'intact','model 1','model 2','model 3','model 4')
hold on

%5n5p
figure(49)
f83=plot(t4,zzb1,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')
legend([f32,f80,f81,f82,f83],'intact','model 1','model 2','model 3','model 4')
hold on

figure(50)
f90=plot(t4,zzb2,'c');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')
legend([f33,f87,f88,f89,f90],'intact','model 1','model 2','model 3','model 4')
hold on

figure(51)
f98=plot(t4,zzb3,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')
legend([f34,f95,f96,f97,f98],'intact','model 1','model 2','model 3','model 4')
hold on


%6n6p
figure(52)
f106=plot(t20,zzc1,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
legend([f35,f103,f104,f105,f106],'intact','model 1','model 2','model 3','model 4')
hold on

figure(53)
f114=plot(t20,zzc2,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
legend([f36,f111,f112,f113,f114],'intact','model 1','model 2','model 3','model 4')
hold on

figure(54)
f122=plot(t20,zzc3,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
legend([f37,f119,f120,f121,f122],'intact','model 1','model 2','model 3','model 4')
hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(3,3,5)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 model 4')
legend([f1,f2,f3],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','southeast')

figure(65)
subplot(3,3,5)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 model 4')
legend([f4,f5,f6],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','southeast')

figure(66)
subplot(3,3,5)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 model 4')
legend([f7,f8,f9],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','southeast')

% C5-C6 

% 4n
aag1=ur1e-ur1g;
aag2=ur2e-ur2g;
aag3=ur3e-ur3g;

% 4p
aah1=ur1f-ur1h;
aah2=ur2f-ur2h;
aah3=ur3f-ur2h;

% 5n
aai1=ur1e5-ur1g5;
aai2=ur2e5-ur2g5;
aai3=ur3e5-ur3g5;

% 5p
aaj1=ur1f5-ur1h5;
aaj2=ur2f5-ur2h5;
aaj3=ur3f5-ur3h5;

% 6n
aak1=ur1e6-ur1g6;
aak2=ur2e6-ur2g6;
aak3=ur3e6-ur3g6;

% 6p
aal1=ur1f6-ur1h6;
aal2=ur2f6-ur2h6;
aal3=ur3f6-ur3h6;

% join data

%4n4p
t5;
zzd1=[flip(aag1(2:21)),aah1];
zzd2=[flip(aag2(2:21)),aah2];
zzd3=[flip(aag3(2:21)),aah3];

%5n5p
t6;
zze1=[flip(aai1(2:21)),aaj1];
zze2=[flip(aai2(2:21)),aaj2];
zze3=[flip(aai3(2:21)),aaj3];

%6n6p
t21;
zzf1=[flip(aak1(2:21)),aal1];
zzf2=[flip(aak2(2:21)),aal2];
zzf3=[flip(aak3(2:21)),aal3];

% plot data
% 4n4p
figure(55)
f130=plot(t5,zzd1,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f38,f127,f128,f129,f130],'intact','model 1','model 2','model 3','model 4')
hold on

figure(56)
f140=plot(t5,zzd2,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f39,f137,f138,f139,f140],'intact','model 1','model 2','model 3','model 4')
hold on

figure(57)
f148=plot(t5,zzd3,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f40,f145,f146,f147,f148],'intact','model 1','model 2','model 3','model 4')
hold on

% 5n5p
figure(58)
f156=plot(t6,zze1,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f41,f153,f154,f155,f156],'intact','model 1','model 2','model 3','model 4')
hold on

figure(59)
f164=plot(t6,zze2,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f42,f161,f162,f163,f164],'intact','model 1','model 2','model 3','model 4')
hold on

figure(60)
f172=plot(t6,zze3,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')
legend([f43,f169,f170,f171,f172],'intact','model 1','model 2','model 3','model 4')
hold on

%6n6p
figure(61)
f180=plot(t21,zzf1,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
legend([f44,f177,f178,f179,f180],'intact','model 1','model 2','model 3','model 4')
hold on

figure(62)
f188=plot(t21,zzf2,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
legend([f45,f185,f186,f187,f188],'intact','model 1','model 2','model 3','model 4')
hold on

figure(63)
f196=plot(t21,zzf3,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
legend([f46,f193,f194,f195,f196],'intact','model 1','model 2','model 3','model 4')
hold on

% plot ROM data with coupled motion

figure(67)
subplot(3,3,5)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C5-C6 model 4')
legend([f10,f11,f12],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')


figure(68)
subplot(3,3,5)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 4')
legend([f13,f14,f15],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(69)
subplot(3,3,5)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 4')
legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% c3-c7

%4n
aam1=ur1a-ur1i;
aam2=ur2a-ur2i;
aam3=ur3a-ur3i;

%4p
aan1=ur1b-ur1j;
aan2=ur2b-ur2j;
aan3=ur3b-ur3j;

%5n
aao1=ur1a5-ur1i5;
aao2=ur2a5-ur2i5;
aao3=ur3a5-ur3i5;

%5p
aap1=ur1b5-ur1j5;
aap2=ur2b5-ur2j5;
aap3=ur3b5-ur3j5;

%6n
aaq1=ur1a6-ur1j6;
aaq2=ur2a6-ur2j6;
aaq3=ur3a6-ur3j6;

%6p
aar1=ur1b6-ur1i6;
aar2=ur2b6-ur2i6;
aar3=ur3b6-ur3i6;

%join data

%4n4p
t1;
zzg1=[flip(aam1(2:21)),aan1];
zzg2=[flip(aam2(2:21)),aan2];
zzg3=[flip(aam3(2:21)),aan3];

%5n5p
t2;
zzh1=[flip(aao1(2:21)),aap1];
zzh2=[flip(aao2(2:21)),aap2];
zzh3=[flip(aao3(2:21)),aap3];

%6n6p
tab6;
zzi1=[flip(aaq1(2:21)),aar1];
zzi2=[flip(aaq2(2:21)),aar2];
zzi3=[flip(aaq3(2:21)),aar3];

% plot data
figure(70)
f204=plot(t1,zzg1,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f47,f201,f202,f203,f204],'intact','model 1','model 2','model 3','model 4')
hold on

figure(71)
f212=plot(t1,zzg2,'c');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f48,f209,f210,f211,f212],'intact','model 1','model 2','model 3','model 4')
hold on

figure(72)
f218=plot(t1,zzg3,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f49,f215,f216,f217,f218],'intact','model 1','model 2','model 3','model 4')
hold on

figure(73)
f226=plot(t2,zzh1,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f50,f223,f224,f225,f226],'intact','model 1','model 2','model 3','model 4')
hold on

figure(74)
f234=plot(t2,zzh2,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f51,f231,f232,f233,f234],'intact','model 1','model 2','model 3','model 4')
hold on

figure(75)
f242=plot(t2,zzh3,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')
legend([f52,f239,f240,f241,f242],'intact','model 1','model 2','model 3','model 4')
hold on

figure(76)
f260=plot(tab6,zzi1,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')
legend([f53,f257,f258,f259,f260],'intact','model 1','model 2','model 3','model 4')
hold on

figure(77)
f268=plot(tab6,zzi2,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')
legend([f54,f265,f266,f267,f268],'intact','model 1','model 2','model 3','model 4')
hold on

figure(78)
f276=plot(tab6,zzi3,'c');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
legend([f55,f273,f274,f275,f276],'intact','model 1','model 2','model 3','model 4')
hold on

% plot data with coupled rotation

figure(79)
subplot(3,3,5)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C3-C7 model 4')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(3,3,5)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 4')
legend([f23,f24,f25],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(81)
subplot(3,3,5)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 4')
legend([f26,f27,f28],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')
%% model 5
% c4-c5 
run('model5_LatSlide_Tether_ROM.m')
%4n
aaa1=ur1c-ur1e;
aaa2=ur2c-ur2e;
aaa3=ur3c-ur3e;

%4p
aab1=ur1d-ur1f;
aab2=ur2d-ur2f;
aab3=ur3d-ur3f;

%5n
aac1=ur1c5-ur1e5;
aac2=ur2c5-ur2e5;
aac3=ur3c5-ur3e5;

%5p
aad1=ur1d5-ur1f5;
aad2=ur2d5-ur2f5;
aad3=ur3d5-ur3f5;

%6n
aae1=ur1c6-ur1e6;
aae2=ur2c6-ur2e6;
aae3=ur3c6-ur3e6;

%6p
aaf1=ur1d6-ur1f6;
aaf2=ur2d6-ur2f6;
aaf3=ur3d6-ur3f6;

% join data
%4n4p
t3;
zza1=[flip(aaa1(2:21)),aab1];
zza2=[flip(aaa2(2:21)),aab2];
zza3=[flip(aaa3(2:21)),aab3];

%5n5p
t4;
zzb1=[flip(aac1(2:21)),aad1];
zzb2=[flip(aac2(2:21)),aad2];
zzb3=[flip(aac3(2:21)),aad3];

%6n6p
t20;
zzc1=[flip(aae1(2:21)),aaf1];
zzc2=[flip(aae2(2:21)),aaf2];
zzc3=[flip(aae3(2:21)),aaf3];

% plot data

%4n4p
figure(46)
f60=plot(t3,zza1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during flexion/extension (4n4p)')
legend([f29,f56,f57,f58,f59,f60],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(47)
f68=plot(t3,zza2,'m');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')
legend([f30,f64,f65,f66,f67,f68],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(48)
f76=plot(t3,zza3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')
legend([f31,f72,f73,f74,f75,f76],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

%5n5p
figure(49)
f84=plot(t4,zzb1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')
legend([f32,f80,f81,f82,f83,f84],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(50)
f91=plot(t4,zzb2,'m');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')
legend([f33,f87,f88,f89,f90,f91],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(51)
f99=plot(t4,zzb3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')
legend([f34,f95,f96,f97,f98,f99],'intact','model 1','model 2','model 3','model 4','model 5')
hold on


%6n6p
figure(52)
f107=plot(t20,zzc1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
legend([f35,f103,f104,f105,f106,f107],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(53)
f115=plot(t20,zzc2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
legend([f36,f111,f112,f113,f114,f115],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(54)
f123=plot(t20,zzc3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
legend([f37,f119,f120,f121,f122,f123],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(3,3,6)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 model 5')
legend([f1,f2,f3],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','southeast')

figure(65)
subplot(3,3,6)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 model 5')
legend([f4,f5,f6],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','southeast')

figure(66)
subplot(3,3,6)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 model 5')
legend([f7,f8,f9],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','southeast')

% C5-C6 

% 4n
aag1=ur1e-ur1g;
aag2=ur2e-ur2g;
aag3=ur3e-ur3g;

% 4p
aah1=ur1f-ur1h;
aah2=ur2f-ur2h;
aah3=ur3f-ur2h;

% 5n
aai1=ur1e5-ur1g5;
aai2=ur2e5-ur2g5;
aai3=ur3e5-ur3g5;

% 5p
aaj1=ur1f5-ur1h5;
aaj2=ur2f5-ur2h5;
aaj3=ur3f5-ur3h5;

% 6n
aak1=ur1e6-ur1g6;
aak2=ur2e6-ur2g6;
aak3=ur3e6-ur3g6;

% 6p
aal1=ur1f6-ur1h6;
aal2=ur2f6-ur2h6;
aal3=ur3f6-ur3h6;

% join data

%4n4p
t5;
zzd1=[flip(aag1(2:21)),aah1];
zzd2=[flip(aag2(2:21)),aah2];
zzd3=[flip(aag3(2:21)),aah3];

%5n5p
t6;
zze1=[flip(aai1(2:21)),aaj1];
zze2=[flip(aai2(2:21)),aaj2];
zze3=[flip(aai3(2:21)),aaj3];

%6n6p
t21;
zzf1=[flip(aak1(2:21)),aal1];
zzf2=[flip(aak2(2:21)),aal2];
zzf3=[flip(aak3(2:21)),aal3];

% plot data
% 4n4p
figure(55)
f131=plot(t5,zzd1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f38,f127,f128,f129,f130,f131],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(56)
f141=plot(t5,zzd2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f39,f137,f138,f139,f140,f141],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(57)
f149=plot(t5,zzd3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f40,f145,f146,f147,f148,f149],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

% 5n5p
figure(58)
f157=plot(t6,zze1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f41,f153,f154,f155,f156,f157],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(59)
f165=plot(t6,zze2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f42,f161,f162,f163,f164,f165],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(60)
f173=plot(t6,zze3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')
legend([f43,f169,f170,f171,f172,f173],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

%6n6p
figure(61)
f181=plot(t21,zzf1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
legend([f44,f177,f178,f179,f180,f181],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(62)
f189=plot(t21,zzf2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
legend([f45,f185,f186,f187,f188,f189],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(63)
f197=plot(t21,zzf3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
legend([f46,f193,f194,f195,f196,f197],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

% plot ROM data with coupled motion

figure(67)
subplot(3,3,6)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C5-C6 model 5')
legend([f10,f11,f12],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')


figure(68)
subplot(3,3,6)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 5')
legend([f13,f14,f15],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(69)
subplot(3,3,6)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
hold on
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 5')
legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% c3-c7

%4n
aam1=ur1a-ur1i;
aam2=ur2a-ur2i;
aam3=ur3a-ur3i;

%4p
aan1=ur1b-ur1j;
aan2=ur2b-ur2j;
aan3=ur3b-ur3j;

%5n
aao1=ur1a5-ur1i5;
aao2=ur2a5-ur2i5;
aao3=ur3a5-ur3i5;

%5p
aap1=ur1b5-ur1j5;
aap2=ur2b5-ur2j5;
aap3=ur3b5-ur3j5;

%6n
aaq1=ur1a6-ur1j6;
aaq2=ur2a6-ur2j6;
aaq3=ur3a6-ur3j6;

%6p
aar1=ur1b6-ur1i6;
aar2=ur2b6-ur2i6;
aar3=ur3b6-ur3i6;

%join data

%4n4p
t1;
zzg1=[flip(aam1(2:21)),aan1];
zzg2=[flip(aam2(2:21)),aan2];
zzg3=[flip(aam3(2:21)),aan3];

%5n5p
t2;
zzh1=[flip(aao1(2:21)),aap1];
zzh2=[flip(aao2(2:21)),aap2];
zzh3=[flip(aao3(2:21)),aap3];

%6n6p
tab6;
zzi1=[flip(aaq1(2:21)),aar1];
zzi2=[flip(aaq2(2:21)),aar2];
zzi3=[flip(aaq3(2:21)),aar3];

% plot data
figure(70)
f205=plot(t1,zzg1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f47,f201,f202,f203,f204,f205],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(71)
f213=plot(t1,zzg2,'m');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f48,f209,f210,f211,f212,f213],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(72)
f219=plot(t1,zzg3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f49,f215,f216,f217,f218,f219],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(73)
f227=plot(t2,zzh1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f50,f223,f224,f225,f226,f227],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(74)
f235=plot(t2,zzh2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f51,f231,f232,f233,f234,f235],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(75)
f243=plot(t2,zzh3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')
legend([f52,f239,f240,f241,f242,f243],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(76)
f261=plot(tab6,zzi1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')
legend([f53,f257,f258,f259,f260,f261],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(77)
f269=plot(tab6,zzi2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')
legend([f54,f265,f266,f267,f268,f269],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

figure(78)
f277=plot(tab6,zzi3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
legend([f55,f273,f274,f275,f276,f277],'intact','model 1','model 2','model 3','model 4','model 5')
hold on

% plot data with coupled rotation

figure(79)
subplot(3,3,6)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C3-C7 model 5')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(3,3,6)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 5')
legend([f23,f24,f25],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(81)
subplot(3,3,6)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 5')
legend([f26,f27,f28],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')
%% model 6
% c4-c5 
run('model6_LatSlide_NoTether_ROM.m')

%4n
aaa1=ur1c-ur1e;
aaa2=ur2c-ur2e;
aaa3=ur3c-ur3e;

%4p
aab1=ur1d-ur1f;
aab2=ur2d-ur2f;
aab3=ur3d-ur3f;

%5n
aac1=ur1c5-ur1e5;
aac2=ur2c5-ur2e5;
aac3=ur3c5-ur3e5;

%5p
aad1=ur1d5-ur1f5;
aad2=ur2d5-ur2f5;
aad3=ur3d5-ur3f5;

%6n
aae1=ur1c6-ur1e6;
aae2=ur2c6-ur2e6;
aae3=ur3c6-ur3e6;

%6p
aaf1=ur1d6-ur1f6;
aaf2=ur2d6-ur2f6;
aaf3=ur3d6-ur3f6;

% join data
%4n4p
t3;
zza1=[flip(aaa1(2:21)),aab1];
zza2=[flip(aaa2(2:21)),aab2];
zza3=[flip(aaa3(2:21)),aab3];

%5n5p
t4;
zzb1=[flip(aac1(2:21)),aad1];
zzb2=[flip(aac2(2:21)),aad2];
zzb3=[flip(aac3(2:21)),aad3];

%6n6p
t20;
zzc1=[flip(aae1(2:21)),aaf1];
zzc2=[flip(aae2(2:21)),aaf2];
zzc3=[flip(aae3(2:21)),aaf3];



% plot data

%4n4p
figure(46)
f61=plot(t3,zza1,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during flexion/extension (4n4p)')
legend([f29,f56,f57,f58,f59,f60,f61],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(47)
f69=plot(t3,zza2,'y');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')
legend([f30,f64,f65,f66,f67,f68,f69],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(48)
f77=plot(t3,zza3,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')
legend([f31,f72,f73,f74,f75,f76,f77],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

%5n5p
figure(49)
f85=plot(t4,zzb1,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')
legend([f32,f80,f81,f82,f83,f84,f85],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(50)
f92=plot(t4,zzb2,'y');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p')
legend([f33,f87,f88,f89,f90,f91,f92],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(51)
f100=plot(t4,zzb3,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')
legend([f34,f95,f96,f97,f98,f99,f100],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on


%6n6p
figure(52)
f108=plot(t20,zzc1,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
legend([f35,f103,f104,f105,f106,f107,f108],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(53)
f116=plot(t20,zzc2,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
legend([f36,f111,f112,f113,f114,f115,f116],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(54)
f124=plot(t20,zzc3,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
legend([f37,f119,f120,f121,f122,f123,f124],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(3,3,7)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 model 6')
legend([f1,f2,f3],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','southeast')

figure(65)
subplot(3,3,7)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 model 6')
legend([f4,f5,f6],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','southeast')

figure(66)
subplot(3,3,7)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 model 6')
legend([f7,f8,f9],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% C5-C6 

% 4n
aag1=ur1e-ur1g;
aag2=ur2e-ur2g;
aag3=ur3e-ur3g;

% 4p
aah1=ur1f-ur1h;
aah2=ur2f-ur2h;
aah3=ur3f-ur2h;

% 5n
aai1=ur1e5-ur1g5;
aai2=ur2e5-ur2g5;
aai3=ur3e5-ur3g5;

% 5p
aaj1=ur1f5-ur1h5;
aaj2=ur2f5-ur2h5;
aaj3=ur3f5-ur3h5;

% 6n
aak1=ur1e6-ur1g6;
aak2=ur2e6-ur2g6;
aak3=ur3e6-ur3g6;

% 6p
aal1=ur1f6-ur1h6;
aal2=ur2f6-ur2h6;
aal3=ur3f6-ur3h6;

% join data

%4n4p
t5;
zzd1=[flip(aag1(2:21)),aah1];
zzd2=[flip(aag2(2:21)),aah2];
zzd3=[flip(aag3(2:21)),aah3];

%5n5p
t6;
zze1=[flip(aai1(2:21)),aaj1];
zze2=[flip(aai2(2:21)),aaj2];
zze3=[flip(aai3(2:21)),aaj3];

%6n6p
t21;
zzf1=[flip(aak1(2:21)),aal1];
zzf2=[flip(aak2(2:21)),aal2];
zzf3=[flip(aak3(2:21)),aal3];

% plot data
% 4n4p
figure(55)
f132=plot(t5,zzd1,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f38,f127,f128,f129,f130,f131,f132],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(56)
f142=plot(t5,zzd2,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f39,f137,f138,f139,f140,f141,f142],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(57)
f150=plot(t5,zzd3,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f40,f145,f146,f147,f148,f149,f150],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

% 5n5p
figure(58)
f158=plot(t6,zze1,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f41,f153,f154,f155,f156,f157,f158],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(59)
f166=plot(t6,zze2,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f42,f161,f162,f163,f164,f165,f166],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(60)
f174=plot(t6,zze3,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')
legend([f43,f169,f170,f171,f172,f173,f174],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

%6n6p
figure(61)
f182=plot(t21,zzf1,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
legend([f44,f177,f178,f179,f180,f181,f182],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(62)
f190=plot(t21,zzf2,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
legend([f45,f185,f186,f187,f188,f189,f190],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(63)
f198=plot(t21,zzf3,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
legend([f46,f193,f194,f195,f196,f197,f198],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

% plot ROM data with coupled motion

figure(67)
subplot(3,3,7)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C5-C6 model 6')
legend([f10,f11,f12],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')


figure(68)
subplot(3,3,7)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 6')
legend([f13,f14,f15],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(69)
subplot(3,3,7)
f16=plot(t21,zzf1,'g','LineWidth',3);
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 6')
legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% c3-c7

%4n
aam1=ur1a-ur1i;
aam2=ur2a-ur2i;
aam3=ur3a-ur3i;

%4p
aan1=ur1b-ur1j;
aan2=ur2b-ur2j;
aan3=ur3b-ur3j;

%5n
aao1=ur1a5-ur1i5;
aao2=ur2a5-ur2i5;
aao3=ur3a5-ur3i5;

%5p
aap1=ur1b5-ur1j5;
aap2=ur2b5-ur2j5;
aap3=ur3b5-ur3j5;

%6n
aaq1=ur1a6-ur1j6;
aaq2=ur2a6-ur2j6;
aaq3=ur3a6-ur3j6;

%6p
aar1=ur1b6-ur1i6;
aar2=ur2b6-ur2i6;
aar3=ur3b6-ur3i6;

%join data

%4n4p
t1;
zzg1=[flip(aam1(2:21)),aan1];
zzg2=[flip(aam2(2:21)),aan2];
zzg3=[flip(aam3(2:21)),aan3];

%5n5p
t2;
zzh1=[flip(aao1(2:21)),aap1];
zzh2=[flip(aao2(2:21)),aap2];
zzh3=[flip(aao3(2:21)),aap3];

%6n6p
tab6;
zzi1=[flip(aaq1(2:21)),aar1];
zzi2=[flip(aaq2(2:21)),aar2];
zzi3=[flip(aaq3(2:21)),aar3];

% plot data
figure(70)
f206=plot(t1,zzg1,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f47,f201,f202,f203,f204,f205,f206],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(71)
f214=plot(t1,zzg2,'y');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f48,f209,f210,f211,f212,f213,f214],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(72)
f220=plot(t1,zzg3,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f49,f215,f216,f217,f218,f219,f220],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(73)
f228=plot(t2,zzh1,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f50,f223,f224,f225,f226,f227,f228],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(74)
f236=plot(t2,zzh2,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f51,f231,f232,f233,f234,f235,f236],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(75)
f244=plot(t2,zzh3,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')
legend([f52,f239,f240,f241,f242,f243,f244],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(76)
f262=plot(tab6,zzi1,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')
legend([f53,f257,f258,f259,f260,f261,f262],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(77)
f270=plot(tab6,zzi2,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')
legend([f54,f265,f266,f267,f268,f269,f270],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

figure(78)
f278=plot(tab6,zzi3,'y');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
legend([f55,f273,f274,f275,f276,f277,f278],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
hold on

% plot data with coupled rotation

figure(79)
subplot(3,3,7)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C3-C7 model 6')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(3,3,7)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 6')
legend([f23,f24,f25],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(81)
subplot(3,3,7)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 6')
legend([f26,f27,f28],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %test models
% % first model
% %6n
% %c4
% abc1=(180/pi)*[-0.0602615 -0.020826 -0.00453267 0.00678299 0.0146193 0.0176722 0.0198756 0.0222858 0.0250725 0.0266276 0.0292058 0.0315388 0.0335439 0.0369238 0.0390519 0.0412589 0.0439165 0.0466739 0.0500847 0.0525887 0.054453 ];
% abc2=(180/pi)*[-0.000934409 0.00886137 -0.00941908 -0.0235369 -0.0362284 -0.046909 -0.0548659 -0.0639413 -0.0743043 -0.0798358 -0.08717 -0.093298 -0.098422 -0.106077 -0.110346 -0.11442 -0.118909 -0.123127 -0.127859 -0.131063 -0.133348 ];
% abc3=(180/pi)*[0.0128691 0.00394417 -0.0261548 -0.0512014 -0.0738052 -0.0907699 -0.103255 -0.11765 -0.134647 -0.143896 -0.156497 -0.167015 -0.175927 -0.18962 -0.197505 -0.205203 -0.214007 -0.222548 -0.232417 -0.239315 -0.244306 ];
% %c5
% ab21=(180/pi)*[-0.040129 0.00906974 0.0191838 0.0211137 0.0218369 0.0229659 0.0240045 0.0255744 0.0276113 0.0288035 0.0308521 0.0326981 0.034304 0.0370047 0.0387268 0.0405306 0.0427292 0.0450339 0.0479289 0.0500308 0.0515845];
% ab22=(180/pi)*[-0.0043601 0.0035816 -0.00584752 -0.0131274 -0.0210215 -0.0279009 -0.0330543 -0.0387828 -0.04547 -0.0490933 -0.05387 -0.0578344 -0.0611328 -0.0659812 -0.0686939 -0.0712532 -0.0741001 -0.0767637 -0.0797213 -0.081658 -0.0830049];
% ab23=(180/pi)*[0.00581008 -0.00419482 -0.0225243 -0.0361809 -0.0491406 -0.0596917 -0.0675301 -0.0765108 -0.0872238 -0.0930759 -0.10101 -0.107618 -0.11319 -0.121657 -0.126516 -0.131223 -0.136614 -0.141841 -0.147875 -0.152045 -0.155042 ];
% 
% %c4-c5
% AA1=abc1-ab21;
% AA2=abc2-ab22;
% AA3=abc3-ab23;
% 
% %join data
% 
% HJ1=[flip(AA1(2:21)),aaf1];
% HJ2=[flip(AA2(2:21)),aaf2];
% HJ3=[flip(AA3(2:21)),aaf3];
% 
% figure(52)
% f108=plot(t20,HJ1,'y');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
% legend([f35,f103,f104,f105,f106,f107,f108],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% hold on
% 
% figure(53)
% f116=plot(t20,HJ2,'y');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
% legend([f36,f111,f112,f113,f114,f115,f116],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% hold on
% 
% figure(54)
% f124=plot(t20,HJ3,'y');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
% legend([f37,f119,f120,f121,f122,f123,f124],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% hold on
% 
% 
% %s2_6n_LatSlide_NoTetherb
% %c4
% % jjj1=(180/pi)*[-0.0602615 -0.00495039 0.00103349 0.0124928 0.0148325 0.0185778 0.0199855 0.022762 0.0247455 0.0267748 0.0289435 0.0313288 0.0334171 0.0359895 0.0383669 0.0409019 0.0434635 0.046089 0.0493881 0.0523903 0.054874];
% % jjj2=(180/pi)*[-0.000934409 0.0042948 -0.0111625 -0.0295667 -0.036558 -0.0515593 -0.05646 -0.066388 -0.0739699 -0.080939 -0.086784 -0.0929135 -0.0982213 -0.104093 -0.10901 -0.113684 -0.118045 -0.122109 -0.126703 -0.130559 -0.133589];
% % jjj3=(180/pi)*[0.0128691 -0.00379934 -0.0281921 -0.061795 -0.0732279 -0.0968291 -0.104574 -0.120721 -0.133142 -0.144907 -0.155045 -0.165607 -0.174884 -0.185375 -0.194438 -0.203268 -0.211795 -0.220043 -0.229589 -0.237891 -0.244544 ];
% % 
% % %c5
% % jjj4=(180/pi)*[-0.040129 0.0200798 0.0226195 0.0223035 0.022179 0.0233117 0.0240268 0.0259339 0.0273739 0.0289246 0.0306539 0.0325414 0.0342093 0.0362636 0.0381774 0.0402406 0.0423541 0.0445402 0.047335 0.0498641 0.0519353 ];
% % jjj5=(180/pi)*[-0.0043601 0.00137829 -0.00714173 -0.0168676 -0.0213753 -0.0311265 -0.0342617 -0.0404781 -0.0453994 -0.0499406 -0.0537317 -0.0576913 -0.0611012 -0.0648022 -0.0679227 -0.0708585 -0.073608 -0.0761789 -0.0790504 -0.0813989 -0.0831838];
% % jjj6=(180/pi)*[0.00581008 -0.00880178 -0.0238181 -0.04209 -0.0489384 -0.0636684 -0.0685017 -0.0785673 -0.0863917 -0.0938167 -0.100185 -0.106816 -0.112612 -0.119091 -0.124682 -0.130086 -0.135297 -0.140342 -0.14618 -0.151209 -0.155202];
% % 
% % %c4-c5
% % owp1=jjj1-jjj4;
% % owp2=jjj2-jjj5;
% % owp3=jjj3-jjj6;
% % 
% % goh1=[flip(owp1(2:21)),aaf1];
% % goh2=[flip(owp2(2:21)),aaf2];
% % goh3=[flip(owp3(2:21)),aaf3];
% % 
% % figure(52)
% % plot(t20,goh1,'-ob')
% % hold on
% % figure(53)
% % plot(t20,goh2,'-ob')
% % hold on
% % figure(54)
% % plot(t20,goh3,'-ob')
% % hold on
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %c3-c7
% %first model
% %c3
% yyy1=(180/pi)*[-0.052485 -0.00140975 0.0147398 0.0258097 0.0333074 0.0359328 0.0377871 0.0400155 0.0426987 0.0442567 0.0468691 0.0493143 0.0514721 0.0551093 0.0574065 0.0598711 0.0628877 0.0660312 0.069938 0.0728451 0.0750063];
% yyy2=(180/pi)*[-0.000895188 0.00465049 -0.0184293 -0.0365566 -0.0537644 -0.0682632 -0.0790553 -0.0914608 -0.105855 -0.113545 -0.123769 -0.132217 -0.1392 -0.149635 -0.155448 -0.160935 -0.166986 -0.172659 -0.178997 -0.183243 -0.186227];
% yyy3=(180/pi)*[0.0159214 0.00281589 -0.0318512 -0.0608275 -0.0880676 -0.109075 -0.124584 -0.142602 -0.164033 -0.175762 -0.191819 -0.205266 -0.216656 -0.234142 -0.244221 -0.254066 -0.26535 -0.276298 -0.288973 -0.297819 -0.304225];
% %c7
% yya1=(180/pi)*[-3.94245E-005 5.87802E-005 6.84385E-005 6.8194E-005 7.22561E-005 7.90056E-005 8.48641E-005 9.35788E-005 0.000106755 0.00011499 0.000127157 0.000138787 0.000149503 0.000167465 0.000178604 0.00018985 0.000203469 0.000217272 0.000234047 0.000246184 0.000255196];
% yya2=(180/pi)*[-2.13703E-005 1.98925E-005 3.53505E-005 4.48448E-005 5.54325E-005 6.42428E-005 7.06665E-005 7.80192E-005 8.73005E-005 9.25172E-005 0.000100017 0.000106482 0.000111918 0.000120613 0.000125774 0.000130933 0.000136973 0.000143049 0.000150302 0.000155542 0.000159375];
% yya3=(180/pi)*[2.91589E-006 -5.0172E-005 -0.000102932 -0.00015112 -0.000210151 -0.000263522 -0.000305678 -0.000358577 -0.000427943 -0.000468664 -0.000527166 -0.000578369 -0.000623163 -0.000695082 -0.000738262 -0.000781389 -0.000832503 -0.000883541 -0.00094406 -0.000986999 -0.00101842 ];
% 
% jak1=yyy1-yya1;
% jak2=yyy2-yya2;
% jak3=yyy3-yya3;
% 
% bob1=[flip(jak1(2:21)),aar1];
% bob2=[flip(jak2(2:21)),aar2];
% bob3=[flip(jak3(2:21)),aar3];
% 
% figure(76)
% f262=plot(tab6,bob1,'y');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('C3-C7 Relative about x-axis under axial rotation (6n6p)')
% legend([f53,f257,f258,f259,f260,f261,f262],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% hold on
% 
% figure(77)
% f270=plot(tab6,bob2,'y');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('C3-C7 Relative about y-axis under axial rotation (6n6p)')
% legend([f54,f265,f266,f267,f268,f269,f270],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% hold on
% 
% figure(78)
% f278=plot(tab6,bob3,'y');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
% legend([f55,f273,f274,f275,f276,f277,f278],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% hold on
% 
% %model b
% % ooo1=(180/pi)*[-0.052485 0.0148013 0.0204733 0.0314959 0.033603 0.0367194 0.0379101 0.040492 0.0423917 0.0444247 0.0466197 0.0491072 0.0513424 0.0541053 0.0566684 0.0594562 0.06235 0.065343 0.0691052 0.0725661 0.0754574];
% % ooo2=(180/pi)*[-0.000895188 -0.000846916 -0.0200842 -0.0443378 -0.0537629 -0.0740875 -0.0807701 -0.0944866 -0.105047 -0.114778 -0.12296 -0.131443 -0.138717 -0.146739 -0.153467 -0.159809 -0.165695 -0.171186 -0.177355 -0.182507 -0.186475 ];
% % ooo3=(180/pi)*[0.0159214 -0.00584059 -0.0337927 -0.0731942 -0.0871229 -0.116343 -0.126001 -0.146272 -0.161964 -0.176902 -0.189837 -0.203347 -0.215216 -0.228624 -0.240221 -0.251516 -0.262446 -0.273027 -0.285288 -0.295951 -0.304488];
% % 
% % ooa1=(180/pi)*[-3.94245E-005 7.78626E-005 7.53512E-005 7.19963E-005 7.40912E-005 8.29176E-005 8.68141E-005 9.67562E-005 0.000106483 0.000116992 0.000126964 0.000138558 0.000149647 0.000163188 0.000175764 0.000188604 0.000201644 0.00021488 0.00023099 0.000245568 0.000257554];
% % ooa2=(180/pi)*[-2.13703E-005 2.21525E-005 3.20714E-005 4.62106E-005 5.18308E-005 6.37946E-005 6.78196E-005 7.65723E-005 8.36293E-005 9.04913E-005 9.66455E-005 0.000103199 0.000109024 0.000115777 0.000121781 0.000127774 0.000133712 0.000139633 0.000146728 0.000153077 0.000158272];
% % ooa3=(180/pi)*[2.91589E-006 -6.21039E-005 -0.000103024 -0.00017436 -0.000206253 -0.000280902 -0.000307759 -0.00036826 -0.000419468 -0.000471386 -0.000518521 -0.000569735 -0.000616353 -0.000670981 -0.000720176 -0.000769332 -0.000818483 -0.000867594 -0.000925798 -0.000977448 -0.00101934];
% % 
% % you1=[ooo1-ooa1];
% % you2=[ooo2-ooa2];
% % you3=[ooo3-ooa3];
% % 
% % poo1=[flip(you1(2:21)),aar1];
% % poo2=[flip(you2(2:21)),aar2];
% % poo3=[flip(you3(2:21)),aar3];
% % 
% % figure(76)
% % plot(tab6,poo1,'-ob')
% % hold on
% % figure(77)
% % plot(tab6,poo2,'-ob')
% % hold on
% % figure(78)
% % plot(tab6,poo3,'-ob')
% % hold on
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %c5-c6
% %first model
% %c5
% lok1=(180/pi)*[-0.040129 0.00906974 0.0191838 0.0211137 0.0218369 0.0229659 0.0240045 0.0255744 0.0276113 0.0288035 0.0308521 0.0326981 0.034304 0.0370047 0.0387268 0.0405306 0.0427292 0.0450339 0.0479289 0.0500308 0.0515845];
% lok2=(180/pi)*[-0.0043601 0.0035816 -0.00584752 -0.0131274 -0.0210215 -0.0279009 -0.0330543 -0.0387828 -0.04547 -0.0490933 -0.05387 -0.0578344 -0.0611328 -0.0659812 -0.0686939 -0.0712532 -0.0741001 -0.0767637 -0.0797213 -0.081658 -0.0830049];
% lok3=(180/pi)*[0.00581008 -0.00419482 -0.0225243 -0.0361809 -0.0491406 -0.0596917 -0.0675301 -0.0765108 -0.0872238 -0.0930759 -0.10101 -0.107618 -0.11319 -0.121657 -0.126516 -0.131223 -0.136614 -0.141841 -0.147875 -0.152045 -0.155042];
% %c6
% lak1=(180/pi)*[-0.0222029 0.0141579 0.017409 0.0177306 0.0180829 0.0186228 0.0190385 0.0196077 0.0205035 0.0210608 0.0220101 0.0230358 0.0240167 0.0256945 0.0267233 0.0277861 0.0290655 0.0304156 0.0321209 0.0333644 0.0342808];
% lak2=(180/pi)*[-0.00288619 0.00419066 -0.000528685 -0.00494493 -0.00930038 -0.0131036 -0.0160165 -0.0192544 -0.0230135 -0.0249524 -0.0274862 -0.0295652 -0.0312375 -0.0336391 -0.0349412 -0.0361679 -0.037542 -0.0388516 -0.0403327 -0.0413105 -0.0419837];
% lak3=(180/pi)*[0.00148919 -0.00332891 -0.0106401 -0.0166733 -0.0226635 -0.0277268 -0.0316034 -0.0361363 -0.0416629 -0.0446808 -0.0487974 -0.0522326 -0.0551048 -0.0594308 -0.0618614 -0.0642113 -0.0669111 -0.0695567 -0.0726347 -0.0747511 -0.0762684];
% % c5-c6
% gah1=lok1-lak1;
% gah2=lok2-lak2;
% gah3=lok3-lak3;
% 
% %join data
% jun1=[flip(gah1(2:21)),aal1];
% jun2=[flip(gah2(2:21)),aal2];
% jun3=[flip(gah3(2:21)),aal3];
% 
% figure(61)
% f182=plot(t21,jun1,'y');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
% legend([f44,f177,f178,f179,f180,f181,f182],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% hold on
% 
% figure(62)
% f190=plot(t21,jun2,'y');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
% legend([f45,f185,f186,f187,f188,f189,f190],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% hold on
% 
% figure(63)
% f198=plot(t21,jun3,'y');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
% legend([f46,f193,f194,f195,f196,f197,f198],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% hold on
% 
% 
% figure(69)
% subplot(3,3,7)
% f16=plot(t21,jun1,'g','LineWidth',3);
% hold on
% f17=plot(t21,jun2,'b');
% hold on
% f18=plot(t21,jun3,'r');
% xlabel('Moment (N-m)')
% ylabel('Degrees')
% title('Axial Rotation ROM C5-C6 model 6')
% legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')
% 
% %model b
% %c5
% % luk1=(180/pi)*[-0.040129 0.0200798 0.0226195 0.0223035 0.022179 0.0233117 0.0240268 0.0259339 0.0273739 0.0289246 0.0306539 0.0325414 0.0342093 0.0362636 0.0381774 0.0402406 0.0423541 0.0445402 0.047335 0.0498641 0.0519353];
% % luk2=(180/pi)*[-0.0043601 0.00137829 -0.00714173 -0.0168676 -0.0213753 -0.0311265 -0.0342617 -0.0404781 -0.0453994 -0.0499406 -0.0537317 -0.0576913 -0.0611012 -0.0648022 -0.0679227 -0.0708585 -0.073608 -0.0761789 -0.0790504 -0.0813989 -0.0831838];
% % luk3=(180/pi)*[0.00581008 -0.00880178 -0.0238181 -0.04209 -0.0489384 -0.0636684 -0.0685017 -0.0785673 -0.0863917 -0.0938167 -0.100185 -0.106816 -0.112612 -0.119091 -0.124682 -0.130086 -0.135297 -0.140342 -0.14618 -0.151209 -0.155202];
% % %c6
% % kul1=(180/pi)*[-0.0222029 0.0182559 0.0185905 0.0180767 0.0182002 0.0187913 0.019055 0.0197319 0.0203905 0.021114 0.0219099 0.0229329 0.0239529 0.0252268 0.0263984 0.0276133 0.0288474 0.0301242 0.0317708 0.0332631 0.034485];
% % kul2=(180/pi)*[-0.00288619 0.00292444 -0.00155587 -0.00723686 -0.00964192 -0.015008 -0.0167818 -0.020342 -0.0230521 -0.0254745 -0.0274816 -0.0295629 -0.0312869 -0.0331282 -0.0346363 -0.0360326 -0.03735 -0.0386025 -0.0400317 -0.0412139 -0.0421025];
% % kul3=(180/pi)*[0.00148919 -0.00549838 -0.0115587 -0.0195595 -0.0227436 -0.0298157 -0.0322163 -0.0372868 -0.0413122 -0.0451251 -0.0484223 -0.0518658 -0.0548478 -0.0581729 -0.0609815 -0.063673 -0.0662745 -0.0688163 -0.0717921 -0.0743471 -0.076366];
% % 
% % fgh1=[luk1-kul1];
% % fgh2=[luk2-kul2];
% % fgh3=[luk3-kul3];
% % 
% % hug1=[flip(fgh1(2:21)),aal1];
% % hug2=[flip(fgh2(2:21)),aal2];
% % hug3=[flip(fgh3(2:21)),aal3];
% % 
% % figure(61)
% % f182=plot(t21,hug1,'-ob');
% % xlabel('Moment (N-m)')
% % ylabel('Degrees')
% % title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
% % legend([f44,f177,f178,f179,f180,f181,f182],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% % hold on
% % 
% % figure(62)
% % f190=plot(t21,hug2,'-ob');
% % xlabel('Moment (N-m)')
% % ylabel('Degrees')
% % title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
% % legend([f45,f185,f186,f187,f188,f189,f190],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% % hold on
% % 
% % figure(63)
% % f198=plot(t21,hug3,'-ob');
% % xlabel('Moment (N-m)')
% % ylabel('Degrees')
% % title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
% % legend([f46,f193,f194,f195,f196,f197,f198],'intact','model 1','model 2','model 3','model 4','model 5','model 6')
% % hold on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% model 13
% c4-c5 
run('model13_fixed_tether_ROM.m')

%4n
aaa1=ur1c-ur1e;
aaa2=ur2c-ur2e;
aaa3=ur3c-ur3e;

%4p
aab1=ur1d-ur1f;
aab2=ur2d-ur2f;
aab3=ur3d-ur3f;

%5n
aac1=ur1c5-ur1e5;
aac2=ur2c5-ur2e5;
aac3=ur3c5-ur3e5;

%5p
aad1=ur1d5-ur1f5;
aad2=ur2d5-ur2f5;
aad3=ur3d5-ur3f5;

%6n
aae1=ur1c6-ur1e6;
aae2=ur2c6-ur2e6;
aae3=ur3c6-ur3e6;

%6p
aaf1=ur1d6-ur1f6;
aaf2=ur2d6-ur2f6;
aaf3=ur3d6-ur3f6;

% join data
%4n4p
t3;
zza1=[flip(aaa1(2:21)),aab1];
zza2=[flip(aaa2(2:21)),aab2];
zza3=[flip(aaa3(2:21)),aab3];

%5n5p
t4;
zzb1=[flip(aac1(2:21)),aad1];
zzb2=[flip(aac2(2:21)),aad2];
zzb3=[flip(aac3(2:21)),aad3];

%6n6pfig
t20;
zzc1=[flip(aae1(2:21)),aaf1];
zzc2=[flip(aae2(2:21)),aaf2];
zzc3=[flip(aae3(2:21)),aaf3];

% plot data

%4n4p
figure(46)
f62=plot(t3,zza1,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during flexion/extension (4n4p)')
legend([f29,f56,f57,f58,f59,f60,f61,f62],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(47)
f70=plot(t3,zza2,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')
legend([f30,f64,f65,f66,f67,f68,f69,f70],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(48)
f78=plot(t3,zza3,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')
legend([f31,f72,f73,f74,f75,f76,f77,f78],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

%5n5p
figure(49)
f86=plot(t4,zzb1,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')
legend([f32,f80,f81,f82,f83,f84,f85,f86],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(50)
f93=plot(t4,zzb2,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')
legend([f33,f87,f88,f89,f90,f91,f92,f93],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(51)
f101=plot(t4,zzb3,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')
legend([f34,f95,f96,f97,f98,f99,f100,f101],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on


%6n6p
figure(52)
f109=plot(t20,zzc1,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
legend([f35,f103,f104,f105,f106,f107,f108,f109],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(53)
f117=plot(t20,zzc2,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
legend([f36,f111,f112,f113,f114,f115,f116,f117],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(54)
f125=plot(t20,zzc3,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
legend([f37,f119,f120,f121,f122,f123,f124,f125],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(3,3,8)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 model 13')
legend([f1,f2,f3],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','southeast')

figure(65)
subplot(3,3,8)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 model 13')
legend([f4,f5,f6],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','southeast')

figure(66)
subplot(3,3,8)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 model 13')
legend([f7,f8,f9],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','southeast')

% C5-C6 

% 4n
aag1=ur1e-ur1g;
aag2=ur2e-ur2g;
aag3=ur3e-ur3g;

% 4p
aah1=ur1f-ur1h;
aah2=ur2f-ur2h;
aah3=ur3f-ur2h;

% 5n
aai1=ur1e5-ur1g5;
aai2=ur2e5-ur2g5;
aai3=ur3e5-ur3g5;

% 5p
aaj1=ur1f5-ur1h5;
aaj2=ur2f5-ur2h5;
aaj3=ur3f5-ur3h5;

% 6n
aak1=ur1e6-ur1g6;
aak2=ur2e6-ur2g6;
aak3=ur3e6-ur3g6;

% 6p
aal1=ur1f6-ur1h6;
aal2=ur2f6-ur2h6;
aal3=ur3f6-ur3h6;

% join data

%4n4p
t5;
zzd1=[flip(aag1(2:21)),aah1];
zzd2=[flip(aag2(2:21)),aah2];
zzd3=[flip(aag3(2:21)),aah3];

%5n5p
t6;
zze1=[flip(aai1(2:21)),aaj1];
zze2=[flip(aai2(2:21)),aaj2];
zze3=[flip(aai3(2:21)),aaj3];

%6n6p
t21;
zzf1=[flip(aak1(2:21)),aal1];
zzf2=[flip(aak2(2:21)),aal2];
zzf3=[flip(aak3(2:21)),aal3];

% plot data
% 4n4p
figure(55)
f133=plot(t5,zzd1,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f38,f127,f128,f129,f130,f131,f132,f133],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(56)
f143=plot(t5,zzd2,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f39,f137,f138,f139,f140,f141,f142,f143],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(57)
f151=plot(t5,zzd3,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f40,f145,f146,f147,f148,f149,f150,f151],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

% 5n5p
figure(58)
f159=plot(t6,zze1,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f41,f153,f154,f155,f156,f157,f158,f159],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(59)
f167=plot(t6,zze2,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f42,f161,f162,f163,f164,f165,f166,f167],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(60)
f175=plot(t6,zze3,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')
legend([f43,f169,f170,f171,f172,f173,f174,f175],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

%6n6p
figure(61)
f183=plot(t21,zzf1,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
legend([f44,f177,f178,f179,f180,f181,f182,f183],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(62)
f191=plot(t21,zzf2,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
legend([f45,f185,f186,f187,f188,f189,f190,f191],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(63)
f199=plot(t21,zzf3,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
legend([f46,f193,f194,f195,f196,f197,f198,f199],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

% plot ROM data with coupled motion

figure(67)
subplot(3,3,8)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C5-C6 model 13')
legend([f10,f11,f12],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')


figure(68)
subplot(3,3,8)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 13')
legend([f13,f14,f15],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(69)
subplot(3,3,8)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 13')
legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% c3-c7

%4n
aam1=ur1a-ur1i;
aam2=ur2a-ur2i;
aam3=ur3a-ur3i;

%4p
aan1=ur1b-ur1j;
aan2=ur2b-ur2j;
aan3=ur3b-ur3j;

%5n
aao1=ur1a5-ur1i5;
aao2=ur2a5-ur2i5;
aao3=ur3a5-ur3i5;

%5p
aap1=ur1b5-ur1j5;
aap2=ur2b5-ur2j5;
aap3=ur3b5-ur3j5;

%6n
aaq1=ur1a6-ur1j6;
aaq2=ur2a6-ur2j6;
aaq3=ur3a6-ur3j6;

%6p
aar1=ur1b6-ur1i6;
aar2=ur2b6-ur2i6;
aar3=ur3b6-ur3i6;

%join data

%4n4p
t1;
zzg1=[flip(aam1(2:21)),aan1];
zzg2=[flip(aam2(2:21)),aan2];
zzg3=[flip(aam3(2:21)),aan3];

%5n5p
t2;
zzh1=[flip(aao1(2:21)),aap1];
zzh2=[flip(aao2(2:21)),aap2];
zzh3=[flip(aao3(2:21)),aap3];

%6n6p
tab6;
zzi1=[flip(aaq1(2:21)),aar1];
zzi2=[flip(aaq2(2:21)),aar2];
zzi3=[flip(aaq3(2:21)),aar3];

% plot data
figure(70)
f207=plot(t1,zzg1,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f47,f201,f202,f203,f204,f205,f206,f207],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(71)
f281=plot(t1,zzg2,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f48,f209,f210,f211,f212,f213,f214,f281],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(72)
f221=plot(t1,zzg3,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f49,f215,f216,f217,f218,f219,f220,f221],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(73)
f229=plot(t2,zzh1,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f50,f223,f224,f225,f226,f227,f228,f229],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(74)
f237=plot(t2,zzh2,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f51,f231,f232,f233,f234,f235,f236,f237],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(75)
f255=plot(t2,zzh3,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')
legend([f52,f239,f240,f241,f242,f243,f244,f255],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(76)
f263=plot(tab6,zzi1,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')
legend([f53,f257,f258,f259,f260,f261,f262,f263],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(77)
f271=plot(tab6,zzi2,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')
legend([f54,f265,f266,f267,f268,f269,f270,f271],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

figure(78)
f279=plot(tab6,zzi3,'color',[0.9290,0.6940, 0.1250]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
legend([f55,f273,f274,f275,f276,f277,f278,f279],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13')
hold on

% plot data with coupled rotation

figure(79)
subplot(3,3,8)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C3-C7 model 13')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(3,3,8)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 13')
legend([f23,f24,f25],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(81)
subplot(3,3,8)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 13')
legend([f26,f27,f28],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')
%% model 14
% c4-c5 
run('model14_Fixed_NoTether_ROM.m')

%4n
aaa1=ur1c-ur1e;
aaa2=ur2c-ur2e;
aaa3=ur3c-ur3e;

%4p
aab1=ur1d-ur1f;
aab2=ur2d-ur2f;
aab3=ur3d-ur3f;

%5n
aac1=ur1c5-ur1e5;
aac2=ur2c5-ur2e5;
aac3=ur3c5-ur3e5;

%5p
aad1=ur1d5-ur1f5;
aad2=ur2d5-ur2f5;
aad3=ur3d5-ur3f5;

%6n
aae1=ur1c6-ur1e6;
aae2=ur2c6-ur2e6;
aae3=ur3c6-ur3e6;

%6p
aaf1=ur1d6-ur1f6;
aaf2=ur2d6-ur2f6;
aaf3=ur3d6-ur3f6;

% join data
%4n4p
t3;
zza1=[flip(aaa1(2:21)),aab1];
zza2=[flip(aaa2(2:21)),aab2];
zza3=[flip(aaa3(2:21)),aab3];

%5n5p
t4;
zzb1=[flip(aac1(2:21)),aad1];
zzb2=[flip(aac2(2:21)),aad2];
zzb3=[flip(aac3(2:21)),aad3];

%6n6p
t20;
zzc1=[flip(aae1(2:21)),aaf1];
zzc2=[flip(aae2(2:21)),aaf2];
zzc3=[flip(aae3(2:21)),aaf3];

% plot data

%4n4p
figure(46)
f63=plot(t3,zza1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during flexion/extension (4n4p)')
legend([f29,f56,f57,f58,f59,f60,f61,f62,f63],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14','location','southeast')
hold on

figure(47)
f71=plot(t3,zza2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')
legend([f30,f64,f65,f66,f67,f68,f69,f70,f71],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(48)
f79=plot(t3,zza3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')
legend([f31,f72,f73,f74,f75,f76,f77,f78,f79],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

%5n5p
figure(49)
f87=plot(t4,zzb1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')
legend([f32,f80,f81,f82,f83,f84,f85,f86,f87],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(50)
f94=plot(t4,zzb2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')
legend([f33,f87,f88,f89,f90,f91,f92,f93,f94],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(51)
f102=plot(t4,zzb3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')
legend([f34,f95,f96,f97,f98,f99,f100,f101,f102],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on


%6n6p
figure(52)
f110=plot(t20,zzc1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')
legend([f35,f103,f104,f105,f106,f107,f108,f109,f110],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(53)
f118=plot(t20,zzc2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')
legend([f36,f111,f112,f113,f114,f115,f116,f117,f118],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(54)
f126=plot(t20,zzc3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')
legend([f37,f119,f120,f121,f122,f123,f124,f125,f126],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(3,3,9)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 model 14')
legend([f1,f2,f3],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','southeast')

figure(65)
subplot(3,3,9)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 model 14')
legend([f4,f5,f6],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','southeast')

figure(66)
subplot(3,3,9)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 model 14')
legend([f7,f8,f9],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','southeast')

% C5-C6 

% 4n
aag1=ur1e-ur1g;
aag2=ur2e-ur2g;
aag3=ur3e-ur3g;

% 4p
aah1=ur1f-ur1h;
aah2=ur2f-ur2h;
aah3=ur3f-ur2h;

% 5n
aai1=ur1e5-ur1g5;
aai2=ur2e5-ur2g5;
aai3=ur3e5-ur3g5;

% 5p
aaj1=ur1f5-ur1h5;
aaj2=ur2f5-ur2h5;
aaj3=ur3f5-ur3h5;

% 6n
aak1=ur1e6-ur1g6;
aak2=ur2e6-ur2g6;
aak3=ur3e6-ur3g6;

% 6p
aal1=ur1f6-ur1h6;
aal2=ur2f6-ur2h6;
aal3=ur3f6-ur3h6;

% join data

%4n4p
t5;
zzd1=[flip(aag1(2:21)),aah1];
zzd2=[flip(aag2(2:21)),aah2];
zzd3=[flip(aag3(2:21)),aah3];

%5n5p
t6;
zze1=[flip(aai1(2:21)),aaj1];
zze2=[flip(aai2(2:21)),aaj2];
zze3=[flip(aai3(2:21)),aaj3];

%6n6p
t21;
zzf1=[flip(aak1(2:21)),aal1];
zzf2=[flip(aak2(2:21)),aal2];
zzf3=[flip(aak3(2:21)),aal3];

% plot data
% 4n4p
figure(55)
f134=plot(t5,zzd1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f38,f127,f128,f129,f130,f131,f132,f133,f134],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(56)
f144=plot(t5,zzd2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f39,f137,f138,f139,f140,f141,f142,f143,f144],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(57)
f152=plot(t5,zzd3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f40,f145,f146,f147,f148,f149,f150,f151,f152],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

% 5n5p
figure(58)
f160=plot(t6,zze1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f41,f153,f154,f155,f156,f157,f158,f159,f160],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(59)
f168=plot(t6,zze2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f42,f161,f162,f163,f164,f165,f166,f167,f168],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(60)
f176=plot(t6,zze3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')
legend([f43,f169,f170,f171,f172,f173,f174,f175,f176],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

%6n6p
figure(61)
f184=plot(t21,zzf1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')
legend([f44,f177,f178,f179,f180,f181,f182,f183,f184],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(62)
f192=plot(t21,zzf2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')
legend([f45,f185,f186,f187,f188,f189,f190,f191,f192],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(63)
f200=plot(t21,zzf3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')
legend([f46,f193,f194,f195,f196,f197,f198,f199,f200],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

% plot ROM data with coupled motion

figure(67)
subplot(3,3,9)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C5-C6 model 14')
legend([f10,f11,f12],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')


figure(68)
subplot(3,3,9)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 14')
legend([f13,f14,f15],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(69)
subplot(3,3,9)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
xlabel('Moment (N-m)')
f18=plot(t21,zzf3,'r');
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 14')
legend([f16,f17,f18],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')

% c3-c7

%4n
aam1=ur1a-ur1i;
aam2=ur2a-ur2i;
aam3=ur3a-ur3i;

%4p
aan1=ur1b-ur1j;
aan2=ur2b-ur2j;
aan3=ur3b-ur3j;

%5n
aao1=ur1a5-ur1i5;
aao2=ur2a5-ur2i5;
aao3=ur3a5-ur3i5;

%5p
aap1=ur1b5-ur1j5;
aap2=ur2b5-ur2j5;
aap3=ur3b5-ur3j5;

%6n
aaq1=ur1a6-ur1j6;
aaq2=ur2a6-ur2j6;
aaq3=ur3a6-ur3j6;

%6p
aar1=ur1b6-ur1i6;
aar2=ur2b6-ur2i6;
aar3=ur3b6-ur3i6;

%join data

%4n4p
t1;
zzg1=[flip(aam1(2:21)),aan1];
zzg2=[flip(aam2(2:21)),aan2];
zzg3=[flip(aam3(2:21)),aan3];

%5n5p
t2;
zzh1=[flip(aao1(2:21)),aap1];
zzh2=[flip(aao2(2:21)),aap2];
zzh3=[flip(aao3(2:21)),aap3];

%6n6p
tab6;
zzi1=[flip(aaq1(2:21)),aar1];
zzi2=[flip(aaq2(2:21)),aar2];
zzi3=[flip(aaq3(2:21)),aar3];

% plot data
figure(70)
f208=plot(t1,zzg1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under flexion/extension (4n4p)')
legend([f47,f201,f202,f203,f204,f205,f206,f207,f208],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(71)
f282=plot(t1,zzg2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')
legend([f48,f209,f210,f211,f212,f213,f214,f281,f282],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(72)
f222=plot(t1,zzg3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')
legend([f49,f215,f216,f217,f218,f219,f220,f221,f222],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(73)
f230=plot(t2,zzh1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')
legend([f50,f223,f224,f225,f226,f227,f228,f229,f230],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(74)
f238=plot(t2,zzh2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')
legend([f51,f231,f232,f233,f234,f235,f236,f237,f238],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(75)
f256=plot(t2,zzh3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')
legend([f52,f239,f240,f241,f242,f243,f244,f255,f256],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(76)
f264=plot(tab6,zzi1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')
legend([f53,f257,f258,f259,f260,f261,f262,f263,f264],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(77)
f272=plot(tab6,zzi2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')
legend([f54,f265,f266,f267,f268,f269,f270,f271,f272],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

figure(78)
f280=plot(tab6,zzi3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
legend([f55,f273,f274,f275,f276,f277,f278,f279,f280],'intact','model 1','model 2','model 3','model 4','model 5','model 6','model 13','model 14')
hold on

% plot data with coupled rotation

figure(79)
subplot(3,3,9)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion/Extension ROM C3-C7 model 14')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(3,3,9)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 14')
legend([f23,f24,f25],'Flexion & Extension Coupled Rotation','Lateral Bending','Axial Rotation Coupled Rotation','location','northwest')

figure(81)
subplot(3,3,9)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 14')
legend([f26,f27,f28],'Flexion & Extension Coupled Rotation','Lateral Bending Coupled Rotation','Axial Rotation','location','northwest')





%% relative ROM figures
figure(64)
figure(65)
figure(66)
figure(67)
figure(68)
figure(69)
figure(79)
figure(80)
figure(81)