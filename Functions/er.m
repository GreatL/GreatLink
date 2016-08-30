function [ b ] = er( N,p )
%生成无向ER随机网络，节点数N，节点连边概率p
%   Detailed explanation goes here
b=zeros(N);
for i=1:N-1
    for j=(i+1):N
        r=rand;
        if r<p
            b(i,j)=1;
            b(j,i)=1;
        end
    end
end
end

