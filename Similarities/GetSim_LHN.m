function [ sim ] = GetSim_LHN( train )
%% ����LHN1ָ�����ƶ�
    sim = train * train;     
    % ��ɷ��ӵļ��㣬����ͬ��ͬ�ھ��㷨
    deg = sum(train,2);
    deg = deg*deg';                                         
    %��ɷ�ĸ�ļ���
    sim = sim ./ deg;                                      
    %���ƶȾ���ļ���
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
