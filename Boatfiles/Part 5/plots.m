clc;
close all;

figure
load('data.mat');
plot(data(1,:),data(2,:));
legend('compass'); 


%figure('Name','Bode')
%bode(H_0); grid on; 