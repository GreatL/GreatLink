function [ sim ] = GetSim_cSorenson( train )
%% ����Sorensonָ�����ƶ�
	cc=clustering_coefficients(train);
    sim = train * train;                                            
    % �������
    sim = triu(sim,1);
    deg_col = repmat(cc, [1 size(train,1)]);              
    % �����ĸ
    deg_col = triu(deg_col' + deg_col);
    sim = 2 * sim ./ deg_col;                             
    % ���ƶȾ���������
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
