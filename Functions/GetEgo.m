function [ ego ] = GetEgo( n,train)
%% ����n��ego��������
    if n==1
        ego=train|zeros(max(size(train))); 
    else
        for i=2:n
            temp=train*train;
        end
        ego=temp|zeros(max(size(train)));
    end
    clear temp;
end