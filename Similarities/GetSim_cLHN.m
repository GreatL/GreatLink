function [ sim ] = GetSim_cLHN( train )
%% 计算LHN1指标相似度
    cc=clustering_coefficients(train);
	sim = train * train;     
    % 完成分子的计算，分子同共同邻居算法
    cc = cc*cc';                                         
    %完成分母的计算
    sim = sim ./ cc;                                      
    %相似度矩阵的计算
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
