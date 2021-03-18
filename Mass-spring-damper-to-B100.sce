//Trabalho-2 - Parte 1. Para b = 100 
//Algoritmo Massa Mola (Vibrações Mecânicas)
clear;
clc;
m1=100;      // Valor da Massa 1 em (N/m)                          
m2=100;      // Valor da Massa 2 em (N/m)                          
k1=100;      // Valor da Constante da mola 1 em (N/m)              
k2=100;      // Valor da Constante da mola 2 em (N/m)              
k3=100;      // Valor da Constante da mola 3 em (N/m)              
b=100;
u=0.1;
x0=[0.1; 0; 0; 0;];      // Condições iniciais para (x1, x2, x3, x4)                          
tempototal=40;           // Em segundos
h=0.001 ;                // Passo de integração/ Tempo de intervalo
n=tempototal / h ;       // Numero de Interações
t=0:h:tempototal;        // Intervalo de Integração
t0=t(1);                 // Valor do Tempo Inicial
function dxdt=dxdt(t,x)
         dxdt=[x(2);
              ((-(k1+k2)*x(1))-(b*x(2))+(k2*x(3))+(b*x(4))+u)/(m1);
               x(4);
              (k2*x(1)+(b*x(2))-((k2+k3)*x(3))-(b*x(4)))/(m2)]        
            

endfunction
x=ode(x0,t0,t,dxdt); //Função que resolve a Equação Diferencial
scf(); //Gráfico
plot(t,x(1, :),'k',t,x(3, :),'r');
legend(['y(m)';'dy/dt(m/s)']);
if u==0 then
    xtitle('Solução com um deslocamento incial 0,1 m em y','t(s)','y(m) e dy/dt(m/s)');
else
    xtitle('Solução com excitação u=0,1 m','t(s)','y(m) e dy/dt(m/s)');
end
