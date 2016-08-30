%改变一个矩阵中对应index的节点的影响n倍
function [newnet]=RmVNode(net,index,n)
    newnet=net;
    num=max(size(net));
    numindex=max(size(index));
    for i=1:numindex
        newnet(:,index(i))=newnet(:,index(i))*n;
        newnet(index(i),:)=newnet(:,index(i))*n;
    end 
end