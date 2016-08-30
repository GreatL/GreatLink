function [ net ] = NetFilterWithNodeAndTime( linklist,rmin,rmax,tmin,tmax )
%byGreatL@20160322
%默认格式：linklist为4列，第1,2列为节点序号，第3列为权重，第4列为时间戳
%调用方式：net=NetFilterWithNodeAndTime(linklist,0,5000,min(linklist(:,4)),max(linklist(:,4)))等
%两种约束：节点序号和时间戳
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

