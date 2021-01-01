% Simulate Geometric distr. Geo(p) variables, using the Discrete
% % Inverse Transform, i.e. X = ceil(ln(U)/ln(1 - p)-1).
clear all
p = 0.5;
err = 1e-02;
alpha = 0.05;
N =  ceil(0.25 * (norminv(alpha / 2, 0, 1) / err) ^ 2);
fprintf('Nr. of simulations N = %d \n\n', N)

for i = 1 : N
    X(i) = ceil(log(1 - rand)/log(1 - p) - 1); % the Geo variables
end
% Application/Comparison
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