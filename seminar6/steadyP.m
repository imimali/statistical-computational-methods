function A = steadyP(P)
    PP = [(P-eye(length(P))) ones(length(P),1)];
    A=[zeros(1,length(P)) 1]/PP;
end