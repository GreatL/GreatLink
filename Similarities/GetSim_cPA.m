function [ sim ] = GetSim_cPA( train )
%% ����PAָ�����ƶ�
    c=clustering_coefficients(train);
    sim = c * c';  
    clear c;       
    % ���ƶȾ���������
end
