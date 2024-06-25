// Definição dos parâmetros
M = 10;
C = 7;
K = 5;

// Funcao de transferencia
num = 1;  // Numerador é um polinômio constante
den = [M, C, K];  // Coeficientes do denominador como vetor
den_poly = poly(den, 's', 'coeff');  // Criação do polinômio do denominador com os coeficientes

// Sistema
sys = syslin('c', num, den_poly);  // Cria o sistema com a função de transferência

// Configuração da cor para o plot do LGR
scf();  // Cria uma nova figura gráfica
clf();  // Limpa a figura
sgrid();  // Adiciona uma grade ao gráfico

// Configurações de visualização de linha
xset("line style", 4);  // Define o estilo da linha (ex: 4 - pontilhada)
xset("thickness", 3);  // Define a espessura da linha
xset("foreground", 5);  // Define a cor da linha (ex: 5 - vermelho)

// Plotando o LGR com 50 pontos de discretização
evans(sys, 50);  // Plota o LGR

// Ajustes finais no gráfico
xtitle("Lugar Geométrico das Raízes (LGR)", "Re(s)", "Im(s)");  // Adiciona título e rótulos aos eixos

// Anotações para polos
polos = roots(den_poly);  // Calcula os polos do sistema
for i = 1:size(polos, "r")
    // Adiciona anotações para cada polo no gráfico
    xstring(real(polos(i)), imag(polos(i)), "Polo: "+string(polos(i)));
end

// Ajusta a visualização para um intervalo que inclua os polos
zoom_rect([-1.8, -2.5, 0.2, 2.5]);