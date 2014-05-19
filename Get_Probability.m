function [ prob ] = Get_Probability( data1 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    prob = zeros(6,13);
    [r0,c0] = size(data1);
    for m=1:c0
        values=unique(data1(:,m));
        [r1,] = size(values);
        max = 0;
        for i=1:r1
           if max < values(i)
              max = values(i);
           end
        end
        temp = zeros(max+1,1);
        [r1,] = size(data1);
        for i = 1:r1
            temp(data1(i,m)+1) = temp(data1(i,m)+1) + 1;
        end
        [r1,] = size(temp);
        for i=1:r1
            prob(i,m) = temp(i)/r0;
        end       
    end
end

