clc;
close all;

figure
load('part1.mat');
load('part1_copy');
plot(part1(1,:),part1(2,:),'b');
hold on;
plot(part1_copy(1,:),part1_copy(2,:),'r');
legend('Ship','Model');