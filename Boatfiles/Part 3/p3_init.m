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

% Part 2
load('wave.mat');
Fs = 10;
window_size = 4096;

[pxx,f] = pwelch(psi_w(2,:)*(pi/180), window_size,[],[],Fs);
omega= 2*pi*f; %rad/s]                  
pxx= pxx./(2*pi); %[s/rad]

%w_0 was identifyd by the plot 
w_0 = 0.7823; 

%Calculating sigma, sigma^2 was the peak value og the plot
sigma= sqrt(0.001484); 

%Finding lamda 
lambda = 0.07;
K_w = 2*lambda*w_0*sigma;

%Part 3
K_pd = 0.8633;
T_f = 8.3909;
T_d = T; 

%Bode 
s = tf('s') ;
H = K_pd*K/ (T_f* s ^2 + s ) ;
%bode (H) ;
%grid on: 
