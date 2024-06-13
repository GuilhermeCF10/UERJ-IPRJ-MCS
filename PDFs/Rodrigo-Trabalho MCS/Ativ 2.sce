clear 
clc

function [tr,tp,po,ymax,yinf,ts] = ParamResposta(t,y)
// calculando o ponto de maximo e o instante onde o maximo ocorre:
[ymax,i]=max(y);
tp=t(i);
////disp(tp)
// calculando o valor de estado permanente:
yinf=y(size(y,2))
////disp(yinf)
// calculando o percentual de ultrapassagem:
po=(ymax-yinf)/yinf*100
////disp(po)
//calculando o tempo de subida ts
r=1;
while y(r)<yinf; r=r+1; end;
tr=t(r);
////disp(tr)
//calculando o tempo de estabelecimento 2//
r=size(y,2);
while y(r)>0.98*yinf & y(r)<1.02*yinf; r=r-1; end;
ts=t(r-1)
////disp(ts)
endfunction

s=poly(0,'s');
Up=1;
Equacao=16*s^2+6.8*s + 1
ftransf = (Up/Equacao)
G=syslin('c',ftransf)
tp=0:0.01:50;
u=ones(tp); 
x0=[0;0]; 
[y]=csim('step',tp,G); 

xset('thickness',4)
xset('font size',3)
plot2d(tp,y,4)
xtitle('','Decorrência do tempo','Situação da mola')
[tr,tp,po,ymax,yinf,ts] = ParamResposta(tp,y)
disp([tr,tp,po,ymax,yinf,ts])
