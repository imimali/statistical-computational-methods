lambda = 0.Line 1 lambda = 0.9;
;
L = lambda;
N = 10000;

for j = 1 : N
    clear F;
    i = 0;
    F(j) = exp(-L);
    while (rand >= F(j))
        F(j) = F(j) + exp(-L) * L^i / factorial(i);
        i = i + 1;
    end
    X(j) = i;
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