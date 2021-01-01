p = 0.1;
n = 10;
N = 10000;
U = rand(n, N);
X = sum(U < p);
fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', binopdf(2, n, p))
fprintf('error = %e\n\n', abs(binopdf(2, n, p) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', binocdf(2, n, p))
fprintf('error = %e\n\n', abs(binocdf(2, n, p) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', binocdf(1, n, p))
fprintf('error = %e\n\n', abs(binocdf(1, n, p) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', n*p)
fprintf('error = %e\n\n', abs(n*p - mean(X)))
