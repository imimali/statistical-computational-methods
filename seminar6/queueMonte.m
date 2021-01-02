pa = 1/6;
ps = 1/4;
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
P
