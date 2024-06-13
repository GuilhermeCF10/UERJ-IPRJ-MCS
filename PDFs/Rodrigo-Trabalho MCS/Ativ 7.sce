clc
clear

s = poly(0,'s');
Up = 1;
Equacao = 16*s^2 + 6.8*s + 1
ftransf = (Up/Equacao)//Função de transferência
B = syslin('c',ftransf)
disp(bode(B))//Função Bode
