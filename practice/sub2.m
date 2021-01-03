% we will have a geometric distribution, simulate a geometric random variable
p = 0.8;
err = 1e-3;
alpha = 0.01;
N = ceil(0.25 * (norminv(alpha / 2, 0, 1) / err) ^ 2);
X = zeros(1, N);
for i = 1: N
    while rand() >= p
        X(i) = X(i) + 1;
    end
end

fprintf('a) P(X >= 3) = %1.5f\n', mean(X>=3))
fprintf('b) E(X) = %1.5f\n', mean(X))
% a) should give around 1-geocdf(2,0.8), a very small number since
% intuitively, if 80% pass, we should be extremely unlucky to have 3
% components fail consecutively
% b) should give around (1-p)/p