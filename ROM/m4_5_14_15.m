% this script plots relative range of motion of vertabrae segments
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

hold on

figure(47)
f30=plot(t3,zza2,'k');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p')

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

hold on

figure(50)
f33=plot(t4,zzb2,'k');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')

hold on

figure(51)
f34=plot(t4,zzb3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')

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

hold on

figure(54)
f37=plot(t20,zzc3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')

hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(1,3,1)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('intact')
grid on
%bar plot
bb1=abs(zza1(11))+abs(zza1(31));




figure(65)
subplot(1,3,1)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('intact')
grid on
ba1=abs(zzb2(11))+abs(zzb2(31));


figure(66)
subplot(1,3,1)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('intact')
grid on
bc1=abs(zza1(11))+abs(zza1(31));


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

hold on

figure(56)
f39=plot(t5,zzd2,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')

hold on

figure(57)
f40=plot(t5,zzd3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')

hold on

% 5n5p
figure(58)
f41=plot(t6,zze1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')

hold on

figure(59)
f42=plot(t6,zze2,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')

hold on

figure(60)
f43=plot(t6,zze3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')

hold on

%6n6p
figure(61)
f44=plot(t21,zzf1,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')

hold on

figure(62)
f45=plot(t21,zzf2,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')

hold on

figure(63)
f46=plot(t21,zzf3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')

hold on

% plot ROM data with coupled motion

figure(67)
subplot(1,3,1)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion/Extension ROM C5-C6 intact')



figure(68)
subplot(1,3,1)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 intact')


figure(69)
subplot(1,3,1)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 intact')


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

hold on

figure(71)
f48=plot(t1,zzg2,'k');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')

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

hold on

figure(78)
f55=plot(tab6,zzi3,'k');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative about z-axis under axial rotation (6n6p)')

hold on

% plot data with coupled rotation

figure(79)
subplot(1,3,1)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion/Extension ROM C3-C7 intact')


figure(80)
subplot(1,3,1)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 intact')

figure(81)
subplot(1,3,1)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 intact')




%% model 5
run('m5.m')
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

hold on

figure(47)
f68=plot(t3,zza2,'m');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')

hold on

figure(48)
f76=plot(t3,zza3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')

hold on

%5n5p
figure(49)
f84=plot(t4,zzb1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')

hold on

figure(50)
f91=plot(t4,zzb2,'m');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')

hold on

figure(51)
f99=plot(t4,zzb3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')

hold on


%6n6p
figure(52)
f107=plot(t20,zzc1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')

hold on

figure(53)
f115=plot(t20,zzc2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')

hold on

figure(54)
f123=plot(t20,zzc3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')

hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(1,3,3)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C4-C5 model 5')
grid on
bd1=abs(zza1(11))+abs(zza1(31));

figure(65)
subplot(1,3,3)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m')
ylabel('Degrees')
title('Lateral Bending ROM C4-C5 model 5')
grid on
bd2=abs(zzb2(11))+abs(zzb2(31));

figure(66)
subplot(1,3,3)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C4-C5 model 5')
grid on
bd3=abs(zzc3(11))+abs(zzc3(31));


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

hold on

figure(56)
f141=plot(t5,zzd2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')

hold on

figure(57)
f149=plot(t5,zzd3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')

hold on

% 5n5p
figure(58)
f157=plot(t6,zze1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')

hold on

figure(59)
f165=plot(t6,zze2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')

hold on

figure(60)
f173=plot(t6,zze3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')

hold on

%6n6p
figure(61)
f181=plot(t21,zzf1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')

hold on

figure(62)
f189=plot(t21,zzf2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')

hold on

figure(63)
f197=plot(t21,zzf3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')

hold on

% plot ROM data with coupled motion

figure(67)
subplot(1,3,3)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C5-C6 model 5')



figure(68)
subplot(1,3,3)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 5')


figure(69)
subplot(1,3,3)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
f18=plot(t21,zzf3,'r');
hold on
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 5')


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

hold on

figure(71)
f213=plot(t1,zzg2,'m');
xlabel('Moment (N-m')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')

hold on

figure(72)
f219=plot(t1,zzg3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')

hold on

figure(73)
f227=plot(t2,zzh1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')

hold on

figure(74)
f235=plot(t2,zzh2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')

hold on

figure(75)
f243=plot(t2,zzh3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')

hold on

figure(76)
f261=plot(tab6,zzi1,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')

hold on

figure(77)
f269=plot(tab6,zzi2,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')

hold on

figure(78)
f277=plot(tab6,zzi3,'m');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')
hold on

% plot data with coupled rotation
figure(79)
subplot(1,3,3)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C3-C7 model 5')


figure(80)
subplot(1,3,3)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 5')


figure(81)
subplot(1,3,3)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 5')















%% model 14
% c4-c5 
run('m14.m')

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

hold on

figure(47)
f71=plot(t3,zza2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during flexion/extension (4n4p)')

hold on

figure(48)
f79=plot(t3,zza3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during flexion/extension (4n4p)')

hold on

%5n5p
figure(49)
f87=plot(t4,zzb1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during lateral bending (5n5p)')

hold on

figure(50)
f94=plot(t4,zzb2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during lateral bending (5n5p)')

hold on

figure(51)
f102=plot(t4,zzb3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during lateral bending (5n5p)')

hold on


%6n6p
figure(52)
f110=plot(t20,zzc1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about x-axis for intact model during axial rotation (6n6p)')

hold on

figure(53)
f118=plot(t20,zzc2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about y-axis for intact model during axial rotation (6n6p)')

hold on

figure(54)
f126=plot(t20,zzc3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C4-C5 Relative ROM about z-axis for intact model during axial rotation (6n6p)')

hold on

% plot c4-c5 with coupled rotation
figure(64)
subplot(1,3,3)
f1=plot(t3,zza1,'g');
hold on
f2=plot(t3,zza2,'b');
hold on
f3=plot(t3,zza3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('model 14')
legend([f1,f2,f3],'flexion/extension','lateral bending coupled rotation','axial rotation coupled rotation')
bb3=abs(zza1(11))+abs(zza1(31));
grid on
figure(101)
% patelN1=10.37;
% patel1=12.8;
Doran=11.3;
yuN1=8.01;
yu1=8.48;
PC=[bb1,bd1,bb3];
% PC=[bb1;bb2;bb3;bd1;yu1;yuN1];
b=bar(PC,'FaceColor','flat');
xticklabels({'intact','lateral slide','ProDisc-C','Prestige LP','Yu''s Normal','ProDisc-C in vivo'})
% xticklabels({'intact','model 4','model 14','model 5','Prestige LP','Yu''s Normal'})
title({'Flexion & Extension (1 N-m)'})
ylabel('Degree')

figure(65)
subplot(2,2,3)
f4=plot(t4,zzb1,'g');
hold on
f5=plot(t4,zzb2,'b');
hold on
f6=plot(t4,zzb3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('model 14')
legend([f4,f5,f6],'flexion/extension coupled rotation','lateral bending','axial rotation coupled rotation')
grid on

ba3=abs(zzb3(11))+abs(zzb3(31));
figure(102)
% patelN2=7.84;
% patel2=6.46;
yuN2=5.78;
yu2=6.46;
PC=[ba1,bd2,ba3,yu2,yuN2];
% PC=[ba1,ba2,ba3,bd2,yu2,yuN2];
bar(PC)
xticklabels({'intact','lateral slide','ProDisc-C','Prestige LP','Yu''s Normal'})
% xticklabels({'intact','model 4','model 14','model 5','Prestige LP','Yu''s Normal'})
ylabel('Degree')
title('Lateral Bending (1 N-m)')




figure(66)
subplot(2,2,3)
f7=plot(t20,zzc1,'g');
hold on
f8=plot(t20,zzc2,'b');
hold on
f9=plot(t20,zzc3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('model 14')
legend([f7,f8,f9],'flexion/extension coupled rotation','lateral bending coupled rotation','axial rotation')
grid on

bc3=abs(zza1(11))+abs(zza1(31));
figure(103)
% patelN3=10.38;
% patel3=11.61;
yu3=5.7;
yuN3=5.32;
PC=[bc1,bd3,bc3,yu3,yuN3];
% PC=[bc1,bc2,bc3,bd3,yu3,yuN3];
bar(PC)
% xticklabels({'intact','model 4','model 14','model 5','Prestige LP','Yu''s Normal'})
xticklabels({'intact','lateral slide','ProDisc-C','Prestige LP','Yu''s Normal'})
ylabel('Degree')
title('Axial Rotation (1 N-m)')

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

hold on

figure(56)
f144=plot(t5,zzd2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under flexion/extension (4n4p)')

hold on

figure(57)
f152=plot(t5,zzd3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under flexion/extension (4n4p)')

hold on

% 5n5p
figure(58)
f160=plot(t6,zze1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under lateral bending (5n5p)')

hold on

figure(59)
f168=plot(t6,zze2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under lateral bending (5n5p)')

hold on

figure(60)
f176=plot(t6,zze3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under lateral bending (5n5p)')

hold on

%6n6p
figure(61)
f184=plot(t21,zzf1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about x-axis under axial rotation (6n6p)')

hold on

figure(62)
f192=plot(t21,zzf2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about y-axis under axial rotation (6n6p)')

hold on

figure(63)
f200=plot(t21,zzf3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C5-C6 Relative ROM about z-axis under axial rotation (6n6p)')

hold on

% plot ROM data with coupled motion

figure(67)
subplot(2,2,3)
f10=plot(t5,zzd1,'g');
hold on
f11=plot(t5,zzd2,'b');
hold on
f12=plot(t5,zzd3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Flexion & Extension ROM C5-C6 model 14')



figure(68)
subplot(2,2,3)
f13=plot(t6,zze1,'g');
hold on
f14=plot(t6,zze2,'b');
hold on
f15=plot(t6,zze3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C5-C6 model 14')


figure(69)
subplot(2,2,3)
f16=plot(t21,zzf1,'g');
hold on
f17=plot(t21,zzf2,'b');
hold on
xlabel('Moment (N-m)')
f18=plot(t21,zzf3,'r');
ylabel('Degrees')
title('Axial Rotation ROM C5-C6 model 14')


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

hold on

figure(71)
f282=plot(t1,zzg2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under flexion/extension (4n4p)')

hold on

figure(72)
f222=plot(t1,zzg3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about z-axis under flexion/extension (4n4p)')

hold on

figure(73)
f230=plot(t2,zzh1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about x-axis under lateral bending (5n5p)')

hold on

figure(74)
f238=plot(t2,zzh2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative ROM about y-axis under lateral bending (5n5p)')

hold on

figure(75)
f256=plot(t2,zzh3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under lateral bending (5n5p)')

hold on

figure(76)
f264=plot(tab6,zzi1,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about x-axis under axial rotation (6n6p)')

hold on

figure(77)
f272=plot(tab6,zzi2,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about y-axis under axial rotation (6n6p)')

hold on

figure(78)
f280=plot(tab6,zzi3,'color',[0.6350, 0.0780, 0.1840]);
xlabel('Moment (N-m)')
ylabel('Degrees')
title('C3-C7 Relative about z-axis under axial rotation (6n6p)')

hold on

% plot data with coupled rotation

figure(79)
subplot(2,2,3)
f20=plot(t1,zzg1,'g');
hold on
f21=plot(t1,zzg2,'b');
hold on
f22=plot(t1,zzg3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
yticks([-40,-35,-30,-25,-20,-15,-10,-5,0,5,10,15,20,25,30,35,40])
title('Flexion/Extension ROM C3-C7 model 14')
legend([f20,f21,f22],'Flexion & Extension','Lateral Bending Coupled Rotation','Axial Rotation Coupled Rotation','location','northwest')

figure(80)
subplot(2,2,3)
f23=plot(t2,zzh1,'g');
hold on
f24=plot(t2,zzh2,'b');
hold on
f25=plot(t2,zzh3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Lateral Bending ROM C3-C7 model 14')


figure(81)
subplot(2,2,3)
f26=plot(tab6,zzi1,'g');
hold on
f27=plot(tab6,zzi2,'b');
hold on
f28=plot(tab6,zzi3,'r');
xlabel('Moment (N-m)')
ylabel('Degrees')
title('Axial Rotation ROM C3-C7 model 14')






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
figure(101)
figure(102)
figure(103)
