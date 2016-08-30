function [ mp ] = powermeasure( M )
%powermeasure 计算度量向量
%   输入"连接矩阵"，必须为方阵
%   生成Gs标准方阵
%   计算最优c值
%   输出度量向量，对应每一个节点
%   刘大伟@2014v10.26
[i,j]=size(M);
if i~=j
    disp('输入M不是方阵！');
    return;
end
%%disp('生成Gs......');
%%tic;
Gs=-M+M';
for m=1:i;Gs(m,m)=1;end
%Gs
es=ones(i,1);
%%disp('计算最优c......');
%c=1/(es'*inv(Gs)*es); 避免求逆，用左除代替
c=1/(es'*(Gs\ones(i,1))*es);
%mp=inv(Gs)*c*es; 避免求逆，用左除代替
mp=(Gs\ones(i,1))*c*es;
%%toc;
end