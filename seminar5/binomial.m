% Simulation of Binomial counting process.
% and illustration of the generated discrete-time process
% with Delta frame size.
clear all

nb = 30;
p = 0.3;
del = 0.5;
X = zeros(1, nb);
X(1) = rand < p;
for t = 2 : nb
    X(t) = X(t - 1) + (rand < p); % count the nr. of successesend
end
clf
axis([ 0 nb 0 max(X)]);
hold on
title('Binomial process of arrivals')
xlabel('time');
ylabel('nr. of arrivals')
for t = 1 : nb
    plot(t, X(t), '*', 'MarkerSize', 8)
    pause(del)
end
hold off