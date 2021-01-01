lambda = 2;
N = 1000;
for i = 1 : N
    X(i) = -1 / lambda * log(rand); % the Exp variablesend
end
% Application/Comparison

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', expcdf(2, 1 / lambda))
fprintf('error = %e\n\n', abs(expcdf(2, 1 / lambda) - mean(X <= 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', 1 / lambda)
fprintf('error = %e\n\n', abs(1 / lambda - mean(X)))