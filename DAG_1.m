function [ result ] = DAG_1(adj_list)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [r0,c0] = size(adj_list);
    count = 0;
    for i = 1:r0
        for j = 1:c0
            if adj_list(i,j)==1
                count = count+1;
            end
        end
    end
    temp1=zeros(1,count);
    temp2=zeros(1,count);
    k=0;
    for i = 1:r0
        for j = 1:c0
            if adj_list(i,j)==1
                k=k+1;
                temp1(1,k)=i;
                temp2(1,k)=j;
            end
        end
    end
    m = max(max(temp1),max(temp2));
    DG=sparse(temp1,temp2,true,m,m);
    if(graphisdag(DG)==0)
        result=true;
    else
        result=false;
    end
end

