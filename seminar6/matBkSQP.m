% generates the stochastic matrix of a BkSQP, with 
% arrival rate pa
% service rate ps
% number of servers k
% capacity or size C
% type - pass 'limited' to let the function know C is used as a maximum
% capacity, and pass anything else if C is used as simple size
% Note: if type is 'limited', that is, and C is used as a maximum capacity,
% it should equal the actual capacity + 1, since the number of states
% includes zero as well.
% examples:

% For the example from page 12 of lecture 9, we have 
% matBkSQP(0.2,0.125,2,4 + 1,'limited') % note the 4 + 1
% which gives 
%    0.8000    0.2000         0         0         0
%    0.1000    0.7250    0.1750         0         0
%    0.0125    0.1781    0.6562    0.1531         0
%         0    0.0125    0.1781    0.6562    0.1531
%         0         0    0.0125    0.1781    0.8094

% For the example from Seminar 6, ex. 2:
% matBkSQP(1/8,1/10,2,3,'limited')
%    0.8750    0.1250         0
%    0.0875    0.8000    0.1125
%    0.0088    0.1588    0.8325

% for example from page 9 lecture 8, we have
% matBkSQP(1/9, 1/2, 1, 9, 'something') % note how limited was not passed
% and 9 is used as the matrix size of an infinite X infinite matrix. It
% gives

%    0.8889    0.1111         0         0         0         0         0         0         0
%    0.4444    0.5000    0.0556         0         0         0         0         0         0
%         0    0.4444    0.5000    0.0556         0         0         0         0         0
%         0         0    0.4444    0.5000    0.0556         0         0         0         0
%         0         0         0    0.4444    0.5000    0.0556         0         0         0
%         0         0         0         0    0.4444    0.5000    0.0556         0         0
%         0         0         0         0         0    0.4444    0.5000    0.0556         0
%         0         0         0         0         0         0    0.4444    0.5000    0.0556
%         0         0         0         0         0         0         0    0.4444    0.5000%





function P = matBkSQP(pa,ps,k,C, type)

P = zeros(C,C);
p_i_i = @(n) pa * nchoosek(n,1) * ps * ((1-ps)^(n-1)) + (1-pa)*((1-ps)^(n));
p_i_ip1 = @(n) pa*(1-ps)^n;
p_i_imj = @(j,n) pa * nchoosek(n,j+1) * ps^(j+1) * (1-ps)^(n-j-1) + (1-pa) * nchoosek(n,j) *ps^(j)* (1-ps)^(n-j);
p_i_imn = @(n) (1-pa)*(ps^n);
for i = 2:C
    n = min(i-1,k);
    P(i, min(C,i+1)) = p_i_ip1(n);
    P(i,i)= p_i_i(n);
    for j = 1:n-1
        if i-j>=1
            P(i, i-j)= p_i_imj(j,n);
        end
    end
    if i-n >= 1
        P(i,i-n) =p_i_imn(n);
    end 
    
end
P(1,1) = 1-pa;
P(1,2) = pa;
if(strcmp(type,'limited'))
    P(C,C) = n *pa * ps*((1-ps)^(n-1))+(1-ps)^n;
end

