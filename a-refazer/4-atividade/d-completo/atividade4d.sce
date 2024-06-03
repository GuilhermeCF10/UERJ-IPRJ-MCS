// Variação do ganho do controlador e análise de estabilidade
K_values = [m/4, m/3, m/2, 2*m/3, m, 2*m];  // Diferentes valores de ganho Kc
for Kc = K_values
    Gc = Kc;
    Loop = Gc * Gp * H;
    C_R = syslin('c', Loop / (1 + Loop));
    [stab, rh] = routh_t(C_R.den);
    disp("Para Kc = " + string(Kc) + ", o sistema é estável? " + string(stab));
end
