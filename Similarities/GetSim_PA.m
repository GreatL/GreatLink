function [ sim ] = GetSim_PA( train )
%% ����PAָ�����ƶ�
    deg_row = sum(train,2);       
    % ���нڵ�Ķȹ�����������������������ת�ü���
    sim = deg_row * deg_row';  
    clear deg_row deg_col;       
    % ���ƶȾ���������
end
