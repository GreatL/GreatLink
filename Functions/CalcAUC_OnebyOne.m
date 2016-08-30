function [ auc ] = CalcAUC_OnebyOne( train, test, sim, n, type)
%% 计算AUC，输入计算的相似度矩阵
if type==0
    net=train+test;
    d=max(size(net));                     %矩阵维度
    clear net;
    n1=0;                                 %test预测值大于non预测值的个数
    n2=0;                                 %test预测值等于non预测值的个数
    %索引超过上限，转为下标处理
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
    % 只保留测试集和不存在边集合中的边的相似度（自环除外）
    non = 1 - train - test - eye(max(size(train,1),size(train,2)));
    % 分别取测试集和不存在边集合，用以取出他们对应的相似度分值
    test_pre = sim .* test;
    non_pre = sim .* non;
    test_data =  test_pre( test == 1 )';  
    % 行向量，test 集合存在的边的预测值
    non_data =  non_pre( non == 1 )';       
    test_num = nnz(test);
    non_num = nnz(non);%-max(size(sim));
    test_rd = ceil( test_num * rand( 1, n));  
    % ceil是取大于等于的最小整数，n为抽样比较的次数
    non_rd=ceil(non_num * rand( 1, n));
    while max(non_rd)>max(size(non_data))
        non_rd=ceil(non_num * rand( 1, n));
end
    % 行向量，nonexist集合存在的边的预测值
    test_rd = test_data( test_rd );
    non_rd = non_data( non_rd );
    clear test_data non_data;
    n1 = length( find(test_rd > non_rd) );  
    n2 = length( find(test_rd == non_rd));
    auc = ( n1 + 0.5*n2 ) / n;
    else
        disp('请输入对应网络类型');
        disp('0：无向网络；1：有向网络');
    end
end
