clc;close all;clear all;
%% Modify
particles=36   ;                        %Numbers of agent
mult=9     ;                            %dimantion of function

w=0.4;
c1=1.5;
c2=1.5;
dt=1;
times=1;

%%¡@Assign initial agent
    
for i =(1:particles)

    for j =1:mult
        z(j)=rand()*10;
        rnum(j)=(rand()*2-1);
    end
    x(i,:)=(z);
    y(i)=(fitness(x,i));
    v(i,:)=(rnum);
    fitnesspbest(i,:)=(y(i));
end
pbest=x;
fitnessgbest=min(y);
gbest=x(y==fitnessgbest,:);

%% Iteration

while times<31
    for i = (1:(particles))
        y(i)=fitness(x,i)   ; 
        if (y(i)<fitnessgbest)
            fitnessgbest=y(i);
            for j =(1:mult)
                gbest(j)=x(i,j);
            end
        end
        if y(i)<fitnesspbest(i)
            fitnesspbest(i)=y(i);
            for j =(1:mult)
                pbest(i,j)=x(i,j);
            end
        end
        for (j =1:mult)
            v(i,j)=w*v(i,j)+c1*rand()*(pbest(i,j)-x(i,j))+c2*rand()*(gbest(j)-x(i,j));
            x(i,j)=x(i,j)+v(i,j)*dt;
        end
    end
    %avg=float(sum(y))/len(y) if len(y)> 0 else float('nan')     
    avg=0;
    for i=1:particles
        avg=avg+(y(i)/particles);
    end
    aG(times)=(avg);
    G(times)=(fitnessgbest);
    t(times)=(times);
    times=times+1 ;
end
%%¡@Ploting  

figure(2) 
plot(t,G,'b',t,aG,'r','Linewidth',1.5)
ylabel('Fitness','Fontsize',10,'FontName','Times New Roman')
xlabel('Iterations','Fontsize',10,'FontName','Times New Roman')
legend('Best Fitness','Average Fitness')
axis([0,30,0,150])

fprintf("fitness=%f\n",fitnessgbest);
fprintf("x1=%f\n",gbest(1))
fprintf("x2=%f\n",gbest(2))
fprintf("x3=%f\n",gbest(3))
fprintf("x4=%f\n",gbest(4))
fprintf("x5=%f\n",gbest(5))
fprintf("x6=%f\n",gbest(6))
fprintf("x7=%f\n",gbest(7))
fprintf("x8=%f\n",gbest(8))
fprintf("x9=%f\n",gbest(9))