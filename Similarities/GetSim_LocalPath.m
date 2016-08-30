function [  sim ] = GetSim_LocalPath( train, lambda )
%% 计算LP指标相似度
    sim = train*train;    
    % 二阶路径
    sim = sim + lambda * (train*train*train);   
    % 二阶路径 + 参数×三节路径
end
