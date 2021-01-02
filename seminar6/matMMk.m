% generates the stochastic matrix of a MMK, with 
% arrival rate pa
% service rate ps
% number of servers k(pass inf for a MMinf
% size of matrix C
function P = matMMk(pa, ps, k, C)
P =zeros(C,C);
P(1,1) = 1-pa;
P(1,2) = pa;
for i = 2:C
    n = min(k,i-1);
    rowCandidate = [zeros(1,i-2) n*ps 1-pa-n*ps pa zeros(1,C - i -1)];
    P(i, :) = rowCandidate(1, 1:C);
end
end