pa = 1/5;
ps = 1/3;
P = [1 - pa pa 0 0 0;
    (1-pa)*ps (1-pa)*(1-ps)+pa*ps pa*(1-ps) 0 0;
    0 (1-pa)*ps (1-pa)*(1-ps)+pa*ps pa*(1-ps) 0;
    0 0 (1-pa)*ps (1-pa)*(1-ps)+pa*ps pa*(1-ps);
    0 0 0 (1-pa)*ps (1-pa)*(1-ps)+pa*ps];

P0 = [1 0 0 0 0];
res=P0*P^2;
res(3)
% ooor 
P(1,:)*P(:,3)