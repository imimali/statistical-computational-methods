p = 0.8;
q = 1 - p;
n = 10;
N = 10000;
for i = 1 : N
    for j = 1 : n
        Y(j) = 0;
        while rand >= p
            Y(j) = Y(j) + 1;
        end
    end
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