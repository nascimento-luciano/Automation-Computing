//Código Scilab para RK1, RK2 e Rk4.

//Resolução do exercício 1
//Plot com h=0.1 && 0.01 && 0.001
clear;
h=0.1;//intervalo
t=0;//Variável do exercício

ya(1)=1;//Forma analítica
y1(1)=1;//RK1
y2(1)=1;//RK2
y4(1)=1;//RK4

tempototal=2;//em segundos
n=tempototal/h;//quantidade de interações
for k=1:n-1
    t(k+1)=t(k)+h;
    //Forma analítica
    ya(k+1)=exp(((t(k+1)^4)/4)-(1.5*t(k+1)));
    //Para Rk1
    y1(k+1)=y1(k)+h*y1(k)*((t(k)^3)-1.5);
    //RK2
    y2(k+1)=y2(k)*((2+h*((t(k)^3)-1.5))/(2-h*((t(k+1)^3)-1.5)));
    //RK4
    k1=h*y4(k)*((t(k)^3)-1.5);
    k2=h*(y4(k)+0.5*k1)*(((t(k)+0.5*h)^3)-1.5);
    k3=h*(y4(k)+0.5*k2)*(((t(k)+0.5*h)^3)-1.5);
    k4=h*(y4(k)+k3)*(((t(k)+h)^3)-1.5);
    y4(k+1)=y4(k)+(1/6)*(k1+2*k2+2*k3+k4);
    end
plot(t,ya,'ok',t,y1,'b',t,y2,'*k',t,y4,'r');
legend('Forma analítica','RK1','RK2','RK4','pos',2);
xtitle('Exercício 1 / h=0.1','t(s)','y');
