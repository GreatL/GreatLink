function [ sim ] = GetSim_cDiff( train )
%% 计算Sorenson指标相似度
	c=clustering_coefficients(train);
    sim = train * train;                                            
    % 计算分子
    sim = triu(sim,1);
    deg_col = repmat(c, [1 size(train,1)]);              
    % 计算分母
    deg_col = triu(abs(deg_col' - deg_col));
    sim = 2 * sim ./ deg_col;                             
    % 相似度矩阵计算完成
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
