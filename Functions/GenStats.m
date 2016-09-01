function stats=GenStats(net)
%获得26种网络属性统计结果

%暂略
%fprintf('度分布属性 - 富者俱乐部效应:rho=');
%temp=konect_statistic_assortativity(net,1,1);
%stats.rho=temp(1);
%fprintf('%f\n',stats.rho);

fprintf('度分布属性 - 基尼系数:gini=');
stats.gini=konect_statistic_gini(net,1,1);
fprintf('%f\n',stats.gini);

fprintf('度分布属性 - 边分布熵:entropye=');
stats.entropye=konect_statistic_dentropy(net,1,1);
fprintf('%f\n',stats.entropye);

fprintf('度分布属性 - 度分布熵:entropyd=');
stats.entropyd=konect_statistic_dentropy2(net,1,1);
fprintf('%f\n',stats.entropyd);

fprintf('度分布属性 - 标准化边分布熵:nentropye=');
stats.nentropye=konect_statistic_dentropyn(net,1,1);
fprintf('%f\n',stats.nentropye);

fprintf('度分布属性 - 洛伦兹曲线:own=');
stats.own=konect_statistic_own(net,1,1);
fprintf('%f\n',stats.own);

fprintf('度分布属性 - 幂律系数:power');
temp=konect_statistic_power(net,1,1);
stats.power1=temp(1);
stats.power2=temp(2);
fprintf('%f,%f\n',stats.power1,stats.power2);

fprintf('基本属性 - 平均度:ad=');
temp=konect_statistic_avgdegree(net,1,1);
stats.ad=temp(1);
fprintf('%f\n',stats.ad);

fprintf('基本属性 - 填充度:fill=');
temp=konect_statistic_fill(net,1,1);
stats.fill=temp(1);
fprintf('%f\n',stats.fill);

fprintf('基本属性 - 最大度:maxd=');
stats.maxd=konect_statistic_maxdegree(net,1,1);
fprintf('%f\n',stats.maxd);

fprintf('基本属性 - 连边数:m=');
stats.m=konect_statistic_volume(net,1,1);
fprintf('%d\n',stats.m);

fprintf('基本属性 - 负边比例:negativity=');
stats.negativity=konect_statistic_negativity(net,1,1);
fprintf('%f\n',stats.negativity);

fprintf('基本属性 - 节点数:n=');
stats.n=konect_statistic_size(net,1,1);
fprintf('%d\n',stats.n);

fprintf('基本属性 - 不同连边数:uniquem=');
stats.uniquem=konect_statistic_uniquevolume(net,1,1);
fprintf('%d\n',stats.uniquem);

fprintf('集聚属性 - 全局簇系数:global clusco=');
temp=konect_statistic_clusco(net,1,1);
stats.g1=temp(7);
stats.g2=temp(1);
fprintf('%f,%f\n',stats.g1,stats.g2);

fprintf('计数属性 - 四边形:q=');
stats.q=konect_statistic_squares(net,1,1);
fprintf('%f\n',stats.q);

fprintf('计数属性 - 二边星:s=');
stats.s=konect_statistic_twostars(net,1,1);
fprintf('%f\n',stats.s);

fprintf('计数属性 - 三角形:t=');
stats.t=konect_statistic_triangles(net,1,1);
fprintf('%f\n',stats.t);

fprintf('计数属性 - 四边星:x=');
stats.x=full(konect_statistic_fourstars(net,1,1));
fprintf('%f\n',stats.x);

fprintf('计数属性 - 三边星:z=');
stats.z=full(konect_statistic_threestars(net,1,1));
fprintf('%f\n',stats.z);

fprintf('距离属性 - 最大偏心率:diam=');
stats.diam=konect_statistic_diam(net,1,1);
fprintf('%f\n',stats.diam);

fprintf('距离属性 - 平均距离:meandist=');
stats.meandist=konect_statistic_meandist(net,1,1);
fprintf('%f\n',stats.meandist);

fprintf('距离属性 - 最短路径中值:mediandist=');
stats.mediandist=konect_statistic_mediandist(net,1,1);
fprintf('%f\n',stats.mediandist);

fprintf('连通属性 - 最大连通:coco=');
temp=konect_statistic_coco(net,1,1);
stats.cocosize=temp(1);
stats.coconum=temp(2);
fprintf('分支大小%d,分支个数%d\n',stats.cocosize,stats.coconum);

clear temp;
end