%���һ���ڵ�ID��Ӧ��2��ego���������б�
function [egolist]=GetNodeEgo(node,linklist)
    num=size(linklist); %�����·����
    num=num(1); 
    rmin=min(min(linklist(:,1)),min(linklist(:,2)));%�ڵ�����Сֵ
    rmax=max(max(linklist(:,1)),max(linklist(:,2)));%�ڵ������ֵ
    index=[];
    id=[];
    for nn=rmin:rmax
        if linklist(nn,1)==node
            id=[id linklist(nn,2)];%һ���ھ�ID����
            index=[index nn];%һ���ھ�λ������
        elseif linklist(nn,2)==node
            id=[id linklist(nn,1)];%һ���ھ�ID����
            index=[index nn];%һ���ھ�λ������
        end
    end
    n2=max(size(id));
    for nn=rmin:rmax
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
        disp('�޴˽ڵ�ID��');
    end
    fprintf('�ڵ�ID��%d���ھӸ�����%d��������ռ�ȣ�%f\n',node,temp(2),temp(2)/num);
    egolist=linklist(index,:);
end