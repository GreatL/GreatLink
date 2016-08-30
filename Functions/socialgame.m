function [U]=socialgame(netdist)
n=size(netdist,1);
u=zeros(1,n);
for i=1:n
    for j=1:n
        if i~=j
            u(i)=u(i)+1./netdist(i,j);
        end
    end
    %u(i)=u(i)/n;
    x=1;%x:╪╦╫ваз╬с
    u(i)=u(i)*max(size(netdist(netdist(i,:)<=x)))/n;
end
U=u;