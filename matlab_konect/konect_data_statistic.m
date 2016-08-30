%
% Properties of statistics.  All returned variables are structs in
% which each entry corresponds to a statistic name (with dashes
% replaced by underscores). 
%
% RESULT 
%	logarithmic	Whether values of the statistic are
%			logarithmic in nature, i.e., positive and
%			typically multiplied.  Non-logarithmic
%			statistics can have any real value and are
%			typically added.  This property is mainly
%			used for automatic plotting. 
%	integer		Whether the statistic is an integer 
%	percent		Whether the statistic is between 0 and 1
%
% ABOUT 
%	This file is part of the KONECT Matlab Toolbox version 0.3.
%	konect.uni-koblenz.de
%	(c) Jerome Kunegis 2014; this is Free Software released under
%	the GPLv3, see COPYING. 
%

function [logarithmic integer percent] = konect_data_statistic()

logarithmic.size 		= 1;
logarithmic.size_2		= 1;
logarithmic.size_3		= 1;
logarithmic.power		= 0;
logarithmic.powerv		= 0;
logarithmic.power2		= 0;
logarithmic.gini		= 0; 
logarithmic.volume 		= 1; 
logarithmic.uniquevolume 	= 1; 
logarithmic.avgdegree		= 1;
logarithmic.avgdegree_4		= 1;
logarithmic.fill		= 1;
logarithmic.diameter		= 1;
logarithmic.diam		= 1;
logarithmic.diam_3		= 0;
logarithmic.diam_4		= 0;
logarithmic.coco 		= 1;
logarithmic.coco_2		= 0;
logarithmic.coco_4 		= 0;
logarithmic.coco_6 		= 0;
logarithmic.cocos 		= 1;
logarithmic.cocos_2		= 0; 
logarithmic.snorm		= 1; 
logarithmic.alcon		= 1;
logarithmic.alconn		= 0;
logarithmic.dentropyn		= 0;
logarithmic.dentropy		= 0;
logarithmic.dentropy2		= 0;
logarithmic.network_rank_sq	= 0; 
logarithmic.network_rank_norm	= 0; 
logarithmic.network_rank_norm4	= 0; 
logarithmic.network_rank_abs	= 0; 
logarithmic.epower		= 0;
logarithmic.entropy		= 0;
logarithmic.entropyn		= 0;
logarithmic.aredis 		= 0;
logarithmic.separation		= 0;
logarithmic.separationl		= 0;
logarithmic.controllability	= 1;
logarithmic.controllabilityn	= 0;
logarithmic.own			= 0;
logarithmic.conflict		= 0;
logarithmic.conflictn		= 0;
logarithmic.asymmetry 		= 0; 
logarithmic.clusco 		= 1; 
logarithmic.clusco_5 		= 0; 
logarithmic.clusco_7		= 0; 
logarithmic.radius		= 1; 
logarithmic.maxdegree		= 1;
logarithmic.jain		= 0;
logarithmic.prefatt		= 0;
logarithmic.prefatt_2		= 0;
logarithmic.prefatt_3		= 0;
logarithmic.patest 		= 0;
logarithmic.reciprocity		= 0;
logarithmic.triangles 		= 1; 
logarithmic.anticonflict	= 1;
logarithmic.oddcycles		= 0; 
logarithmic.nonbip		= 0; 
logarithmic.nonbipn		= 1;
logarithmic.weight		= 1; 
logarithmic.negativity		= 0;
logarithmic.triangles_norm	= 0;
logarithmic.clusco_norm		= 0; 
logarithmic.clusco_norm_p	= 1;
logarithmic.triangles_norm_p	= 1;
logarithmic.twostars 		= 1;
logarithmic.lines		= 1;
logarithmic.twostars_norm_p	= 1;
logarithmic.twostars_coef	= 1;
logarithmic.twostars_norm_d	= 1; 
logarithmic.clusco_n		= 1;
logarithmic.twostars_perf	= 1;
logarithmic.squares 		= 1; 
logarithmic.tour4		= 1; 
logarithmic.threestars		= 1;
logarithmic.fourstars		= 1;
logarithmic.assortativity	= 0; 
logarithmic.mediandist		= 0;
logarithmic.meandist		= 1;
logarithmic.relmaxdegree	= 1;
logarithmic.cocorel		= 0;
logarithmic.cocorelinv		= 1;
logarithmic.degone		= 1;
logarithmic.diameff50		= 1;
logarithmic.diameff90		= 1;

