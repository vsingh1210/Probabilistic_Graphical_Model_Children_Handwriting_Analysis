function [ count1, count2, count3 ] = CheckWriting( data1, data2 )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
    [r0,] = size(data1);
    count1 = 0;
    count2 = 0;
    count3 = 0;
    for i=1:r0
        if data1(i,13) < data2(i,13)
            count1 = count1 + 1;
        else if data1(i,13) > data2(i,13)
            count2 = count2 + 1;
            else
                count3 = count3 + 1;
            end
        end
    end
end

