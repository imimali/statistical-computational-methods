lambda = 1/20; % 3 per minute 3/ 60 seconds = 1/20 seconds
% waiting time between poisson events has exponential distribution, thus
% we will generate an exponential random variable with frequency 1/4months
err = 1e-3;
alpha = 0.01;
N = ceil(0.25 * (norminv(alpha / 2, 0, 1) / err) ^ 2);
%N=50000;
Y = zeros(1, N);
for i = 1 : N
    Y(i) = -1 / lambda * log(rand);
end

fprintf('a) P(Y >= 25) = %1.5f\n', mean(Y>=25)) % should give around 1 - expcdf(25,20)
fprintf('b) E(Y) = %1.5f\n', mean(Y)) % should give around 1/lambda