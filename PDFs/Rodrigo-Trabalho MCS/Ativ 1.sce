
clc;
clear;

s = poly(0,'s')
Up = 1;
Equacao = (16*s^2 + 6.8*s + 1);
raizes=roots(Equacao); 
H = syslin([],Up,Equacao);
disp(H)
disp(raizes)
figure(0);
clf();
plzr(H);


