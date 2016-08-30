function [  sim ] = GetSim_RWR( train, lambda )
%% ����RWRָ�����ƶ�
    deg = repmat(sum(train,2),[1,size(train,2)]);
    train = train ./ deg; 	clear deg;
    % ��ת�ƾ���
    I = sparse(eye(size(train,1)));                                
    % ���ɵ�λ����
    sim = (1 - lambda) * inv(I- lambda * train') * I;
    sim = sim+sim';                           
    % ���ƶȾ���������
    train = spones(train);   
    % ���ڽӾ���ԭ����Ϊ�޹����㣬���Բ����нڵ�Ķ�Ϊ0
end