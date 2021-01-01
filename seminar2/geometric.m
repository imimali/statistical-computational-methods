p = 0.5;
N = 1000;
X = zeros(1, N);
for i = 1 : N
    while rand >= p
        X(i) = X(i) + 1;
    end
end

fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', geopdf(2, p))
fprintf('error = %e\n\n', abs(geopdf(2, p) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', geocdf(2, p))
fprintf('error = %e\n\n', abs(geocdf(2, p) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', geocdf(1, p))
fprintf('error = %e\n\n', abs(geocdf(1, p) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', (1 - p) / p)
fprintf('error = %e\n\n', abs((1 - p) / p - mean(X)))