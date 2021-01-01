% Simulate a [0, Tmax] segment of a Poisson counting process.
clear all
lambda = 2;
tmax = 3;
arr_times = -1/lambda*log(rand);
last_arrival = arr_times;
while last_arrival <= tmax
    last_arrival = last_arrival - 1/lambda*log(rand);
    arr_times = [arr_times, last_arrival];
end
arr_times = arr_times(1 : end - 1);
step = 0.01;
t = 0 : step : tmax;
Nsteps = length(t);
X = zeros(1, Nsteps);
for s = 1 : Nsteps
    X(s) = sum(arr_times <= t(s));
end

axis([0 max(t) 0 max(X)]);
hold on
title('Poisson process of arrivals');
xlabel('time');
ylabel('nr. of arrivals')
comet(t, X)