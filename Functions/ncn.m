function [ b ] = ncn( N,K )
%�������������������磺�ڵ���N��ÿ���ڵ�������K�����Ҹ�K/2���ڵ�����
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

