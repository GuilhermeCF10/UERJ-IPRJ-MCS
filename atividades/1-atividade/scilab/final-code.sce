// Definição das principais variáveis do sistema físico
m = 10;  // massa
c = 7;   // coeficiente de amortecimento
k = 5;   // constante da mola

// Função que define o sistema de equações diferenciais (EDO) para o modelo massa-mola-amortecedor
function dxdt = sistema(t, x)
  // x(1) representa o deslocamento, x(2) representa a velocidade
  // Esta função retorna a derivada da velocidade e do deslocamento, respectivamente
  dxdt = [x(2); -c/m * x(2) - k/m * x(1)];
endfunction

// Configuração do intervalo de tempo para a simulação
t0 = 0; // Tempo inicial (s)
tf = 20; // Tempo final (s)
t = linspace(t0, tf, 1000); // Cria um vetor de tempo linearmente espaçado para a simulação

// Definição das condições iniciais para cada caso de simulação
condicoes_iniciais = [
  m/5, m/3; // Caso 3: posição inicial (m) e velocidade inicial (m/s)
  m/4, 0;   // Caso 2: posição inicial (m) e velocidade inicial (m/s)
  0, m/2;   // Caso 1: posição inicial (m) e velocidade inicial (m/s)
];

// Cores designadas para cada caso de simulação para facilitar a visualização
cores = ['#007bff', '#dc3545', '#8B4513']; // Azul, vermelho, marrom

// Loop para executar e plotar cada caso de simulação separadamente
for i = 1:3
    x0 = condicoes_iniciais(i, :)'; // Transpõe as condições iniciais para a formatação correta
    sol = ode(x0, t0, t, sistema); // Resolve a EDO usando o método de ODE

    scf(i); // Cria uma nova figura para cada iteração
    plot(t, sol(1, :),  'color', cores(i),  'LineWidth', 2); // Plot do deslocamento x(t)
    xlabel('Tempo (s)'); // Etiqueta do eixo X
    ylabel('Deslocamento x(t)'); // Etiqueta do eixo Y
    title(['Resposta do Sistema para o Caso ', string(i)]); // Título do gráfico
    legend('x(t)', "location", "best"); // Legenda
    xgrid(); // Ativa a grade no gráfico
end

// Preparação do gráfico combinado
scf(); // Cria uma nova figura
clf(); // Limpa a figura atual
xlabel('Tempo (s)');
ylabel('Deslocamento x(t)');
title('Resposta do Sistema para Todos os Casos');
xgrid(); // Ativando a grade

// Execução da simulação para cada caso e plotagem no mesmo gráfico
for i = 1:3
  x0 = condicoes_iniciais(i, :)'; // Condições iniciais para o caso i (transposto para coluna)
  sol = ode(x0, t0, t, sistema); // Resolvendo a equação diferencial

  // Plotando os resultados com cores definidas
  plot(t, sol(1, :), 'color', cores(i), 'LineWidth', 2);
end

// Criar a legenda detalhando cada caso
legend(['Caso 1: x0 = 0, v0 = m/2', 'Caso 2: x0 = m/4, v0 = 0', 'Caso 3: x0 = m/5, v0 = m/3'], "location", "best");
