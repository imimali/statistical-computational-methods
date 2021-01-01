lambda = 0.7;
a = 4;
N = 1000;
for i = 1 : N
    X(i) = sum(-lambda*log(rand(a, 1))); % the Gamma variablesend
end

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', gamcdf(2, a, lambda))
fprintf('error = %e\n\n', abs(gamcdf(2, a, lambda) - mean(X <= 2)))


fprintf('simulated mean E(X) = %5.5f\n', mean(X))
%fprintf('true mean E(X) = %5.5f\n', (n * q) / p)
%fprintf('error = %e\n\n', abs(((n * q) / p) - mean(X)))