function [auc] = SDG( train, test )
%% ����Social Distance Gameָ�겢����AUCֵ
    n=10000;
    m=size(train,1);
    D0=all_shortest_paths(train);
    U0=socialgame(D0);
    SW0=sum(U0)
    
    non = 1 - train - test - eye(max(size(train,1),size(train,2)));
    % �ֱ�ȡ���Լ��Ͳ����ڱ߼��ϣ�����ȡ�����Ƕ�Ӧ�����ƶȷ�ֵ
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
                %����1���ܵ�SW�仯�������Ƿ��� 0.2735 0.5090(x=1) 0.2763(x>0)
                %0.3222(x<=2) 0.2670(x<=3) ||
                %SW=sum(socialgame(all_shortest_paths(train)));
                %utility=SW-SW0;
                %����2���漰�������Utility�仯 0.3267  0.5000 0.2848(x>0) 0.6099(x=1)
                %0.3043(x<=2) ||sina  x=1;
                U=socialgame(all_shortest_paths(train));
                utility=U(i)+U(j)-U0(i)-U0(j);
                %����3���漰������ĸ���һ����ͼ�ṹUtility�仯 0.3747 0.5614 0.3829(x<=2)
                %0.3509(x=1) 0.3772(x>0) 0.3673(x<=3) ||sina 0.5241 x=1;
                %U=socialgame(all_shortest_paths(train));
                %SWi=sum(U(train(i,:)==1));
                %SWi0=sum(U0(train(i,:)==1));
                %SWj=sum(U(train(j,:)==1));
                %SWj0=sum(U0(train(j,:)==1));
                %utility=SWi-SWi0+SWj-SWj0;
                %����4���漰������Ĺ�ͬ�ھӣ�һ����ͨ�ṹ��Utility�仯 0.5000
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
                %����1���ܵ�SW�仯�������Ƿ���
                %SW=sum(socialgame(all_shortest_paths(train)));
                %utility=SW-SW0;
                %����2���漰�������Utility�仯
                U=socialgame(all_shortest_paths(train));
                utility=U(i)+U(j)-U0(i)-U0(j);
                %����3���漰������ĸ���һ����ͼ�ṹUtility�仯
                %U=socialgame(all_shortest_paths(train));
                %SWi=sum(U(train(i,:)==1));
                %SWi0=sum(U0(train(i,:)==1));
                %SWj=sum(U(train(j,:)==1));
                %SWj0=sum(U0(train(j,:)==1));
                %utility=SWi-SWi0+SWj-SWj0;
                %����4���漰������Ĺ�ͬ�ھӣ�һ����ͨ�ṹ��Utility�仯 
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
    % ceil��ȡ���ڵ��ڵ���С������nΪ�����ȽϵĴ���
    % ����n�����Ƚ�λ�ã�����һ������
    test_rd = ceil( test_num * rand( 1, n));  
    non_rd = ceil( non_num * rand( 1, n));
    test_data =  test_pre';  
    % ��������test ���ϴ��ڵıߵ�Ԥ��ֵ
    non_data =  non_pre';   
    % ��������nonexist���ϴ��ڵıߵ�Ԥ��ֵ
    test_rd = test_data( test_rd );
    non_rd = non_data( non_rd );
    clear test_data non_data;
    n1 = length( find(test_rd > non_rd) );  
    n2 = length( find(test_rd == non_rd));
    auc = ( n1 + 0.5*n2 ) / n;
end