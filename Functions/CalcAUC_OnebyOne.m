function [ auc ] = CalcAUC_OnebyOne( train, test, sim, n, type)
%% ����AUC�������������ƶȾ���
if type==0
    net=train+test;
    d=max(size(net));                     %����ά��
    clear net;
    n1=0;                                 %testԤ��ֵ����nonԤ��ֵ�ĸ���
    n2=0;                                 %testԤ��ֵ����nonԤ��ֵ�ĸ���
    %�����������ޣ�תΪ�±괦��
    %count=0;
    for i=1:n
        test_rd=ceil(d*d*rand(1));
        test_ind=myind2sub(size(test),test_rd);
        while test(test_ind(1),test_ind(2))<=0
            test_rd=ceil(d*d*rand(1));
            test_ind=myind2sub(size(test),test_rd);
            %count=count+1
        end
        test_pre=sim(test_ind(1),test_ind(2))*test(test_ind(1),test_ind(2));
        
        %count=0;
        
        non_rd=ceil(d*d*rand(1));
        non_ind=myind2sub(size(test),non_rd);
        while 1-train(non_ind(1),non_ind(2))-test(non_ind(1),non_ind(2))<=0
            non_rd=ceil(d*d*rand(1));
            non_ind=myind2sub(size(test),non_rd);
            %count=count+1
        end
        non_pre=sim(non_ind(1),non_ind(2))*(1-train(non_ind(1),non_ind(2))-test(non_ind(1),non_ind(2)));
        if test_pre>non_pre
            n1=n1+1;
        elseif test_pre==non_pre
            n2=n2+1;
        end
        fprintf('%d',i);
%         i
    end
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
