// Definição das variáveis do sistema
m = 10;  // massa
C = 7;   // coeficiente de amortecimento
K = 5;   // constante da mola

// Definindo a função que representa o sistema de equações diferenciais
function dxdt = sistema(t, x)
    dxdt = [x(2); -C/m * x(2) - K/m * x(1)];
endfunction

// Intervalo de tempo para a simulação
t0 = 0; // Tempo inicial
tf = 20; // Tempo final
t = linspace(t0, tf, 1000); // Vetor de tempo

// Condições iniciais
condicoes_iniciais = [
    m/5, m/3;   // Caso 3: x(0) = m/5, dx(0)/dt = m/3
    m/4, 0;     // Caso 2: x(0) = m/4, dx(0)/dt = 0
    0, m/2;     // Caso 1: x(0) = 0, dx(0)/dt = m/2
];

// Executando a simulação para cada caso
for i = 1:3
    x0 = condicoes_iniciais(i, :)'; // Condições iniciais para o caso i (transposto para coluna)
    sol = ode(x0, t0, t, sistema); // Resolvendo a equação diferencial
    
    scf(i); // Cria uma nova figura para cada iteração
    plot(t, sol(1, :), 'b', 'LineWidth', 2);
    xlabel('Tempo (s)');
    ylabel('Deslocamento x(t)');
    title(['Resposta do Sistema para o Caso ', string(i)]);
    legend('x(t)', "location", "best");
    xgrid(); // Ativando grade
end
