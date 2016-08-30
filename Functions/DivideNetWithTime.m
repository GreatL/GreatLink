%%根据linklist的时序，划分训练集和测试集，训练集比例为ratioTrain
function [ train, test ] = DivideNetWithTime( linklist, ratioTrain)
%%划分训练集和测试集，无向网络
num=size(linklist); %获得链路数量
num=num(1); 
timeline=sortrows(linklist,4);
plot(timeline(:,4));
hold on;
tt=timeline(floor(num*ratioTrain),4); %获得80%数据时间戳
text(floor(num*ratioTrain),tt,'\leftarrowR%');
train=timeline(1:floor(num*ratioTrain),:);
train=FormNet(train,0);
test=timeline(floor(num*ratioTrain)+1:num,:);
test=FormNet(test,0);
end

