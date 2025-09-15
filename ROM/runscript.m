%% runs all files in folder
clear all;
close all;
run('model15_intact_ROM.m')
run('model1_slideslide_tether_ROM.m')
run('model2_slideslide_NoTether_ROM.m')
run('model3_APslide_Tether_ROM.m')
run('model4_APslide_NoTether_ROM.m')
run('model5_LatSlide_Tether_ROM.m')
run('model6_LatSlide_NoTether_ROM.m')
run('model13_fixed_tether_ROM.m')
run('model14_Fixed_NoTether_ROM.m')
