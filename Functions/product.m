function P=product(A,block)
%function z=product(x,y)
%     sizex1=size(x,1);
%     sizex2=size(x,2);
%     sizey1=size(y,1);
%     sizey2=size(y,2);
%     if(sizex2~=sizey1)
%         disp('Î¬¶È²»Ò»ÖÂ£¬´íÎó£¡');
%     else
%         z=sparse(zeros(sizex1,sizey2));
%         for j=1:1:sizex2
%             z=z+x(:,j)*y(j,:);
%         end
%     end
    ex=0;
    total=size(A,1);
    if mod(total,block)==0
        dd=ones(total/block,1)*block;
        ex=0;
    else
        dd=[ones(floor(total/block),1)*block;mod(total,block)];
        ex=1;
    end
    B=mat2cell(A,dd,dd);
    b=size(B,1);
    p=[];
    p=sparse(p);
    P=[];
    P=sparse(P);
    ct=zeros(block);
    for ci=1:b
        for cj=1:b
            if ex==1
                if ci==b && cj==b
                    ct=zeros(mod(total,block));
                elseif ci==b
                    ct=zeros(mod(total,block),block);
                elseif cj==b
                    ct=zeros(block,mod(total,block));
                else
                    ct=zeros(block);
                end
            end
            for k=1:b
                ct=ct+B{ci,k}*B{k,cj};
            end
            p=[p ct];
        end
        ci
%         fid=fopen('result.txt','a');
%         fprintf(fid,'%f',p);
%         fprintf(fid,'\n');       
        P=[P;p];
        size(P)
        p=[];
        p=sparse(p);
    end
%    fclose(fid);
end