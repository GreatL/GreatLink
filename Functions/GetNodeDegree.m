%���һ���ڵ�ID�Ķ�(���������б�)
function [degree,id]=GetNodeDegree(node,linklist)
    num=size(linklist); %�����·����
    num=num(1);
    rmin=min(min(linklist(:,1)),min(linklist(:,2)));%�ڵ�����Сֵ
    rmax=max(max(linklist(:,1)),max(linklist(:,2)));%�ڵ������ֵ
    id=[];
    for nn=1:num
        if linklist(nn,1)==node
            id=[id linklist(nn,2)];%һ���ھ�ID����
        elseif linklist(nn,2)==node
            id=[id linklist(nn,1)];%һ���ھ�ID����
        end
    end
    id=unique(id);
    temp=size(id);
    if temp(1)==0
        disp('�˽ڵ��޶ȣ�');
        degree=0;
    else
        degree=temp(2);
    end
end