function [ b ] = er( N,p )
%��������ER������磬�ڵ���N���ڵ����߸���p
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

