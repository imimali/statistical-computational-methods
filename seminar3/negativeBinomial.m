p = 0.5;
n = 10;
N = 10000;
q = 1 - p;

for i = 1:N
    Y = ceil(log(1 - rand(n, 1))/log(1 - p) - 1);
    X(i) = sum(Y);
end

fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', nbinpdf(2, n, p))
fprintf('error = %e\n\n', abs(nbinpdf(2, n, p) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', nbincdf(2, n, p))
fprintf('error = %e\n\n', abs(nbincdf(2, n, p) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', nbincdf(1, n, p))
fprintf('error = %e\n\n', abs(nbincdf(1, n, p) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', (n * q) / p)
fprintf('error = %e\n\n', abs(((n * q) / p) - mean(X)))