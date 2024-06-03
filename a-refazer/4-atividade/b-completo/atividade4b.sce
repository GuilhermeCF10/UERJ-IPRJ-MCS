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

disp("Função de Transferência em Malha Fechada (C(s)/R(s)):");
disp(C_R);

// Plotagem da Resposta em Frequência (Diagrama de Bode)
bode(C_R);

// Plotagem da Resposta ao Degrau
t = 0:0.1:50;  // Define um vetor de tempo de 0 a 50 segundos com passos de 0.1 segundo
step(C_R, t);

// Plotagem da Resposta ao Impulso
impulse(C_R, t);