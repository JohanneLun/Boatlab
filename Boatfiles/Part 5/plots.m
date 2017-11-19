%% Plot for Kalman :
clc;
close all;

figure('Name','5 c)');
load('data.mat');
plot(data(1,:),data(2,:),data(1,:),data(6,:));
legend('without Kalman','with Kalman'); 
xlabel('Time (s)'); ylabel('Degrees');
grid on; 

%% Plot for 5d
figure('Name','5 d)');
load('dataPD.mat');
plot(dataPD(1,:),dataPD(5,:),dataPD(1,:),dataPD(2,:),dataPD(1,:),dataPD(7,:));
legend('rudder input','measured compass course','estimated bias');
title('With current disturbance');
xlabel('Time (s)'); ylabel('Degrees');
grid on; 

figure('Name','5 e)');
load('dataPDe.mat')
plot(dataPDe(1,:),dataPDe(5,:),dataPDe(1,:),dataPDe(7,:));
hold on;
plot(dataPDe(1,:),dataPDe(2,:),dataPDe(1,:),dataPDe(6,:));
legend('rudder input','estimated bias',...
    'measured compass course','estimated compass course');
title('with wave disturbance');
xlabel('Time (s)'); ylabel('Degrees');
grid on; 