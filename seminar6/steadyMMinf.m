function A = steadyMMinf(lambda_a, lambda_s, C)
r= lambda_a/lambda_s;
factorials = cumprod([1 1:C-1]);
r_powers = cumprod([1 ones(1,C-1)*r]);
A = r_powers./factorials*exp(-r);
end