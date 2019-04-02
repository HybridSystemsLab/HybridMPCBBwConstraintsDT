clc
clear all
close all

%% initial variables

N = 60;     % length of prediction horizon
s = 0.04;    % step size
gamma = 9.8;
lambda = 0.8;
h = 2; 
x0 = [1;5];
%x0=[5;5];
%x0=[4;1];

alpha = 1e-2;   % scaling parameter
xmpc=[];
[xpred1] =prediction(N,s,gamma,lambda,h,x0,alpha);
xmpc=[xmpc,xpred1]
x0=xmpc(:,end)
[xpred2] =prediction(N,s,gamma,lambda,h,x0,alpha);
xmpc=[xmpc,xpred2]
x0=xmpc(:,end)
[xpred3] =prediction(N,s,gamma,lambda,h,x0,alpha);
xmpc=[xmpc,xpred3] 
%%
figure(1), clf
plot(0:s:s*(3*N+2),xmpc(1,:),'o'), hold on, grid on
plot(0:s:s*(3*N+2),zeros((3*N+3),1),'k-')
plot(0:s:s*(3*N+2),h*ones((3*N+3),1),'r--')
yl = ylim
ylim(1.5*yl)
xlim([0,5])
xlabel('l'), ylabel('x_1(l)')