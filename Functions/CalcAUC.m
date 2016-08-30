function [ auc ] = CalcAUC( train, test, sim, n, type)
%% ����AUC�������������ƶȾ���
if type==0
    sim = triu(sim - sim.*train);
    % ֻ�������Լ��Ͳ����ڱ߼����еıߵ����ƶȣ��Ի����⣩
    non = 1 - train - test - eye(max(size(train,1),size(train,2)));
    test = triu(test);
    non = triu(non);
    % �ֱ�ȡ���Լ��Ͳ����ڱ߼��ϵ������Ǿ�������ȡ�����Ƕ�Ӧ�����ƶȷ�ֵ
    test_num = nnz(test);
    non_num = nnz(non);
    test_rd = ceil( test_num * rand( 1, n));  
    % ceil��ȡ���ڵ��ڵ���С������nΪ�����ȽϵĴ���
    non_rd = ceil( non_num * rand( 1, n));
    test_pre = sim .* test;
    non_pre = sim .* non;
    test_data =  test_pre( test == 1 )';  
    % ��������test ���ϴ��ڵıߵ�Ԥ��ֵ
    non_data =  non_pre( non == 1 )';   
    % ��������nonexist���ϴ��ڵıߵ�Ԥ��ֵ
    test_rd = test_data( test_rd );
    non_rd = non_data( non_rd );
    clear test_data non_data;
    n1 = length( find(test_rd > non_rd) );  
    n2 = length( find(test_rd == non_rd));
    auc = ( n1 + 0.5*n2 ) / n;
elseif type==1
    sim = sim - sim.*train;
    % ֻ�������Լ��Ͳ����ڱ߼����еıߵ����ƶȣ��Ի����⣩
    non = 1 - train - test - eye(max(size(train,1),size(train,2)));
    % �ֱ�ȡ���Լ��Ͳ����ڱ߼��ϣ�����ȡ�����Ƕ�Ӧ�����ƶȷ�ֵ
    test_pre = sim .* test;
    non_pre = sim .* non;
    test_data =  test_pre( test == 1 )';  
    % ��������test ���ϴ��ڵıߵ�Ԥ��ֵ
    non_data =  non_pre( non == 1 )';       
    test_num = nnz(test);
    non_num = nnz(non);%-max(size(sim));
    test_rd = ceil( test_num * rand( 1, n));  
    % ceil��ȡ���ڵ��ڵ���С������nΪ�����ȽϵĴ���
    non_rd=ceil(non_num * rand( 1, n));
    while max(non_rd)>max(size(non_data))
        non_rd=ceil(non_num * rand( 1, n));
end
    % ��������nonexist���ϴ��ڵıߵ�Ԥ��ֵ
    test_rd = test_data( test_rd );
    non_rd = non_data( non_rd );
    clear test_data non_data;
    n1 = length( find(test_rd > non_rd) );  
    n2 = length( find(test_rd == non_rd));
    auc = ( n1 + 0.5*n2 ) / n;
    else
        disp('�������Ӧ��������');
        disp('0���������磻1����������');
    end
end
