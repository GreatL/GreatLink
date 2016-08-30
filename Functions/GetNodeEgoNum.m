%获得一个节点ID对应的2阶ego网络链接列表的链接数以及占全网的比例
function [egonum1,egonum2,ratio]=GetNodeEgoNum(node,linklist)
    num=size(linklist); %获得链路数量
    num=num(1); 
    %rmin=min(min(linklist(:,1)),min(linklist(:,2)));%节点编号最小值
    %rmax=max(max(linklist(:,1)),max(linklist(:,2)));%节点编号最大值
    index=[];
    id=[];
    for nn=1:num
        if linklist(nn,1)==node
            id=[id linklist(nn,2)];%一阶邻居ID索引
            index=[index nn];%一阶邻居位置索引
        elseif linklist(nn,2)==node
            id=[id linklist(nn,1)];%一阶邻居ID索引
            index=[index nn];%一阶邻居位置索引
        end
    end
    index1=unique(index);
    temp1=size(index1);
    if temp1(1)==0
        disp('egonet1无此节点ID！');
        egonum1=0;
    else
        egonum1=temp1(2);
    end
    id=unique(id);
    n2=max(size(id));
    for nn=1:num
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
        disp('egonet2无此节点ID！');
        egonum2=0;
        ratio=0;
    else
        egonum2=temp(2);
        ratio=egonum2/num;
        fprintf('节点ID：%d，1阶邻居个数：%d，2阶邻居个数：%d，链接数占比：%f\n',node,egonum1,temp(2),temp(2)/num);
        %egolist=linklist(index,:);
    end

end