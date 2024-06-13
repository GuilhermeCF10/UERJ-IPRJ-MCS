clc
clear

s=poly(0,'s');
Up = 1;
Equacao = 16*s^2 + 6.8*s + 1;
ftransf = (Up/Equacao);
N=syslin('c',ftransf); //Monta a equação
nyquist(N,0.01,150,N);//Função Nyquist


