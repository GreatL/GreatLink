function [ sim ] = GetSim_cRA( train )   
%% 计算RA指标相似度
	cc=clustering_coefficients(train);
    train1 = train ./ repmat(cc,[1,size(train,1)]); 
    % 计算每个节点的权重，1/k_i,网络规模过大时需要分块处理
    train1(isnan(train1)) = 0; 
    train1(isinf(train1)) = 0;
    sim = train * train1;  clear train1; 
    % 实现相似度矩阵的计算
end
