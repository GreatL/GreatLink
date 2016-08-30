%获得一个节点ID的度(输入链接列表)
function [degree,id]=GetNodeDegree(node,linklist)
    num=size(linklist); %获得链路数量
    num=num(1);
    rmin=min(min(linklist(:,1)),min(linklist(:,2)));%节点编号最小值
    rmax=max(max(linklist(:,1)),max(linklist(:,2)));%节点编号最大值
    id=[];
    for nn=1:num
        if linklist(nn,1)==node
            id=[id linklist(nn,2)];%一阶邻居ID索引
        elseif linklist(nn,2)==node
            id=[id linklist(nn,1)];%一阶邻居ID索引
        end
    end
    id=unique(id);
    temp=size(id);
    if temp(1)==0
        disp('此节点无度！');
        degree=0;
    else
        degree=temp(2);
    end
end