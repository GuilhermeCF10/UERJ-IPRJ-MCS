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

// Diagrama de Nyquist
clf();
nyquist(sys);

// Parte 2 do código onde ele fornece outra visualização

// Definição dos parâmetros
M = 10;
C = 7;
K = 5;

// Função de transferência
num = 1;  // Numerador é um polinômio constante
den = [M, C, K];  // Coeficientes do denominador
den_poly = poly(den, 's', 'coeff');  // Criação do polinômio do denominador

// Sistema
sys = syslin('c', num, den_poly);  // Criação do sistema

// Limpa a figura atual
clf();

// Diagrama de Nyquist
nyquist(sys);  // Gera o diagrama de Nyquist

// Plotagem dos Polos e Zeros
plzr(sys);  // Plota polos e zeros

// Definindo os limites de zoom para garantir que os polos sejam visíveis
zoom_rect([-0.8 -2 0.2 2]);  // Ajusta a visualização para um intervalo que inclua os polos

// Adicionais: Configuração do Gráfico
xgrid();  // Adiciona grade ao gráfico
xtitle('Diagrama de Nyquist com Polos', 'Parte Real', 'Parte Imaginária');  // Título e labels dos eixos
