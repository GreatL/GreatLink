%
% Compute the balanced inequality ratio value [own].  In other words,
% the number P such that the proportion P of nodes with most degree
% cover the proportion (1-P) of all half-edges. This is the "height"
% of the Lorenz curve, and therefore highly correlated to the Gini
% coefficient.  
%
% PARAMETERS 
%	a	Adjacency / biadjacency matrix
%	format
% 	weights
%
% RESULT 
%	values	The "own" values
%		[1] 	Total 
%		[2,3] 	Left/right (only ASYM and BIP) 
%
% ABOUT 
%	This file is part of the KONECT Matlab Toolbox version 0.3.
%	konect.uni-koblenz.de
%	(c) Jerome Kunegis 2014; this is Free Software released under
%	the GPLv3, see COPYING. 
%

function values = konect_statistic_own(A, format, weights)

consts = konect_consts(); 

if weights == consts.POSITIVE
    has_z = 1; 
    [x y z] = find(A);
else
    has_z = 0; 
    [x y] = find(A); 
end

p = [x; y]; 
if has_z
    q = [z; z]; 
else
    q = []; 
end

values = konect_own(p, q);

if format == consts.BIP | format == consts.ASYM

    if has_z
        q = z;
    else
        q = []; 
    end
    
    values = [ values ; konect_own(x, q) ; konect_own(y, q) ]; 

end
