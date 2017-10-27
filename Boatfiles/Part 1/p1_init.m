clc;
clear all;
close all;

% Initialization
om1 = 0.005;
om2 = 0.05;

% b) calculating paramteres K and T

% Observed amplitudes for omega_1 and omega_2:
A1 = 29.354;    A2 = 0.831;

%Calculating T and K with basic algebra
T_sqr = (A2^2*om2^2 - A1^2*om1^2) / (A1^2*om1^4 - A2^2*om2^4);
T = sqrt(T_sqr);

K = A1*om1*sqrt(T^2*om1^2 + 1);

% c) parameters with noise

% Average amplitudes
A1_C = 31.41575;    A2_C = 2.39946;

% New values for T and K
T_sqr_C = (A2_C^2*om2^2 - A1_C^2*om1^2) / (A1_C^2*om1^4 - A2_C^2*om2^4);
T_C = sqrt(T_sqr_C);

K_C = A1_C*om1*sqrt(T_C^2*om1^2 + 1);
