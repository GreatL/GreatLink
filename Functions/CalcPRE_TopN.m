function [ pre ] = CalcPRE_TopN( train, test, sim, topn )
%% ����PRE�������������ƶȾ���ǰtopn׼ȷ��
if topn>nnz(test)
    topn=nnz(test)
    fprintf('total num:%d',topn);
end
sim=triu(sim-sim.*train);
sim=sim-diag(diag(sim));
[temp,pos]=sort(sim(:),'descend');
clear temp;
npos=pos(1:topn);
pre=sum(test(npos))/topn;
pre=full(pre);
end