%获得一个节点ID对应的2阶ego网络链接列表
function [egolist]=GetNodeEgo(node,linklist)
    num=size(linklist); %获得链路数量
    num=num(1); 
    rmin=min(min(linklist(:,1)),min(linklist(:,2)));%节点编号最小值
    rmax=max(max(linklist(:,1)),max(linklist(:,2)));%节点编号最大值
    index=[];
    id=[];
    for nn=rmin:rmax
        if linklist(nn,1)==node
            id=[id linklist(nn,2)];%一阶邻居ID索引
            index=[index nn];%一阶邻居位置索引
        elseif linklist(nn,2)==node
            id=[id linklist(nn,1)];%一阶邻居ID索引
            index=[index nn];%一阶邻居位置索引
        end
    end
    n2=max(size(id));
    for nn=rmin:rmax
        for mm=1:n2
            if linklist(nn,1)==id(mm);
                index=[index nn];%加上二阶邻居位置索引
            elseif linklist(nn,2)==id(mm);
                index=[index nn];
            end
        end
    end
    index=unique(index);
    temp=size(index);
    if temp(1)==0
        disp('无此节点ID！');
    end
    fprintf('节点ID：%d，邻居个数：%d，链接数占比：%f\n',node,temp(2),temp(2)/num);
    egolist=linklist(index,:);
end