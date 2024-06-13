// Parâmetros do sistema
m = 10;  // massa
c = 7;   // coeficiente de amortecimento
k = 5;   // constante da mola

// Definindo a função de transferência
s = %s;  // Variável complexa s
G = syslin('c', 1 / (m*s^2 + C*s + K));

// Calculando os polos e exibindo
polos = roots(G.den);
disp("Polos da função de transferência:");
disp(polos);

// Parâmetros do sistema de segunda ordem
wn = sqrt(K / m);
zeta = C / (2 * sqrt(m * K));
Kp = 1 / K;  // Ganho estático para a entrada degrau
disp("Frequência natural não-amortecida (wn): " + string(wn));
disp("Coeficiente de amortecimento (zeta): " + string(zeta));
disp("Ganho estático (Kp): " + string(Kp));

// Plotando a resposta ao impulso do sistema
t = 0:0.01:10;
y = csim('imp', t, G);
plot(t, y);
xlabel("Tempo (s)");
ylabel("Resposta ao impulso");
title("Resposta ao impulso do sistema massa-mola-amortecedor");
