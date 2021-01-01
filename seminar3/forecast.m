% Probl. 5, Sem.3, Forecasting errors in new software release.
clear all
err = 5e-3;
alpha = 0.01;
k = 4;
inLast = [10, 5, 7, 6];
tmax = 10;
N =  ceil(0.25 * (norminv(alpha / 2, 0, 1) / err) ^ 2);
fprintf('Nr. of simulations N = %d \n\n', N)

for i = 1 : N
    T = 0;
    last = inLast;
    X = inLast(k);
    nrErr = sum(inLast);
    while X > 0
        lambda = min (last);
        U = rand;
        X = 0;
        while U >= exp(-lambda)
            U = U * rand;
            X = X + 1;
        end
        T = T + 1;
        nrErr = nrErr + X;
        last = [last(2:k), X];
    end
    Ttotal(i) = T - 1;
    Ntotalerr(i) = nrErr;
end

fprintf('\n')
fprintf('a) The time it will take to find all errors is %3.3f days \n', mean(Ttotal))
fprintf('b) Total number of errors in the new release is %5.3f \n', mean(Ntotalerr))
fprintf('c) Prob. that some errors will still be undetectedafter %d days, \n', tmax)
fprintf('after which the software will be withdrawn is %3.3f \n\n', mean(Ttotal > tmax))