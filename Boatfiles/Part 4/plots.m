clc;
close all;

figure
load('part1.mat');
plot(part1(1,:),part1(2,:),part1(1,:),part1(5,:));
legend('compass','rudder input'); 


%figure('Name','Bode')
%bode(H_0); grid on; 