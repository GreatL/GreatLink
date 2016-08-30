function [ sim ] = GetSim_LHN( train )
%% 计算LHN1指标相似度
    sim = train * train;     
    % 完成分子的计算，分子同共同邻居算法
    deg = sum(train,2);
    deg = deg*deg';                                         
    %完成分母的计算
    sim = sim ./ deg;                                      
    %相似度矩阵的计算
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
