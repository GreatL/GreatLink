function [ b ] = ws( N,K,p )
%��������WSС�������磬�ڵ���N��ÿ���ڵ�������K�����߸���p
%   Detailed explanation goes here
b=ncn(N,K);
for i=1:N-1
    for j=i+1:N
        if b(i,j)~=0
            if rand<p
                b(i,j)=0;
                b(j,i)=0;
                c=1:N-1;
                c=c';
                for h=N-1:(-1):i
                    c(h,1)=h+1;
                end
                d=ceil((N-1)*rand);
                s=c(d,1);
                b(i,s)=1;
                b(s,i)=1;
            end
        end
    end
end
end

