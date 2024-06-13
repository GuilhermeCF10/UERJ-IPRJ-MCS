// Definicao dos parametros
M = 10;
C = 7;
K = 5;

// Funcao de transferencia
num = 1;  // Numerador é um polinômio constante
den = [M, C, K];  // Coeficientes do denominador
den_poly = poly(den, 's', 'coeff');  // Criação do polinômio do denominador

// Sistema
sys = syslin('c', num, den_poly);  // Correção na criação do sistema

// Diagrama de Bode
clf();
bode(sys);
