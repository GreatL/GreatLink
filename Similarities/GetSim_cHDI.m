function [ sim ] = GetSim_cHDI( train )
%% 计算HDI指标相似度 
    cc=clustering_coefficients(train);
	sim = train * train;      
    % 完成分子的计算，分子同共同邻居算法
    deg_row = repmat(cc', [size(train,1),1]);
    deg_row = deg_row .* spones(sim);
    deg_row = max(deg_row, deg_row');  
    % 完成分母的计算，其中元素(i,j)表示取了节点i和节点j的度的最大值
    sim = sim ./ deg_row; clear deg_row;     
    % 完成相似度矩阵的计算
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
