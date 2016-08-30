function [ net ] = FormNet( linklist , type)
%% 读入连边列表linklist，构建网络邻接矩阵net
    %如果节点编号从0开始，将所有节点编号加1（matlab的下标从1开始）
    if ~all(all(linklist(:,1:2)))
        linklist(:,1:2) = linklist(:,1:2)+1;
    end
    if type==0
        %无向图
        linklist(:,3)=1;          %将第三列元素置为1,不考虑连边的权重
        net=spconvert(linklist);  %转换为稀疏矩阵
        nodenum=length(net);      %节点个数
        net(nodenum,nodenum)=0;   %限定方阵大小                
        net=net-diag(diag(net));  %此处删除自环，对角元为0以保证为方阵
        net=spones(net + net');   % 确保邻接矩阵为对称矩阵，即对应于无向网络
    elseif type==1
        %有向图
        linklist(:,3)=1;
        net=spconvert(linklist);
        nodenum=max(size(net));
        net(nodenum,nodenum)=0;
        net=net-diag(diag(net));
    else
        disp('请选择网络类型');
        disp('0：无向网络；1：有向网络');
    end
end 
% 转换过程结束，得到网络的邻接矩阵
