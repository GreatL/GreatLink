function [ ss ] = GetSim_LC( train,N,beta)
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
    %5.取共同邻居子网络的局部聚集系数（3个输出）,总的聚集系数*共同邻居个数
    [l,g1,g2]=konect_clusco(subnet);
    ss(x(num),y(num))=ss(x(num),y(num))*(beta+g1);  
end
    ss(isnan(ss)) = 0; 
    ss(isinf(ss)) = 0;
end