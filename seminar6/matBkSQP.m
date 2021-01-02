% generates the stochastic matrix of a BkSQP, with 
% arrival rate pa
% service rate ps
% number of servers k
% capacity or size C
% type - pass 'limited' to let the function know C is used as a maximum
% capacity, and pass anything else if C is used as simple size

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