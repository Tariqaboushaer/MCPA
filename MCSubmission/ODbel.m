set(0, 'DefaultFigureWindowStyle','docked')
set(0, 'defaultaxesfontsize',20)
set(0, 'defaultaxesfontname', 'Times New Roman')
set(0, 'DefaultLineLineWidth', 2);

clear all;
close all;

x=0;
Velocity=0;
Time=0;
Force=1;
mass=1;
dt=1;
nt=1000;
n_p = 1;
Velocity = zeros(n_p,1);
x = zeros(n_p,1);
re = -1.05;

for i = 2:nt
    
    Time(i) = Time(i-1)+dt;
    
    Velocity(:,i)  = Velocity(:,i-1) + Force/mass*dt;
    x(:,i)  = x(:,i-1) + Velocity(:,i-1)*dt + Force/mass*dt^2;
    
    r = rand(n_p,1) < 0.05;
    Velocity(r,i) = re*Velocity(r,i);
    AveV(i,:) = mean(Velocity,2);
    
    subplot(3,1,1),plot(Time,Velocity,'-');hold on
    subplot(3,1,1),plot(Time,AveV,'g*');hold off
    
    xlabel('Time')
    ylabel('V')
    title (['Average v:' num2str(AveV(i))])
    subplot(3,1,2),plot(x(1,:),Velocity(1,:),'r-');hold on
    subplot(3,1,2),plot(x(1,:),AveV,'g*'); hold off
    xlabel('x')
    ylabel('v')
    
    subplot(3,1,3),plot(Time,x,'-');
    xlabel('time')
    ylabel('x')
    
    pause(0.01)
   
end 

   display('Average V')
   mean(Velocity)