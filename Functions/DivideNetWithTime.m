%%����linklist��ʱ�򣬻���ѵ�����Ͳ��Լ���ѵ��������ΪratioTrain
function [ train, test ] = DivideNetWithTime( linklist, ratioTrain)
%%����ѵ�����Ͳ��Լ�����������
num=size(linklist); %�����·����
num=num(1); 
timeline=sortrows(linklist,4);
plot(timeline(:,4));
hold on;
tt=timeline(floor(num*ratioTrain),4); %���80%����ʱ���
text(floor(num*ratioTrain),tt,'\leftarrowR%');
train=timeline(1:floor(num*ratioTrain),:);
train=FormNet(train,0);
test=timeline(floor(num*ratioTrain)+1:num,:);
test=FormNet(test,0);
end

