import pandas as pd
import numpy as np
import matplotlib as plt

%% Facet Contact Force Magnitude
% 4 P/N Intact 
% file = 4NP_facetForceMagnitude.xls
figure (1)

Data = pd.read_excel('4NP_facetForceMagnitude.xlsx', header = none);  
moment=Data(:,2);
C6LR=Data(:,3);
C6LL=Data(:,6);
C5LR=Data(:,9);
C5LL=Data(:,12);
C4LR=Data(:,15);
C4LL=Data(:,18);
C3LR=Data(:,21);
C3LL=Data(:,24);



xlim([-2 2])
xlabel('Moment (Nm)')
ylabel('Newtons')
title({'Facet Force Magnitude(CFNM) for Intact model','under Flexion/Extention(4P/4N)'})
legend('C6LR','C6LL','C5LR','C5LL','C4LR','C4LL','C3LR','C3LL','location','north')


