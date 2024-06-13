// Definição dos parâmetros
M = 10;
C = 7;
K = 5;

// Função de transferência
num = 1;
den = [M, C, K];

// Sistema
sys = syslin('c', num, den);

// Configuração da cor para o plot do LGR
clf();
sgrid();
evans(sys, 3000, 'red');
