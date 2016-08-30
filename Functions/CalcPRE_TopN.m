function [ pre ] = CalcPRE_TopN( train, test, sim, topn )
%% 计算PRE，输入计算的相似度矩阵，前topn准确率
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