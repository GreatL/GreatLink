function [ net ] = NetFilterWithNodeAndTime( linklist,rmin,rmax,tmin,tmax )
%byGreatL@20160322
%Ĭ�ϸ�ʽ��linklistΪ4�У���1,2��Ϊ�ڵ���ţ���3��ΪȨ�أ���4��Ϊʱ���
%���÷�ʽ��net=NetFilterWithNodeAndTime(linklist,0,5000,min(linklist(:,4)),max(linklist(:,4)))��
%����Լ�����ڵ���ź�ʱ���
num=size(linklist);
net=[];
for i=1:num(1)
    if linklist(i,1)>=rmin && linklist(i,1)<=rmax && linklist(i,2)>rmin && linklist(i,2)<=rmax
        if linklist(i,4)>=tmin && linklist(i,4)<=tmax
            temp=linklist(i,:);
            net=[net;temp];
        end
    end
end
clear temp;
clear i;
clear num;
end

