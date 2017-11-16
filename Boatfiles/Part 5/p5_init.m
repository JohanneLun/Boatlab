clc;
clear all;
close all;

% Initialization
%   From Part 1
om1 = 0.005;    om2 = 0.05;
A1 = 29.354;    A2 = 0.831;
T_sqr = (A2^2*om2^2 - A1^2*om1^2) / (A1^2*om1^4 - A2^2*om2^4);
T = sqrt(T_sqr);
K = A1*om1*sqrt(T^2*om1^2 + 1);

%Part 2
w_0 = 0.7823;
lambda = 0.07;
sigma = sqrt(0.001484);
K_w = 2*lambda*w_0*sigma;

%Part 3
K_pd = 0.8363;
T_f = 8.3909;
T_d = T; 
%K = 0.1561 calculated in part 1
x = K_pd*K*T_d;
y = K*K_pd;
z = T*T_f; 
i = T_f+T; 
H_0 = tf([x y],[z i 1 0]);

%Part 4
A = [0 1 0 0 0; -w_0^2 -2*lambda*w_0 0 0 0 ; 0 0 0 1 0;
0 0 0 -1/T -K/T; 0 0 0 0 0;]; 
B = [0 0 0 K/T 0]'; 
E = [0 0; K_w 0; 0 0; 0 0; 0 1;]; 
C = [ 0 1 1 0 0]; 

%Part 5 
Fs = 10; %Hz
Ts = 1/Fs;

% a) discretization
[Ad, Bd] = c2d(A,B,Ts); 
[Ad, Ed] = c2d(A,E,Ts); 

% b) variance of measurement noise
    %load ('data.mat'); 
    %compass_data = data(2,:); %compass(deg)
    %mes_var = var(compass_data*pi/180); % Measurment noice in radians
mes_var = 6.0813e-07;
% c) 
R = mes_var/Ts;
P0_pri = [1 0 0 0 0; 0 0.013 0 0 0; 0 0 pi^2 0 0;
    0 0 0 1 0; 0 0 0 0 2.5e-3];
x0_pri = [0 0 0 0 0]';
Q = [30 0; 0 1e-6];
I = eye(5);
ks = struct('Ad',Ad,'Bd',Bd,'C',C,'Ed',Ed,'R',R,'Q',Q,'I',I,'P0_pri',P0_pri,'x0_pri',x0_pri);