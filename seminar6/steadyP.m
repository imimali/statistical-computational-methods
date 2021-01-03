% compute the steady state distribution of a stochastic process, if it exists
% this essentially solves the system of equations 

%|pi * P = pi
%|sum(pi) = 1

% the below method rearranges the first equation as 
% pi (P -I) = O
% and incorporates into the matrix the second equation(add a row of ones to both sides
function A = steadyP(P)
    PP = [(P-eye(length(P))) ones(length(P),1)];
    A=[zeros(1,length(P)) 1]/PP;
end
