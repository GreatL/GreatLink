function [ sim ] = GetSim_RA( train )   
%% ����RAָ�����ƶ�
    train1 = train ./ repmat(sum(train,2),[1,size(train,1)]); 
    % ����ÿ���ڵ��Ȩ�أ�1/k_i,�����ģ����ʱ��Ҫ�ֿ鴦��
    train1(isnan(train1)) = 0; 
    train1(isinf(train1)) = 0;
    sim = train * train1;  clear train1; 
    % ʵ�����ƶȾ���ļ���
end