integer.size 			= 1;
integer.size_2 			= 1;
integer.size_3 			= 1;
integer.power			= 0;
integer.powerv			= 0;
integer.power2			= 0;
integer.gini			= 0; 
integer.volume 			= 1; 
integer.uniquevolume 		= 1; 
integer.avgdegree		= 0;
integer.avgdegree_4		= 0;
integer.fill			= 0;
integer.diameter		= 0;
inteter.diam			= 1;
inteter.diam_3			= 0;
inteter.diam_4			= 0;
integer.coco 			= 1;
integer.coco_2			= 0; 
integer.coco_4 			= 1;
integer.coco_6 			= 1;
integer.cocos 			= 1;
integer.cocos_2			= 0; 
integer.snorm			= 0; 
integer.alcon			= 0;
integer.alconn			= 0;
integer.dentropyn		= 0;
integer.dentropy		= 0;
integer.dentropy2		= 0;
integer.network_rank_sq		= 0; 
integer.network_rank_norm	= 0; 
integer.network_rank_norm4	= 0; 
integer.network_rank_abs	= 0; 
integer.epower			= 0;
integer.entropy			= 0;
integer.entropyn		= 0;
integer.aredis 			= 0;
integer.separation		= 0;
integer.separationl		= 0;
integer.controllability		= 1;
integer.controllabilityn	= 0;
integer.own			= 0;
integer.conflict		= 0;
integer.conflictn		= 0;
integer.asymmetry 		= 0; 
integer.clusco 			= 0; 
integer.clusco_5 		= 0; 
integer.clusco_7		= 0; 
integer.radius			= 0; 
integer.maxdegree		= 1; 
integer.jain			= 0; 
integer.prefatt			= 0; 
integer.prefatt_2		= 0; 
integer.prefatt_3		= 0; 
integer.patest			= 0; 
integer.reciprocity		= 0; 
integer.triangles		= 1; 
integer.anticonflict		= 0;
integer.oddcycles		= 0; 
integer.nonbip			= 0; 
integer.nonbipn			= 0; 
integer.weight			= 0;
integer.negativity		= 0;
integer.triangles_norm		= 0;
integer.clusco_norm		= 0;
integer.clusco_norm_p		= 0;
integer.triangles_norm_p	= 0;
integer.twostars		= 1;
integer.lines			= 1;
integer.twostars_norm_p		= 0;
integer.twostars_coef		= 0;
integer.twostars_norm_d		= 0;
integer.clusco_n		= 0;
integer.twostars_perf		= 0;
integer.squares			= 1; 
integer.tour4			= 1; 
integer.threestars		= 1;
integer.fourstars		= 1;
integer.assortativity		= 0; 
integer.diam			= 1; 
integer.meandist		= 0; 
integer.mediandist		= 1; 
integer.relmaxdegree		= 0; 
integer.cocorel			= 0;
integer.cocorelinv		= 0;
integer.degone			= 0;
integer.diameff50		= 0;
integer.diameff90		= 0;

percent.gini 			= 1;
percent.clusco			= 1;
percent.volume			= 0;
percent.size			= 0;
percent.twostars		= 0;
percent.diam			= 0;
percent.meandist		= 0;
percent.threestars		= 0;
percent.fourstars		= 0;
percent.triangles		= 0;
percent.squares			= 0;
percent.power			= 0;
percent.assortativity		= 0;
percent.snorm			= 0;
percent.alcon			= 0;
percent.mediandist		= 0;
percent.relmaxdegree		= 0;
percent.cocorel			= 1; 
percent.cocorelinv		= 1; 
percent.degone			= 0;
percent.diameff50		= 0;
percent.diameff90		= 0;
