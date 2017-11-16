clc;
close all;

load('data.mat');
load('data1.mat');
load('data2.mat');

figure
plot(data(1,:),data(6,:),'r--'); hold on;
plot(data(1,:),data(2,:),'b'); hold on;
plot(data(1,:),data(5,:));
xlabel('Time (s)'); ylabel('Degrees');
legend('Reference','Compass course','Rudder input')
title('With wave disturbance');
%figure('Name','Bode')
%bode(H_0); grid on; 
