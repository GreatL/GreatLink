%���һ���ڵ�ID��Ӧ��2��ego���������б���������Լ�ռȫ���ı���
function [egonum1,egonum2,ratio]=GetNodeEgoNum(node,linklist)
    num=size(linklist); %�����·����
    num=num(1); 
    %rmin=min(min(linklist(:,1)),min(linklist(:,2)));%�ڵ�����Сֵ
    %rmax=max(max(linklist(:,1)),max(linklist(:,2)));%�ڵ������ֵ
    index=[];
    id=[];
    for nn=1:num
        if linklist(nn,1)==node
            id=[id linklist(nn,2)];%һ���ھ�ID����
            index=[index nn];%һ���ھ�λ������
        elseif linklist(nn,2)==node
            id=[id linklist(nn,1)];%һ���ھ�ID����
            index=[index nn];%һ���ھ�λ������
        end
    end
    index1=unique(index);
    temp1=size(index1);
    if temp1(1)==0
        disp('egonet1�޴˽ڵ�ID��');
        egonum1=0;
    else
        egonum1=temp1(2);
    end
    id=unique(id);
    n2=max(size(id));
    for nn=1:num
        for mm=1:n2
            if linklist(nn,1)==id(mm);
                index=[index nn];%���϶����ھ�λ������
            elseif linklist(nn,2)==id(mm);
                index=[index nn];
            end
        end
    end
    index=unique(index);
    temp=size(index);
    if temp(1)==0
        disp('egonet2�޴˽ڵ�ID��');
        egonum2=0;
        ratio=0;
    else
        egonum2=temp(2);
        ratio=egonum2/num;
        fprintf('�ڵ�ID��%d��1���ھӸ�����%d��2���ھӸ�����%d��������ռ�ȣ�%f\n',node,egonum1,temp(2),temp(2)/num);
        %egolist=linklist(index,:);
    end

end