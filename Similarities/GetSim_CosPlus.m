function [  sim ] = GetSim_CosPlus( train )
%% ����Cos+ָ�����ƶ�
    D = sparse(eye(size(train,1)));                        
    % ����ϡ��ĵ�λ����
    D(logical(D)) = sum(train,2);  
    % ���ɶȾ��� ���Խ���Ԫ��Ϊͬ�±�ڵ�Ķȣ�
    pinvL = sparse(pinv( full(D - train) ));      clear D;
    % ������˹�����α��  
    Lxx = diag(pinvL);   
    % ȡ�Խ���Ԫ��
    sim = pinvL ./ (Lxx*Lxx').^0.5;                         
    % �����ƶȾ���
    sim(isnan(sim)) = 0; sim(isinf(sim)) = 0;
end
