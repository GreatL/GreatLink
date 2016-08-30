function [ sim ] = GetSim_CN( train )
%% 计算CN指标相似度
    sim = train * train;        
end
