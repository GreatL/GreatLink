function [  sim ] = GetSim_CosPlus( train )
%% 计算Cos+指标相似度
    D = sparse(eye(size(train,1)));                        
    % 生成稀疏的单位矩阵
    D(logical(D)) = sum(train,2);  
    % 生成度矩阵 （对角线元素为同下标节点的度）
    pinvL = sparse(pinv( full(D - train) ));      clear D;
    % 拉普拉斯矩阵的伪逆  
    Lxx = diag(pinvL);   
    % 取对角线元素
    sim = pinvL ./ (Lxx*Lxx').^0.5;                         
    % 求相似度矩阵
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
