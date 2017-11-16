clc;
close all;

figure
load('part1.mat');
load('part1_copy');
plot(part1_copy(1,:),part1_copy(2,:),'r');
hold on;
plot(part1(1,:),part1(2,:),'b');
xlabel('Time (s)'); ylabel('Degrees');
legend('Model','Ship');
title('Compass course');