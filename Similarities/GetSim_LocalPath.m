function [  sim ] = GetSim_LocalPath( train, lambda )
%% ����LPָ�����ƶ�
    sim = train*train;    
    % ����·��
    sim = sim + lambda * (train*train*train);   
    % ����·�� + ����������·��
end
