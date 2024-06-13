clc
clear

s=poly(0,'s');

Up = 1;
Equacao= 16*s^2 + 6.8*s + 1 ;
ftransf = (Up/Equacao);
eq = syslin('c', ftransf) 

clf();
evans(eq,10); // função para achar evans
sgrid(); 
[Ki,s]=kpure(eq)
plot([real(s) real(s)],[imag(s) -imag(s)],'*r') // Plot
[Kr,s]=krac2(eq)
