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

figure
plot(omega, pxx);
hold on;
%w_0 was identifyd by the plot 
w_0 = 0.7823; 

%Calculating sigma, sigma^2 was the peak value og the plot
sigma= sqrt(0.001484); 

%Finding lamda 
lambda = 0.07;
K_w = 2*lambda*w_0*sigma;

ss = (K_w^2*omega.^2)./(omega.^4+w_0^4 +2*omega.^2*w_0^2*(-1+2*lambda^2));
plot(omega,ss);
legend('pxx','P with chosen lambda');

%Part 3
K_pd = 0.8363;
T_f = 8.3909;
T_d = T; 
%K = 0.1561 calculated in part 1
x= K_pd*K*T_d;
y = K*K_pd;
z= T*T_f; 
i= T_f+T; 
H_0= tf([x y],[z i 1 0]);



%Part 4
A=[0 1 0 0 0; 
 -w_0 -2*lambda*w_0 0 0 0 ;
0 0 0 1 0;
0 0 0 -1/T -K/T;
0 0 0 0 0;]; 
B= [0 0 0 K/T 0]'; 
E= [0 0; 
    K_w 0;
    0 0; 
    0 0;
    0 1;]; 
C= [ 0 1 1 0 0 0]; 

