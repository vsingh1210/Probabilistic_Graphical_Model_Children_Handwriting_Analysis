function [ result ] = LogLoss( data1,a,b )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    f1=data1(:,a);
    f2=data1(:,b);
    f1_min = min(f1);
    f1_max = max(f1);
    f2_min = min(f2);
    f2_max = max(f2);
    temp = zeros(f1_max+1,f2_max+1);
    for i=1:size(f1,1)
        temp(f1(i,1)+1,f2(i,1)+1) = temp(f1(i,1)+1,f2(i,1)+1) + 1 ;
    end
    %calculate f1 given f2
    s1 = 0;
    s2 = 0;
    for i=1:size(temp,1)
        for j =1:size(temp,2)
            if(sum(temp(:,j)) ~= 0 && temp(i,j)~= 0)
                s1 = s1+ log(temp(i,j)/sum(temp(:,j)));
            end
        end
    end
    s1 = s1 * -1;

    for i=1:size(temp,2)
        for j =1:size(temp,1)
            if(sum(temp(j,:)) ~= 0 && temp(j,i) ~= 0)
                s2 = s2+ log(temp(j,i)/sum(temp(j,:)));
            end
        end
    end
    s2 = s2 * -1;
    if s1<s2
        result = true;
     else
        result=false;
    end     
end

