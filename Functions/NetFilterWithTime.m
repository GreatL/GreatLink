function [ net ] = NetFilterWithTime( linklist,tmin,tmax )
%byGreatL@20160322
%默认格式：linklist为4列，第1,2列为节点序号，第3列为权重，第4列为时间戳
%调用方式：net=NetFilterWithTime(linklist,min(linklist(:,4)),max(linklist(:,4)))等
%一种约束：时间戳
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

