function [ sim ] = GetSim_cDiff( train )
%% ����Sorensonָ�����ƶ�
	c=clustering_coefficients(train);
    sim = train * train;                                            
    % �������
    sim = triu(sim,1);
    deg_col = repmat(c, [1 size(train,1)]);              
    % �����ĸ
    deg_col = triu(abs(deg_col' - deg_col));
    sim = 2 * sim ./ deg_col;                             
    % ���ƶȾ���������
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
