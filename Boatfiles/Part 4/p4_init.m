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
%w_0 was identifyd by the plot 
w_0 = 0.7823; 

%Calculating sigma, sigma^2 was the peak value og the plot
sigma= sqrt(0.001484); 

%Finding lamda 
lambda = 0.07;
K_w = 2*lambda*w_0*sigma;

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
A=[0 1 0 0 0; -w_0^2 -2*lambda*w_0 0 0 0 ;
0 0 0 1 0; 0 0 0 -1/T -K/T; 0 0 0 0 0;]; 
B= [0 0 0 K/T 0]'; 
E= [0 0; K_w 0; 0 0; 0 0; 0 1]; 
C= [ 0 1 1 0 0]; 

% No distubance 
A_b = [0 1; 0 -1/T]; 
B_b = [0 K/T]'; 
C_b = [1 0]; 
obs_b = obsv(A_b, C_b); 
rank(obs_b);

%With current 
A_c = [0 1 0; 0 -1/T -K/T; 0 0 0;]; 
B_c = [0 K/T 0]';
E_c = [ 0 0; 0 0; 0 1]; 
C_c = [1 0 0];  
obs_c = obsv(A_c, C_c);
rank(obs_c); 

%With wave disturbance
A_d = [0 1 0 0; -w_0^2 -2*lambda*w_0 0 0 ;
    0 0 0 1; 0 0 0 -1/T;]; 
c_d = [0 1 1 0]; 
obs_d = obsv(A_d, c_d);
rank(obs_d);

%With current and wave disturbance 
obs_d = obsv(A,C);
rank(obs_d);
    