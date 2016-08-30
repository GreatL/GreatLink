function [ b ] = ba( M,m,N )
%生成无向BA无标度网络，节点数N，初始连通网络节点数M，每次引入的新节点连接到已存在的节点个数m
%   Detailed explanation goes here
b=zeros(N);

if M==1
    M=2;
end

for i=1:M-1
    for j=(i+1):M
        b(i,j)=1;
        b(j,i)=1;
    end
end

d=zeros(N,1);
for i=1:M
    d(i,1)=M-1;
end

for i=M+1:N
    mm=0;
    dd=d(1:i-1,1);
    while mm<m
        mm=mm+1;
        dn=0;
        for j=1:i-1
            dn=dn+dd(j,1);
        end
        p=zeros(i-1,1);
        p(1,1)=dd(1,1)/dn;
        for j=2:i-1
            p(j,1)=p(j-1,1)+dd(j,1)/dn;
        end
        r=rand;
        for j=1:i-1
            if r<p(j,1)
                b(i,j)=1;
                b(j,i)=1;
                d(i,1)=d(i,1)+1;
                d(j,1)=d(j,1)+1;
                dd(j,1)=0;
                break;
            end
        end
    end
end
end

