function [ mp ] = powermeasure( M )
%powermeasure �����������
%   ����"���Ӿ���"������Ϊ����
%   ����Gs��׼����
%   ��������cֵ
%   ���������������Ӧÿһ���ڵ�
%   ����ΰ@2014v10.26
[i,j]=size(M);
if i~=j
    disp('����M���Ƿ���');
    return;
end
%%disp('����Gs......');
%%tic;
Gs=-M+M';
for m=1:i;Gs(m,m)=1;end
%Gs
es=ones(i,1);
%%disp('��������c......');
%c=1/(es'*inv(Gs)*es); �������棬���������
c=1/(es'*(Gs\ones(i,1))*es);
%mp=inv(Gs)*c*es; �������棬���������
mp=(Gs\ones(i,1))*c*es;
%%toc;
end