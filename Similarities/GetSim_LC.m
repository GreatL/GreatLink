function [ ss ] = GetSim_LC( train,N,beta)
%%�����������ͨ��������ȡ��ͨ������,������Ӧͳ��ָ��

%�õ�N����ͨ����
ss=train;
for n=1:N-1
    ss=ss*train;
end

%��λѵ������N����������Ľڵ��
[x,y]=find(ss>0);
NUM=nnz(x);
for num=1:NUM
    nx=find(train(x(num),:)==1);
    nx=find(train(y(num),:)==1);
    cn=intersect(nx,nx);
    subnet=train(cn,cn);
    %���ƶȼ���
    %5.ȡ��ͬ�ھ�������ľֲ��ۼ�ϵ����3�������,�ܵľۼ�ϵ��*��ͬ�ھӸ���
    [l,g1,g2]=konect_clusco(subnet);
    ss(x(num),y(num))=ss(x(num),y(num))*(beta+g1);  
end
    ss(isnan(ss)) = 0; 
    ss(isinf(ss)) = 0;
end