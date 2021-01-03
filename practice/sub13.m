lambda = 12; % 1 every 45 seconds means 4 * 1 every 4 * 45 = 180 seconds, that is 4 every 3 minutes,
% and later we will need this, it means 12 every 9 minutes, we will
% consider frames of 9 minutes
% we will generate a poisson random variable
% minutes
err = 1e-3;
alpha = 0.01;
N = ceil(0.25 * (norminv(alpha / 2, 0, 1) / err) ^ 2);
X = zeros(1, N);
for i = 1 : N
    % poisson
    U = rand;
    X(i) = 0;
    while U >= exp(-lambda)
        U = U * rand;
        X(i) = X(i) + 1;
    end
end

mean(X>=10)
fprintf('a) P(X >= 10) = %1.5f\n', mean(X>=10)) % should give around 1 - poisscdf(9, 12), since P(X>=10) = 1 -(P<10) = 1 - P(<=9) = 1 - poisscdf(9, 12)
fprintf('b) E(X) = %1.5f\n', mean(X)) % should give around E(Poiss(lambda)) = lambda;