function [  sim ] = GetSim_Katz( train, lambda )
%% 计算katz指标相似度
    sim = inv( sparse(eye(size(train,1))) - lambda * train);   
    % 相似性矩阵的计算
    sim = sim - sparse(eye(size(train,1)));
end
