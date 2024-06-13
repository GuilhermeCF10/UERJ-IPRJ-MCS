clc
clear

s=poly(0,'s')
Equacao=16*s^3+22.8*s^2+7.8*s+5.9 
disp(routh_t(Equacao))

