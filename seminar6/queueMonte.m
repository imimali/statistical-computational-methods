pa = 1/6;
ps = 1/4;
C=4;
matSize = C;
% generate the transition probability matrix of a B1SQP with unlimited
% capacity
P = zeros(matSize, matSize);
P(1,:) = [1-pa pa zeros(1, matSize-2)];
for i = 2: matSize
    %P(i, :) = [zeros(1,i-2) (1-pa)*ps (1-pa)*(1-ps)+pa*ps pa*(1-ps) zeros(1,matSize - i)];
    rowCandidate = [zeros(1,i-2) (1-pa)*ps (1-pa)*(1-ps)+pa*ps pa*(1-ps) zeros(1,matSize - i -1)];
    P(i, :) = rowCandidate(1, 1:matSize);
end


% generate the transition probability matrix of a B1SQP with limited
% capacity
C = 3;
P = zeros(C, C);
P(1,:) = [1-pa pa zeros(1, C-2)];
for i = 2: C-1
    %P(i, :) = [zeros(1,i-2) (1-pa)*ps (1-pa)*(1-ps)+pa*ps pa*(1-ps) zeros(1,matSize - i)];
    rowCandidate = [zeros(1,i-2) (1-pa)*ps (1-pa)*(1-ps)+pa*ps pa*(1-ps) zeros(1,C - i -1)];
    P(i, :) = rowCandidate(1, 1:C);
end
P(C,C-1) = (1 -pa) * ps;
P(C,C) = 1 - (1-pa) * ps;
% % generate the transition probability matrix of a BkSQP with limited
% capacity
C = 5;
pa = 0.2;
ps = 0.125;
k = 2;
j = 2;
P = zeros(C,C);
p_i_i = @(n) pa * nchoosek(n,1) * ps * ((1-ps)^(n-1)) + (1-pa)*((1-ps)^(n));
p_i_ip1 = @(n) pa*(1-ps)^n;
p_i_imj = @(j,n) pa * nchoosek(n,j+1) * ps^(j+1) * (1-ps)^(n-j-1) + (1-pa)*nchoosek(n,j) *ps^(j)* (1-ps)^(n-j);
p_i_imn = @(n) (1-pa)*(ps^n);
for i = 2:C
    n = min(i-1,k);
    P(i,i)= p_i_i(n);
    for j = 1:n-1
        if i-j>=1
            P(i, i-j)= p_i_imj(j,n);
        end
    end
    if i-n >= 1
        P(i,i-n) =p_i_imn(n);
    end 
    P(i, min(C,i+1)) = p_i_ip1(n);
end
P(1,1) = 1-pa;
P(1,2) = pa;
P(C,C) = n *pa * ps*((1-ps)^(n-1))+(1-ps)^n;
matBkSQP(0.2, 0.125, 2, 5,'limited')


