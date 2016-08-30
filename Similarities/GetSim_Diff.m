function [ sim ] = GetSim_Diff( train )
%% ����Sorensonָ�����ƶ�
    sim = train * train;                                            
    % �������
    sim = triu(sim,1);
    deg_col = repmat(sum(train,2), [1 size(train,1)]);              
    % �����ĸ
    deg_col = triu(abs(deg_col' - deg_col));
    sim = 2 * sim ./ deg_col;                             
    % ���ƶȾ���������
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
