clc;
close all;

figure('Name','5 c)');
load('data.mat');
plot(data(1,:),data(2,:),data(1,:),data(6,:));
legend('without Kalman','with Kalman'); 

figure('Name','5 d)');
load('dataPD.mat');
plot(dataPD(1,:),dataPD(5,:),dataPD(1,:),dataPD(2,:),dataPD(1,:),dataPD(7,:));
legend('rudder input','y measured','bias');

figure('Name','5 e)');
plot(dataPD(1,:),dataPD(5,:),dataPD(1,:),dataPD(7,:));
hold on;
plot(dataPD(1,:),dataPD(2,:),dataPD(1,:),dataPD(6,:));
legend('rudder input','bias',' y measured','y estimated');