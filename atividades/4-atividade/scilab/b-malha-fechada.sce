// Definição dos parâmetros
s = poly(0, 's');
m = 10;  // massa
c = 7;   // coeficiente de amortecimento
k = 5;   // constante da mola

// Definição das funções de transferência
K = m / 3;  // Ganho do controlador proporcional
Ts = m / 6;  // Constante de tempo do sensor

// Funções de Transferência
Gp = syslin('c', 1, m*s^2 + c*s + k);  // Planta
Hs = syslin('c', 1, Ts*s + 1);  // Sensor
Gc = syslin('c', K, 1);  // Controlador Proporcional

// Função de Transferência em Malha Fechada C(s)/R(s)
sys = Gc * Gp / (1 + Gc * Gp * Hs);

// Exibição da Função de Transferência em Malha Fechada
disp("Função de Transferência em Malha Fechada C(s)/R(s):");
disp(sys);