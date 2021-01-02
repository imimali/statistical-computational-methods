function A = steadyMMk(lambda_a, lambda_s, k, C)
r = lambda_a/lambda_s; % should be < k
pi0 = 1 / (sum((cumprod(ones(1,k)*r))./(cumprod([1 1:k-1]))) + r^k/(factorial(k)*(1-r)/k));
A = zeros(1,C);
for i = 2:k
    A(i) = (r^i/factorial(i))*pi0;
end
for i = k+1:C
    A(i) = (r^i/factorial(i))*pi0 * (r/k)^(x-k);
end
end