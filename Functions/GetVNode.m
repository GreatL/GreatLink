function [index,degreelist,egodegreelist]=GetVNode(linklist)
    num=size(linklist); %获得链路数量
    num=num(1); 
    linklist=linklist(:,1:2);
    nodes=unique(linklist);
    nodenum=max(size(nodes));%获得节点数量
    degreelist=[];
    egodegreelist=[];
    fprintf('Calculating %d:',nodenum);
    for mm=1:nodenum
        fprintf(' %d',mm);
        [temp,tempid]=GetNodeDegree(mm,linklist);
        degreelist=[degreelist temp];
        egotemp=0;
        for kk=1:max(size(tempid))
            egotemp=egotemp+GetNodeDegree(tempid(kk),linklist);
        end
        egodegreelist=[egodegreelist egotemp/temp];
    end
    fprintf('\n');
    index=[];
    for i=1:nodenum
        if degreelist(i)>egodegreelist(i)
            index=[index i];
        end
    end           
end