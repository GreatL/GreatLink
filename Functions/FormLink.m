%%根据net链接矩阵转化为linklist链接列表

function [linklist ] = FormLink( net)
num=size(net);
num=num(1);
linklist=[];
for i=1:num
    for j=1:num
        if net(i,j)>0
            linklist=[linklist;[i,j]];
        end
    end
end
%写入文件
% fid=fopen('linklist.txt','wt');
% n=size(linklist);
% for k=1:n
%     for kk=1:2
%         fprintf(fid,'%g ',linklist(k,kk));
%     end
%     fprintf(fid,'\n');
% end
% fclose(fid);
