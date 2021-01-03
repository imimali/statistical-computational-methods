% we will have a binomial distributions, Bernoulli trials
p = 0.05;
n = 16;
err = 1e-3;
alpha = 0.01;
N = ceil(0.25 * (norminv(alpha / 2, 0, 1) / err) ^ 2);
X = zeros(1, N);
for i = 1:N
    U = rand(n, 1);
    X(i) = sum(U < p);
end

fprintf('a) P(X >= 3) = %1.5f\n', mean(X>=3))
fprintf('b) E(X) = %1.5f\n', mean(X))
% a) should give around 1 - binocdf(2, 16,0.05), and indeed, 5% error rate
% means 5 of every 100 is defective in general, which means in general we
% should expect 16 * 5/100, around 0.8 defective