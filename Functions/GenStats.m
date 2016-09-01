function stats=GenStats(net)
%���26����������ͳ�ƽ��

%����
%fprintf('�ȷֲ����� - ���߾��ֲ�ЧӦ:rho=');
%temp=konect_statistic_assortativity(net,1,1);
%stats.rho=temp(1);
%fprintf('%f\n',stats.rho);

fprintf('�ȷֲ����� - ����ϵ��:gini=');
stats.gini=konect_statistic_gini(net,1,1);
fprintf('%f\n',stats.gini);

fprintf('�ȷֲ����� - �߷ֲ���:entropye=');
stats.entropye=konect_statistic_dentropy(net,1,1);
fprintf('%f\n',stats.entropye);

fprintf('�ȷֲ����� - �ȷֲ���:entropyd=');
stats.entropyd=konect_statistic_dentropy2(net,1,1);
fprintf('%f\n',stats.entropyd);

fprintf('�ȷֲ����� - ��׼���߷ֲ���:nentropye=');
stats.nentropye=konect_statistic_dentropyn(net,1,1);
fprintf('%f\n',stats.nentropye);

fprintf('�ȷֲ����� - ����������:own=');
stats.own=konect_statistic_own(net,1,1);
fprintf('%f\n',stats.own);

fprintf('�ȷֲ����� - ����ϵ��:power');
temp=konect_statistic_power(net,1,1);
stats.power1=temp(1);
stats.power2=temp(2);
fprintf('%f,%f\n',stats.power1,stats.power2);

fprintf('�������� - ƽ����:ad=');
temp=konect_statistic_avgdegree(net,1,1);
stats.ad=temp(1);
fprintf('%f\n',stats.ad);

fprintf('�������� - ����:fill=');
temp=konect_statistic_fill(net,1,1);
stats.fill=temp(1);
fprintf('%f\n',stats.fill);

fprintf('�������� - ����:maxd=');
stats.maxd=konect_statistic_maxdegree(net,1,1);
fprintf('%f\n',stats.maxd);

fprintf('�������� - ������:m=');
stats.m=konect_statistic_volume(net,1,1);
fprintf('%d\n',stats.m);

fprintf('�������� - ���߱���:negativity=');
stats.negativity=konect_statistic_negativity(net,1,1);
fprintf('%f\n',stats.negativity);

fprintf('�������� - �ڵ���:n=');
stats.n=konect_statistic_size(net,1,1);
fprintf('%d\n',stats.n);

fprintf('�������� - ��ͬ������:uniquem=');
stats.uniquem=konect_statistic_uniquevolume(net,1,1);
fprintf('%d\n',stats.uniquem);

fprintf('�������� - ȫ�ִ�ϵ��:global clusco=');
temp=konect_statistic_clusco(net,1,1);
stats.g1=temp(7);
stats.g2=temp(1);
fprintf('%f,%f\n',stats.g1,stats.g2);

fprintf('�������� - �ı���:q=');
stats.q=konect_statistic_squares(net,1,1);
fprintf('%f\n',stats.q);

fprintf('�������� - ������:s=');
stats.s=konect_statistic_twostars(net,1,1);
fprintf('%f\n',stats.s);

fprintf('�������� - ������:t=');
stats.t=konect_statistic_triangles(net,1,1);
fprintf('%f\n',stats.t);

fprintf('�������� - �ı���:x=');
stats.x=full(konect_statistic_fourstars(net,1,1));
fprintf('%f\n',stats.x);

fprintf('�������� - ������:z=');
stats.z=full(konect_statistic_threestars(net,1,1));
fprintf('%f\n',stats.z);

fprintf('�������� - ���ƫ����:diam=');
stats.diam=konect_statistic_diam(net,1,1);
fprintf('%f\n',stats.diam);

fprintf('�������� - ƽ������:meandist=');
stats.meandist=konect_statistic_meandist(net,1,1);
fprintf('%f\n',stats.meandist);

fprintf('�������� - ���·����ֵ:mediandist=');
stats.mediandist=konect_statistic_mediandist(net,1,1);
fprintf('%f\n',stats.mediandist);

fprintf('��ͨ���� - �����ͨ:coco=');
temp=konect_statistic_coco(net,1,1);
stats.cocosize=temp(1);
stats.coconum=temp(2);
fprintf('��֧��С%d,��֧����%d\n',stats.cocosize,stats.coconum);

clear temp;
end