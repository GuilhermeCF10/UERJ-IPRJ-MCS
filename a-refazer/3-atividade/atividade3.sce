// Define a variável 's' como polinômio para construir expressões dependentes do tempo
s = poly(0, 's');  

// Define os parâmetros do sistema massa-mola-amortecedor
m = 10;  // Massa
C = 7;   // Coeficiente de amortecimento
K = 5;   // Constante da mola

// Cria a função de transferência do sistema
G = syslin('c', 1 / (m*s^2 + C*s + K));  

// Encontra os polos da função de transferência utilizando as raízes do denominador
polos = roots(G.den);  

// Calcula a frequência natural do sistema
wn = sqrt(K / m);  

// Calcula o fator de amortecimento do sistema
zeta = C / (2 * sqrt(m * K));  

// Determina a constante proporcional do sistema
Kp = K / m;  

// Plota o diagrama de Bode do sistema para analisar as frequências
bode(G);  

// Prepara para a simulação da resposta ao impulso
// Define um vetor de tempo de 0 a 10 segundos com incrementos de 0.01 segundos
t = 0:0.01:10;  

// Cria um vetor de impulso unitário onde o impulso ocorre no tempo zero
u = [1 zeros(1, length(t)-1)];  // Definindo o impulso apenas no início

// Calcula a resposta ao impulso utilizando a função de simulação 'csim'
y = csim(u, t, G);  

// Plota a resposta ao impulso
plot(t, y);  
