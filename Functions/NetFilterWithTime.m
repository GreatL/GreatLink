function [ net ] = NetFilterWithTime( linklist,tmin,tmax )
%byGreatL@20160322
%Ĭ�ϸ�ʽ��linklistΪ4�У���1,2��Ϊ�ڵ���ţ���3��ΪȨ�أ���4��Ϊʱ���
%���÷�ʽ��net=NetFilterWithTime(linklist,min(linklist(:,4)),max(linklist(:,4)))��
%һ��Լ����ʱ���
num=size(linklist);
net=[];
for i=1:num(1)
    if linklist(i,4)>=tmin && linklist(i,4)<=tmax
        temp=linklist(i,:);
        net=[net;temp];
    end
end
clear temp;
clear i;
clear num;
end

