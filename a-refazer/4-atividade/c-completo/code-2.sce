// Definição dos parâmetros
s = poly(0, 's');
m = 10;
C = 7;
K = 5;
Kc = m / 3;  // Ganho do controlador
Ts = m / 6;  // Constante de tempo do sensor

// Função de transferência da Planta (Gp)
Gp = syslin('c', 1 / (m*s^2 + C*s + K));

// Função de transferência do Controlador (Gc)
Gc = Kc;

// Função de transferência do Sensor (H)
H = syslin('c', 1 / (Ts*s + 1));

// Função de Transferência em Malha Fechada (C/R)
Loop = Gc * Gp * H;
C_R = syslin('c', Loop / (1 + Loop));

// Análise de estabilidade usando Routh-Hurwitz
[stab, rh] = routh_t(C_R.den);

disp("Matriz de Routh-Hurwitz:");
disp(rh);
disp("O sistema é estável? " + string(stab));

// Plotagem dos Polos e Zeros
plzr(C_R);
