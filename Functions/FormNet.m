function [ net ] = FormNet( linklist , type)
%% ���������б�linklist�����������ڽӾ���net
    %����ڵ��Ŵ�0��ʼ�������нڵ��ż�1��matlab���±��1��ʼ��
    if ~all(all(linklist(:,1:2)))
        linklist(:,1:2) = linklist(:,1:2)+1;
    end
    if type==0
        %����ͼ
        linklist(:,3)=1;          %��������Ԫ����Ϊ1,���������ߵ�Ȩ��
        net=spconvert(linklist);  %ת��Ϊϡ�����
        nodenum=length(net);      %�ڵ����
        net(nodenum,nodenum)=0;   %�޶������С                
        net=net-diag(diag(net));  %�˴�ɾ���Ի����Խ�ԪΪ0�Ա�֤Ϊ����
        net=spones(net + net');   % ȷ���ڽӾ���Ϊ�Գƾ��󣬼���Ӧ����������
    elseif type==1
        %����ͼ
        linklist(:,3)=1;
        net=spconvert(linklist);
        nodenum=max(size(net));
        net(nodenum,nodenum)=0;
        net=net-diag(diag(net));
    else
        disp('��ѡ����������');
        disp('0���������磻1����������');
    end
end 
% ת�����̽������õ�������ڽӾ���
