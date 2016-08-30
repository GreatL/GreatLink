function [ b ] = ncn( N,K )
%生成无向最近邻耦合网络：节点数N，每个节点连边数K，左右各K/2个节点相连
%   Detailed explanation goes here
b=zeros(N);
for i=1:N
    for j=(i+1):(i+K/2)
        if j<=N
            b(i,j)=1;
            b(j,i)=1;
        else
            b(i,j-N)=1;
            b(j-N,i)=1;
        end
    end
end
end

