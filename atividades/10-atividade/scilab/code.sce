// Definicao dos parametros
M = 10;
C = 7;
K = 5;

// Funcao de transferencia
num = [0 0 1];  // Numerador é um polinômio constante representado como [0 0 1]
den = [M, C, K];  // Coeficientes do denominador

// Sistema
sys = syslin('c', num, den);  // Correção na criação do sistema

// Resposta ao degrau
clf();
t = 0:0.01:10;  // Definindo o tempo de simulação
[y, x] = csim('step', sys, t);  // Resposta ao degrau
plot(t, y);
xlabel('Tempo (s)');
ylabel('Resposta ao Degrau');
title('Resposta ao Degrau Unitário do Sistema');
