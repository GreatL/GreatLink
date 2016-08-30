%
% Extract the largest connected component from a biadjacency matrix.
% The original matrix can be recovered using konect_connect_back(). 
%
% RESULT 
%	Bs	Biadjacency matrix of largest connected component
%	cc1/cc2	0/1 vector of chosen left/right subset
%	n	Total number of nodes in the found component 
%
% PARAMETERS 
%	B	Biadjacency matrix
%
% ABOUT 
%	This file is part of the KONECT Matlab Toolbox version 0.3.
%	konect.uni-koblenz.de
%	(c) Jerome Kunegis 2014; this is Free Software released under
%	the GPLv3, see COPYING. 
%

function [Bs cc1 cc2 n] = konect_connect_matrix_bipartite(B)

[cc1 cc2] = konect_connect_bipartite(B);

Bs = B(cc1, cc2); 

n = sum(size(Bs));
