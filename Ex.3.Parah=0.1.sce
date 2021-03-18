//solução através do RK, intervalo h=0.1
clc
clear
yanalitico(1)=1;ya(1)=1;yb(1)=1;yc(1)=1;
h=0.1;
t(1)=0;
tfinal=2;
n=tfinal/h;
for k=1:n-1
t(k+1)=t(k)+h;
//MODO ANALITICO
yanalitico(k+1)=(3/4)*exp(-2*t(k+1))+(1/2)*t(k+1)^2-(1/2)*t(k+1)+(1/4);
//RUNGE KUTTA PRIMEIRA ORDEM
ya(k+1)=ya(k)+h*(-2*ya(k)+(t(k)^2));
//RUNGE KUTTA SEGUNDA ORDEM
yb(k+1)=(yb(k)*(1-h)+(h/2)*(t(k)^2+t(k+1)^2))/(1+h);
//RUNGE KUTTA QUARTA ORDEM
k1=h*((t(k)^2)-2*yc(k));
k2=h*((t(k)+(h/2))^2-2*(yc(k)+(k1/2)));
k3=h*((t(k)+(h/2))^2-2*(yc(k)+(k2/2)));
k4=h*((t(k)+h)^2-2*(yc(k)+k3));
yc(k+1)=yc(k)+(1/6)*(k1+2*k2+2*k3+k4);
end
figure(1)
plot(t,yanalitico,'yo',t,ya,'r',t,yb,'b',t,yc,'g');
legend('Modo Analítico','RK 1','RK 2','RK 4');
title('Exercício 3 - h=0.1')
xlabel('t (s)')
ylabel('y')
