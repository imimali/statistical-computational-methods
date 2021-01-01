clear all;
Prow1 = binopdf(0:2,2,0.2);
Prow2  = [0.4    0.5    0.1];
Prow3 = binopdf(2:-1:0,2,0.5);
P = [Prow1; Prow2; Prow3];

P0= [0 0 1];

P_2 = P0 * P^2;

A = [P' - eye(3); 1 1 1];
b = [0; 0; 0; 1];
x = A\b;
xVals = [1:length(x)] - 1;
% expected value
xVals * x % [0 1 2 ... ] * x column vector will give each probability multiplied with its value, and summed up, thus, the expected value