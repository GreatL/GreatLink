function [ sim ] = GetSim_MFI( train )
%% ����MFIָ�����ƶ�
    I = sparse(eye(size(train,1)));                                 
    % ���ɵ�λ����
    D = I;
    D(logical(D)) = sum(train,2);         
    % ���ɶȾ��󣨶Խ���Ԫ��Ϊͬ�±�ڵ�Ķȣ�
    L = D - train;          
    clear D;              
    % ������˹����
    sim = inv(I + L);      
    clear I L;       
    % ���ƶȾ���ļ���
end
