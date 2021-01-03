lambda = 5/4; % 3 per year = 1 every 75 secs is 1 every 5/4 minutes, thus 5 every 4 minutes
% waiting time between poisson events has exponential distribution, thus
% we will generate an exponential random variable with frequency 5/4
% minutes
err = 1e-3;
alpha = 0.01;
N = ceil(0.25 * (norminv(alpha / 2, 0, 1) / err) ^ 2);
%N=50000;
Y = zeros(1, N);
for i = 1 : N
    Y(i) = -1 / lambda * log(rand);
end


fprintf('a) P(Y >= 2) = %1.5f\n', 1-mean(Y<2)) % should give around 1 - expcdf(2, 4/5)
fprintf('b) E(Y) = %1.5f\n', mean(Y)) % should give around E(Exp(lambda)) = 1/lambda;