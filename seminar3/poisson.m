clear all;
lambda = 0.7;
N = 1000;
for i = 1 : N
    U = rand;
    X(i) = 0;
    while U >= exp(-lambda)
        U = U * rand;
        X(i) = X(i) + 1;
    end
end


fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', poisspdf(2, lambda))
fprintf('error = %e\n\n', abs(poisspdf(2, lambda) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', poisscdf(2, lambda))
fprintf('error = %e\n\n', abs(poisscdf(2, lambda) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', poisscdf(1, lambda))
fprintf('error = %e\n\n', abs(poisscdf(1, lambda) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', lambda)
fprintf('error = %e\n\n', abs(lambda - mean(X)))