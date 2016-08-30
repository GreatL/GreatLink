function [auc] = SDG( train, test )
%% 计算Social Distance Game指标并返回AUC值
    n=10000;
    m=size(train,1);
    D0=all_shortest_paths(train);
    U0=socialgame(D0);
    SW0=sum(U0)
    
    non = 1 - train - test - eye(max(size(train,1),size(train,2)));
    % 分别取测试集和不存在边集合，用以取出他们对应的相似度分值
    test = triu(test);
    non = triu(non);
    test_num = nnz(test);
    non_num = nnz(non);
    test_pre = [];
    non_pre = [];
    count=0;
    for i=1:size(test)
        for j=1:size(test)
            if test(i,j)==1
                train(i,j)=1;
                %策略1：总的SW变化，不考虑分区 0.2735 0.5090(x=1) 0.2763(x>0)
                %0.3222(x<=2) 0.2670(x<=3) ||
                %SW=sum(socialgame(all_shortest_paths(train)));
                %utility=SW-SW0;
                %策略2：涉及的两点的Utility变化 0.3267  0.5000 0.2848(x>0) 0.6099(x=1)
                %0.3043(x<=2) ||sina  x=1;
                U=socialgame(all_shortest_paths(train));
                utility=U(i)+U(j)-U0(i)-U0(j);
                %策略3：涉及的两点的各自一阶子图结构Utility变化 0.3747 0.5614 0.3829(x<=2)
                %0.3509(x=1) 0.3772(x>0) 0.3673(x<=3) ||sina 0.5241 x=1;
                %U=socialgame(all_shortest_paths(train));
                %SWi=sum(U(train(i,:)==1));
                %SWi0=sum(U0(train(i,:)==1));
                %SWj=sum(U(train(j,:)==1));
                %SWj0=sum(U0(train(j,:)==1));
                %utility=SWi-SWi0+SWj-SWj0;
                %策略4：涉及的两点的共同邻居（一阶连通结构）Utility变化 0.5000
                %utility=0;
                %U=socialgame(all_shortest_paths(train));
                %for cn=1:m
                %    if train(i,cn)==1&&train(j,cn)==1
                %        utility=utility+U(cn)-U0(cn)
                %    end
                %end
                test_pre=[test_pre utility];
                train(i,j)=0;
                count=count+1; 
                count/test_num
            end
        end
    end
    count=0;
    for i=1:size(non)
        for j=1:size(non)
            if non(i,j)==1
                train(i,j)=1;
                %策略1：总的SW变化，不考虑分区
                %SW=sum(socialgame(all_shortest_paths(train)));
                %utility=SW-SW0;
                %策略2：涉及的两点的Utility变化
                U=socialgame(all_shortest_paths(train));
                utility=U(i)+U(j)-U0(i)-U0(j);
                %策略3：涉及的两点的各自一阶子图结构Utility变化
                %U=socialgame(all_shortest_paths(train));
                %SWi=sum(U(train(i,:)==1));
                %SWi0=sum(U0(train(i,:)==1));
                %SWj=sum(U(train(j,:)==1));
                %SWj0=sum(U0(train(j,:)==1));
                %utility=SWi-SWi0+SWj-SWj0;
                %策略4：涉及的两点的共同邻居（一阶连通结构）Utility变化 
                %utility=0;
                %U=socialgame(all_shortest_paths(train));
                %for cn=1:m
                %    if train(i,cn)==1&&train(j,cn)==1
                %        utility=utility+U(cn)-U0(cn)
                %    end
                %end
                non_pre=[non_pre utility];
                train(i,j)=0;
                count=count+1;
                count/non_num
            end
        end
    end
    % ceil是取大于等于的最小整数，n为抽样比较的次数
    % 生成n个待比较位置，构成一个向量
    test_rd = ceil( test_num * rand( 1, n));  
    non_rd = ceil( non_num * rand( 1, n));
    test_data =  test_pre';  
    % 行向量，test 集合存在的边的预测值
    non_data =  non_pre';   
    % 行向量，nonexist集合存在的边的预测值
    test_rd = test_data( test_rd );
    non_rd = non_data( non_rd );
    clear test_data non_data;
    n1 = length( find(test_rd > non_rd) );  
    n2 = length( find(test_rd == non_rd));
    auc = ( n1 + 0.5*n2 ) / n;
end