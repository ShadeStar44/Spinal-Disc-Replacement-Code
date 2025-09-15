clear all
clf
%% This script shows the foreman height and width relative to two consistent node pairs
% The foreman height(U,L) and width(I,O) was found by finding the magnitude of displacement of the upper nodes (U,I) minus the magnitude of displacement of the lower nodes (L,O) 
% in the ODB field output, then by subtracting off the first y-coordinate.
% **first coordinate was added back on because it is necessary to know
% **initial displacement between the two nodes
% These operations were done in the Abaqus ODB files and the resultant difference in displacement magnitudes are plotted below.
%% Starting with the intact spine
%% model - TLC_4N, location: C4/C5 Right Hand Foreman
T1=[2,2.0575,2.1047,2.15542,2.20202,2.25165,2.30686,2.35157,2.40206,2.45083,2.50483];
%nodes: 40272U,62515L
%**this model only runs to 50%, time2 is required for now**
A=0.295782+[2.23517E-006,-0.0935737,-0.00208297,0.268123,0.537532,0.821969,1.15291,1.42357,1.73227,2.01761,2.28568];
figure(1)
plot(T1,A,'k')
hold on
%nodes: 40374I,65927O
AA=0.233484+[3.45707E-006,-0.0713887,-0.0262132,0.0792606,0.222384,0.379891,0.565561,0.711483,0.872954,1.02322,1.15847];
plot(T1,AA,'b')
xlabel('Time (s)')
ylabel('Relative Displacement (mm)')
legend('Height disp', 'Width disp','location','southeast' )
title('TLC_4_N, C4/C5 Right Hand Foreman')
%% model TLC_4P, location: C4/C5 Right Hand Foreman
T2=[2,2.0575,2.1047,2.15542,2.20899,2.25434,2.30803,2.35883,2.40461,2.45206,2.5051,2.55493,2.60055,2.6508,2.70761,2.75783,2.80375,2.85877,2.90932,2.95288,3];
%nodes: 40272U/62515L
B=0.295782+[2.38419E-007,0.167684,0.274214,0.395584,0.539983,0.684756,0.710041,0.816469,0.941428,1.04463,1.12985,1.20637,1.28979,1.37198,1.46714,1.55143,1.65088,1.70346,1.80529,1.86757,1.93172];
%nodes: 40374I,65927O
BB=0.233484+[3.8445E-006,0.124264,0.189269,0.257327,0.337738,0.415324,0.428668,0.485043,0.550797,0.604407,0.648266,0.6874,0.729596,0.770902,0.818492,0.860101,0.908376,0.933716,0.982515,1.01208,1.04251];
figure(2)
plot(T2,B,'k')
hold on
plot(T2,BB,'b')
xlabel('Time (s)')
ylabel('Relative Displacement (mm)')
legend('Height disp', 'Width disp','location','southeast' )
title('TLC_4_P, C4/C5 Right Hand Foreman')
%% model - TLC_5N, Location: C4/C5 Right Hand Foreman
T3=[2,2.0575,2.10375,2.15062,2.20072,2.26757,2.30624,2.35024,2.40593,2.45239,2.51131,2.56239,2.61382,2.65198,2.70613,2.75565,2.80324,2.85205,2.90639,2.95374,3];
%nodes: 40272U/62515L
C=0.295782+[2.38419E-007,0.0543331,0.13132,0.256952,0.433529,0.698412,0.854248,1.02694,1.24011,1.40481,1.57667,1.71165,1.83316,1.90288,1.99491,2.07429,2.14719,2.21857,2.2925,2.3536,2.41185];
%nodes: 40374I,65927O
CC=0.233484+[-1.49012E-007,0.0690432,0.128929,0.201513,0.279864,0.371678,0.429336,0.504408,0.60369,0.686569,0.77679,0.848692,0.911809,0.942634,0.984904,1.02097,1.05342,1.08469,1.11517,1.13938,1.16281];
figure(3)
plot(T3,C,'k')
hold on
plot(T3,CC,'b')
xlabel('Time (s)')
ylabel('Relative Displacement (mm)')
legend('Height disp', 'Width disp','location','southeast' )
title('TLC_5_N, C4/C5 Right Hand Foreman')
%% model - TLC_5P, Location: C4/C6 Right Hand Foreman
T4=[2,2.0575,2.12605,2.15275,2.21233,2.25121,2.30204,2.36312,2.40096,2.45209,2.50097,2.55317,2.60321,2.65826,2.70492,2.75514,2.80039,2.85766,2.90816,2.95077,3];
%nodes: 40272U/62515L
D=0.295782+[2.23517E-006,-0.00796267,0.027803,0.0619822,0.187121,0.295963,0.44114,0.623309,0.73259,0.865031,0.970009,1.05199,1.12558,1.20303,1.26688,1.33234,1.3896,1.46228,1.52537,1.57699,1.63586];
%nodes: 40374I,65927O
DD=0.233484+[-1.49012E-007,-0.0520616,-0.0706142,-0.0570326,0.0159961,0.0855043,0.178274,0.296458,0.367188,0.452984,0.522815,0.578306,0.628354,0.679704,0.722072,0.766392,0.805307,0.854844,0.897866,0.933016,0.973069];
figure(4)
plot(T4,D,'k')
hold on
plot(T4,DD,'b')
xlabel('Time (s)')
ylabel('Relative Displacement (mm)')
legend('Height disp', 'Width disp','location','southeast' )
title('TLC_5_P, C4/C5 Right Hand Foreman')
%% model - TLC_6N, Location: C4/C6 Right Hand Foreman
T5=[2,2.0575,2.1047,2.15542,2.22863,2.25714,2.30685,2.35082,2.40011,2.45711,2.51234,2.55752,2.6058,2.65799,2.70027,2.75081,2.80824,2.88338,2.91463,2.95331,3];
%nodes: 40272U/62515L
E=0.295782+[2.38419E-007,0.00397786,0.0215472,0.0766689,0.188029,0.232965,0.307588,0.370243,0.434877,0.507961,0.574862,0.626095,0.676847,0.726672,0.765996,0.813523,0.865692,0.927177,0.950667,0.978628,1.01077];
%nodes: 40374I,65927O
EE=0.233484+[3.8445E-006,0.0389452,0.0674813,0.109218,0.180727,0.208073,0.253136,0.291171,0.330641,0.377786,0.422534,0.45807,0.49417,0.530754,0.560678,0.597284,0.638042,0.687809,0.707244,0.730532,0.757688];
figure(5)
plot(T5,E,'k')
hold on
plot(T5,EE,'b')
xlabel('Time (s)')
ylabel('Relative Displacement (mm)')
legend('Height disp', 'Width disp','location','southeast' )
title('TLC_6_N, C4/C5 Right Hand Foreman')
%% model - TLC_6P, Location: C4/C6 Right Hand Foreman
T6=[2,2.0575,2.1047,2.15542,2.20899,2.25434,2.30803,2.35883,2.40461,2.45206,2.5051,2.55493,2.60055,2.6508,2.70761,2.75783,2.80375,2.85877,2.90932,2.95288,3];
%nodes: 40272U/62515L
F=0.295782+[2.23517E-006,0.0291923,0.0843093,0.174887,0.265728,0.336436,0.420166,0.493606,0.557981,0.621143,0.685417,0.741683,0.79173,0.845292,0.904242,0.954612,0.999579,1.05227,1.09895,1.13794,1.179];
%nodes: 40374I,65927O
FF=0.233484+[3.8445E-006,-0.0287753,-0.033273,-0.00656912,0.0286312,0.060518,0.103727,0.143233,0.178373,0.212637,0.24582,0.273751,0.297794,0.322755,0.349612,0.372499,0.392524,0.415513,0.435209,0.451273,0.46792];
figure(6)
plot(T6,F,'k')
hold on
plot(T6,FF,'b')
xlabel('Time (s)')
ylabel('Relative Displacement (mm)')
legend('Height disp', 'Width disp','location','southeast' )
title('TLC_6_P, C4/C5 Right Hand Foreman')
%% Below will attempt to find the % difference of the difference in displacement magnitudes 
% of the intact model with the slideslide_tether model
%% model - SlideSlide_tether_4N
T7=[2,2.05126,2.11533,2.16533,2.2247,2.26689,2.32627,2.36846,2.42783,2.4542,2.50615,2.55076,2.60453,2.65273,2.70062,2.75176,2.80444,2.85837,2.91342,2.96196,3];
%nodes: 40272U/62515L
G=[0.416245,0.465366,0.416847,0.336751,0.305337,0.386905,0.556394,0.677582,0.843202,0.913933,1.0493,1.16061,1.28984,1.40158,1.50933,1.62092,1.73185,1.84121,1.94778,2.03829,2.10666];
%nodes: 40374I,65927O
GG=[0.234507,0.372261,0.347852,0.317779,0.359109,0.469446,0.559537,0.60165,0.669451,0.700441,0.763024,0.817041,0.879874,0.934076,0.986586,1.04156,1.09607,1.14939,1.20087,1.24409,1.27626];
figure(7)
plot(T7,G,'k')
hold on
plot(T7,GG,'b')
xlabel('Time (s)')
ylabel('Relative Displacement (mm)')
legend('Height disp','Width disp', 'location','southeast')
title('SlideSlide/tether, C4/C5 Right Hand Foreman')
%% model - SlideSlide_tether_4P, Location: C4/C5 Right Hand Foreman
T8=[0];
%% model - SlideSlide_tether_5N, Location: C4/C5 Right Hand Foreman
T9=[2,2.05126,2.11533,2.16533,2.2247,2.25107,2.30644,2.35622,2.40972,2.46023,2.50711,2.55164,2.60232,2.65142,2.72191,2.77012,2.80437,2.86374,2.90593,2.9903,3];
%nodes: 40272U/62515L
H=[0.416245,0.500828,0.592843,0.6945,0.811243,0.863854,0.978882,1.08647,1.20538,1.32394,1.43935,1.54759,1.6762,1.8073,1.99637,2.11333,2.19185,2.32184,2.40617,2.55556,2.57195];
%nodes: 40374I,65927O
HH=[0.234507,0.421387,0.528381,0.61119,0.690811,0.72412,0.791327,0.847895,0.902591,0.951162,0.995774,1.0327,1.07586,1.12132,1.19528,1.24043,1.27144,1.32441,1.3587,1.41514,1.42121];
figure(9)
plot(T9,H,'k')
hold on
plot(T9,HH,'b')
xlabel('Time (s)')
ylabel('Relative Displacement')
title('SlideSlide/tether, C4/C5 Right Hand Foreman')
legend('Height disp', 'Width disp', 'location','southeast')
% not sure if percent difference will work due to different time increments
% used
HHH=abs((C-H)./((C+H)/2))*100;
HHHH=((CC-HH)./((CC+HH)/2))*100;
figure(10)
plot(T9,HHH,'k')
hold on
plot(T9,HHHH,'b')
