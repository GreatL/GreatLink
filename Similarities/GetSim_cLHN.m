function [ sim ] = GetSim_cLHN( train )
%% ����LHN1ָ�����ƶ�
    cc=clustering_coefficients(train);
	sim = train * train;     
    % ��ɷ��ӵļ��㣬����ͬ��ͬ�ھ��㷨
    cc = cc*cc';                                         
    %��ɷ�ĸ�ļ���
    sim = sim ./ cc;                                      
    %���ƶȾ���ļ���
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
