function [  sim ] = GetSim_LHNII( train, lambda )   
%% 计算LHN2指标相似度
    M = nnz(train)/2;
    % 网络中的边数
    D = sparse(eye(size(train,1)));                                 
    D(logical(D)) = sum(train,2);   
    % 生成度矩阵 （对角线元素为同下标节点的度）
    D = inv(D);  
    % 求度矩阵的逆矩阵
    maxeig = max(eig(train));  
    % 求邻接矩阵的最大特征值
    tempmatrix = (sparse(eye(size(train,1))) - lambda/maxeig * train); 
    tempmatrix = inv(tempmatrix);
    sim = 2 * M * maxeig * D * tempmatrix * D;   clear D tempmatrix;
    % 完成相似度矩阵的计算
end
