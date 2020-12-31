% bernoulli
p = 0.5;
X = rand() < p;

% binomial
p = 0.5;
n = 10;
U = rand(n, 1);
X = sum(U < p);

% geometric(return X + 1 at the end for shifted)
p = 0.5;
X = 0;
while rand() >= p
    X = X + 1;
end

% negative binomial
p = 0.5;
n = 10;
X = zeros(1,n);

for i = 1:n
    while rand() >= p
    X(i) = X(i) + 1;
    end
end
Y = sum(X);

% arbitrary distribution
p = [0.5 0.2 0.1 0.2 0.1];
U = rand();
i = 1;
F = p(1);
while U >= F
    i = i + 1;
    F = F + p(i); 
end
X = i

