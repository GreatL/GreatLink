%
% Compute PageRank.  This functions supports nodes with zero
% outdegree, and teleportation. 
%
% PARAMETERS 
%	A       (n*n) Asymmetric adjacency matrix of directed graph 
%	alpha   Amount of teleportation to do 
%	opts    (optional) Options to eigs() 
%
% RESULTS 
%	u       (n*1) PageRank vector
%

function [u] = konect_pagerank(A, alpha, opts)

if ~exist('opts', 'var')
    opts.disp = 2; 
end

[m n] = size(A);
assert(m == n); 

d_out = full(sum(A, 2));

d_0 = (d_out == 0);

d_out_plus = d_out .^ -1;

f = find(d_0);

d_out_plus(f)= 0;

P_pos = (1 - alpha) * spdiags(d_out_plus, [0], n, n) * A;

J_1 = (1 - alpha) / n * ones(1, n);
J_2 = ones(n, 1);
J_3 = alpha / n * ones(1, n); 

[u, lambda] = eigs(@(v)(v' * P_pos + (v' * d_0) * J_1 + (v' * J_2) * J_3), ...
                   n, 1, 'lm', opts);

u = u * sign(sum(u)); 
