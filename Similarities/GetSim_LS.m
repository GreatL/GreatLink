function [ ss ] = GetSim_LS( train,N,select)
%%给定网络和连通阶数，抽取连通子网络,返回相应统计指标

%得到N阶连通网络
ss=train;
for n=1:N-1
    ss=ss*train;
end

%定位训练集中N阶相邻网络的节点对
[x,y]=find(ss>0);
NUM=nnz(x);
for num=1:NUM
    nx=find(train(x(num),:)==1);
    nx=find(train(y(num),:)==1);
    cn=intersect(nx,nx);
    subnet=train(cn,cn);
    %相似度计算
%基于子网络聚集系数相关指标
    if select==1
        %1.取共同邻居子网络的局部聚集系数（3个输出）,每个点的聚集系数之和
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=sum(l);
    elseif select==2
        %2.取共同邻居子网络的局部聚集系数（3个输出）,每个点的聚集系数之倒数和
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=sum(1./l);
    elseif select==3
        %3.取共同邻居子网络的局部聚集系数（3个输出）,总的聚集系数(第1种算法3t/s,下同)
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=g1;
    elseif select==4
        %4.取共同邻居子网络的局部聚集系数（3个输出）,总的聚集系数的倒数
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=1/g1;
    elseif select==5
        %5.取共同邻居子网络的局部聚集系数（3个输出）,总的聚集系数*共同邻居个数
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=ss(x(num),y(num))*g1;  
    elseif select==6
        %6.取共同邻居子网络的局部聚集系数（3个输出）,总的聚集系数的倒数*共同邻居个数
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=ss(x(num),y(num))*(1/g1);
    elseif select==7
        %7.取共同邻居子网络的局部聚集系数（3个输出），每个点的聚集系数与其在全网的聚集系数之比值再求和
        [l,g1,g2]=konect_clusco(subnet);
        gl=konect_clusco(train);
        ss(x(num),y(num))=sum(l./gl(cn));
%基于子网络度相关指标        
    elseif select==8
        %8.取共同邻居子网络的局部度，每个点的局部度的倒数和
        deg=[];
        for cnn=1:nnz(cn)
            deg=[deg sum(subnet(cnn,:))];
        end
        ss(x(num),y(num))=sum(1./deg);
    elseif select==9
        
    end
    %fprintf('Calculating %d of %d\n',num,NUM);
end
    ss(isnan(ss)) = 0; 
    ss(isinf(ss)) = 0;
end