function [result ] = MarkovNetwork( DAG )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [r0,c0] = size(DAG);
    count = 0;
    k=1;
    for i=1:r0
        for j = 1:c0
            if DAG(i,j) == 1
                temp(1,k)=i;
                temp(2,k)=j;
                k=k+1;
            end
        end        
    end
    temp
    [r1,c1]=size(temp);
    temp3=temp;
    d=c1;
    for i=1:c0
        temp2=zeros(2,1);
        count=0;
        for j=1:r0
            if DAG(j,i) == 1
                count = count+1;
                temp2(count,1)=j;
            end
            
        end
        if count>1
            flag=false;
            for a = 1:c1
                if (temp(1,a)==temp2(1,1) && temp(2,a) == temp2(2,1)) || (temp(1,a)==temp2(2,1) && temp(2,a) == temp2(1,1))
                    flag=true;
                end
            end
            if flag==false
                DAG(temp2(1,1),temp2(2,1))=1;                
            end
        end
    end
    result = DAG;

end

