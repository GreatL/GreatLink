%%����net���Ӿ���ת��Ϊlinklist�����б�

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
%д���ļ�
% fid=fopen('linklist.txt','wt');
% n=size(linklist);
% for k=1:n
%     for kk=1:2
%         fprintf(fid,'%g ',linklist(k,kk));
%     end
%     fprintf(fid,'\n');
% end
% fclose(fid);
