// Definição dos parâmetros
s = poly(0, 's');
m = 10;
C = 7;
K = 5;
Ts = m / 6;  // Constante de tempo do sensor

// Função de transferência da Planta (Gp)
Gp = syslin('c', 1 / (m*s^2 + C*s + K));

// Função de transferência do Sensor (H)
H = syslin('c', 1 / (Ts*s + 1));

// Variação do ganho do controlador e análise de estabilidade
K_values = [m/4, m/3, m/2, 2*m/3, m, 2*m];  // Diferentes valores de ganho Kc
for Kc = K_values
    Gc = Kc;
    Loop = Gc * Gp * H;
    C_R = syslin('c', Loop / (1 + Loop));
    [stab, rh] = routh_t(C_R.den);
    
    // Plotagem dos Polos e Zeros para cada Kc
    scf(); // Cria uma nova janela gráfica para cada iteração
    plzr(C_R);
    xtitle(sprintf("Polos e Zeros para Kc = %g", Kc));
    
    disp("Para Kc = " + string(Kc) + ", o sistema é estável? " + string(stab));
end
