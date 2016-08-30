function [ ego ] = GetEgo( n,train)
%% ¼ÆËãn½×egoÍøÂçË÷Òı
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