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

[pxx,f] = pwelch(psi_w(2,:),noverlap, nfft, window_size,Fs);