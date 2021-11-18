 function[V,U,T,E]=shift_seg_process(X,V,c,m,eta)
n=size(X,1);
p=size(X,2);
dist=dist_measure(V,X);
tmp=dist.^(-2/(m-1));
U=tmp./(ones(c,1)*sum(tmp));

si = find (tmp==inf);
U(si)=1;
tmp=dist.^(-2/(eta-1));
T=tmp./((sum(tmp')')* ones(1,n));
T(si)=1;
tmp= find ((sum (T')- ones(1,c)) > 0.0001);
V_old=V;
Us= U.^(m);
Ts =T.^eta;
V = ((Us+Ts) *X) ./ ((ones(p,1)*sum((Us+Ts)'))');
E= norm(V-V_old, 1);




