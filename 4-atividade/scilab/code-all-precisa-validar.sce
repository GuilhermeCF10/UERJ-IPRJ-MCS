// Parâmetros do sistema
m = 10;  // Massa
C = 7;   // Coeficiente de amortecimento
K = 5;   // Constante da mola

// Definindo a variável complexa s
s = poly(0, 's');

// Definindo a função de transferência da planta
Gp = syslin('c', 1 / (m*s^2 + C*s + K));

// Criando a função de transferência do controlador proporcional
numc = m/3;  // Numerador do controlador como constante
denc = 1;    // Denominador do controlador como constante
Gc = syslin('c', numc, denc);  // Definindo Gc corretamente

// Criando a função de transferência do sensor
nums = 1;  // Numerador do sensor como constante
dens = 1 + (m/6)*s;  // Denominador do sensor corretamente formado
H = syslin('c', nums, dens);

// Construindo a função de transferência em malha fechada
G_loop = Gc * Gp;  // Malha aberta
G_closed = G_loop / (1 + G_loop * H);  // Malha fechada

// Display das funções de transferência
disp("Função de Transferência da Planta, Gp:");
disp(Gp);

disp("Função de Transferência do Controlador, Gc:");
disp(Gc);

disp("Função de Transferência do Sensor, H:");
disp(H);

disp("Função de Transferência em Malha Fechada, G_closed:");
disp(G_closed);

// Implementação da função Routh-Hurwitz
function R = routh(p)
    n = size(p, '*') - 1; // Ordem do polinômio
    r = ceil((n + 1) / 2); // Número de colunas da matriz de Routh
    R = zeros(n+1, r); // Inicializa a matriz de Routh

    for i = 1:2
        for j = 1:r
            idx = 2*(j-1) + i;
            if idx <= n+1 then
                R(i, j) = p(idx);
            end
        end
    end

    for i = 3:n+1
        for j = 1:r-1
            R(i, j) = -det([R(i-2, 1) R(i-2, j+1); R(i-1, 1) R(i-1, j+1)]) / R(i-1, 1);
        end
        if %all(R(i, :) == 0) then
            R(i, :) = polyder(R(i-1, :)) * (i-1);
        end
    end
endfunction

// Cálculo dos coeficientes do denominador de G_closed
coeffs = horner(G_closed.den, 0); // Extrai os coeficientes do denominador corretamente

// Calcula a matriz de Routh-Hurwitz
RH_matrix = routh(coeffs);

// Display da matriz de Routh-Hurwitz
disp("Matriz de Routh-Hurwitz:");
disp(RH_matrix);

// Verificando a estabilidade do sistema
is_stable = min(RH_matrix(:, 1)) > 0;
if is_stable then
    disp("O sistema é estável.");
else
    disp("O sistema é instável.");
end

// Definindo um intervalo para o ganho do controlador Kp
Kp_min = 1;
Kp_max = 10;
Kp_step = 1;

scf();
clf(); // Limpa a figura atual
legends = [];
colors = jet(Kp_max - Kp_min + 1); // Usando a paleta de cores 'jet' para cores distintas

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
