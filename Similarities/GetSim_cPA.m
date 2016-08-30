function [ sim ] = GetSim_cPA( train )
%% 计算PA指标相似度
    c=clustering_coefficients(train);
    sim = c * c';  
    clear c;       
    % 相似度矩阵计算完成
end
