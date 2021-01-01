clear all;
N = 500000;
nm = 30;
for j = 1 :N
    X = zeros(length(nm));
    P0 = [0.2 0.8];
    P = [0.7 0.3; 0.4 0.6];
    P1(1, :) = P0;
    for t = 1 : nm
        U = rand;
        X(t) = 1 * (U < P0(1)) + 2 * (U >= P0(1));
        P1(t+1, :) = P1(t, :) * P;
        P0 = P(X(t),:);
    end
    
    i_change = [find(X(1 : end - 1) ~= X(2 : end)), nm];
    longstr(1) = i_change(1);
    for i = 2 : length(i_change)
        longstr(i) = i_change(i) - i_change(i - 1);% the remaining long streaks are differences% between any two changesend
    end
    
    sunny = longstr(1 : 2 : end);
    rainy = longstr(2 : 2 : end);
    if X(1)==2
        temp = sunny;
        sunny = rainy;
        rainy = temp;
    end
    maxs(j) = max(sunny);
    maxr(j) = max(rainy);
end
fprintf('\n prob. of water shortage is %1.4f\n',mean(maxs >= 7))
fprintf('prob. of flooding is %1.4f\n',mean(maxr >= 7))