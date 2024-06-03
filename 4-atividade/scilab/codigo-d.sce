// Parâmetros do sistema
m = 10;  // Massa
C = 7;   // Coeficiente de amortecimento
K = 5;   // Constante da mola

// Definindo a variável complexa s
s = poly(0, 's');

// Definindo a função de transferência da planta
Gp = syslin('c', 1 / (m*s^2 + C*s + K));

// Inicializando a figura para plotagem múltipla
scf();
clf(); // Limpa a figura atual
legends = [];
colors = jet(Kp_max - Kp_min + 1); // Usando a paleta de cores 'jet' para cores distintas

// Definindo um intervalo para o ganho do controlador Kp
Kp_min = 1;
Kp_max = 10;
Kp_step = 1;

disp("Análise de estabilidade para diferentes valores de Kp:");
for Kp = Kp_min:Kp_step:Kp_max
    // Atualizando o ganho do controlador
    numc = Kp;  // Atualiza o numerador do controlador para o novo Kp como constante
    denc = 1;    // Denominador do controlador como constante
    Gc = syslin('c', numc, denc);  // Recria a função de transferência do controlador com novo ganho

    // Recalcula a função de transferência em malha fechada
    G_loop = Gc * Gp;
    G_closed = G_loop / (1 + G_loop * H);

    // Calcula resposta ao degrau
    t = 0:0.1:20; // Define um vetor de tempo de 0 a 20 segundos
    y = csim('step', t, G_closed); // Calcula a resposta ao degrau

    // Plotagem
    plot(t, y, 'color', colors(Kp, :)); // Plota a resposta ao degrau com cores diferentes
    legends($+1) = "Kp = " + string(Kp); // Adiciona legenda para cada curva
end

// Adicionando legendas e rótulos
legend(legends);
xtitle('Resposta ao degrau para diferentes valores de Kp', 'Tempo (s)', 'Amplitude');
