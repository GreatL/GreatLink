function [ ss ] = GetSim_LS( train,N,select)
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
%����������ۼ�ϵ�����ָ��
    if select==1
        %1.ȡ��ͬ�ھ�������ľֲ��ۼ�ϵ����3�������,ÿ����ľۼ�ϵ��֮��
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=sum(l);
    elseif select==2
        %2.ȡ��ͬ�ھ�������ľֲ��ۼ�ϵ����3�������,ÿ����ľۼ�ϵ��֮������
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=sum(1./l);
    elseif select==3
        %3.ȡ��ͬ�ھ�������ľֲ��ۼ�ϵ����3�������,�ܵľۼ�ϵ��(��1���㷨3t/s,��ͬ)
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=g1;
    elseif select==4
        %4.ȡ��ͬ�ھ�������ľֲ��ۼ�ϵ����3�������,�ܵľۼ�ϵ���ĵ���
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=1/g1;
    elseif select==5
        %5.ȡ��ͬ�ھ�������ľֲ��ۼ�ϵ����3�������,�ܵľۼ�ϵ��*��ͬ�ھӸ���
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=ss(x(num),y(num))*g1;  
    elseif select==6
        %6.ȡ��ͬ�ھ�������ľֲ��ۼ�ϵ����3�������,�ܵľۼ�ϵ���ĵ���*��ͬ�ھӸ���
        [l,g1,g2]=konect_clusco(subnet);
        ss(x(num),y(num))=ss(x(num),y(num))*(1/g1);
    elseif select==7
        %7.ȡ��ͬ�ھ�������ľֲ��ۼ�ϵ����3���������ÿ����ľۼ�ϵ��������ȫ���ľۼ�ϵ��֮��ֵ�����
        [l,g1,g2]=konect_clusco(subnet);
        gl=konect_clusco(train);
        ss(x(num),y(num))=sum(l./gl(cn));
%��������������ָ��        
    elseif select==8
        %8.ȡ��ͬ�ھ�������ľֲ��ȣ�ÿ����ľֲ��ȵĵ�����
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