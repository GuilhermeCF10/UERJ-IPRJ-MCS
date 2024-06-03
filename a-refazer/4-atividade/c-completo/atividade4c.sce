// Análise de estabilidade usando Routh-Hurwitz
[stab, rh] = routh_t(C_R.den);

disp("Matriz de Routh-Hurwitz:");
disp(rh);
disp("O sistema é estável? " + string(stab));

