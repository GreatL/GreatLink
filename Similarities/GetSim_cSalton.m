function [ sim ] = GetSim_cSalton( train )
%% 计算Salton指标相似度
	cc=clustering_coefficients(train);
    tempdeg = repmat(cc.^0.5,[1,size(train,1)]);       
    % 可能溢出，规模大的话需要分块。
    tempdeg = tempdeg .* tempdeg';            
    % 分母的计算
    sim = train * train;              
    % 分子的计算
    sim = sim./tempdeg;                 
    % 相似度矩阵计算完成
    sim(isnan(sim)) = 0; 
	sim(isinf(sim)) = 0;
end
