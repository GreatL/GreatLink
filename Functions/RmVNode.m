%�ı�һ�������ж�Ӧindex�Ľڵ��Ӱ��n��
function [newnet]=RmVNode(net,index,n)
    newnet=net;
    num=max(size(net));
    numindex=max(size(index));
    for i=1:numindex
        newnet(:,index(i))=newnet(:,index(i))*n;
        newnet(index(i),:)=newnet(:,index(i))*n;
    end 
end