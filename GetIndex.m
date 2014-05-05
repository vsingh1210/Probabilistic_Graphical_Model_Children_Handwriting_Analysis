function [ result ] = GetIndex( indexTable,a,b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    result = zeros(1,2);
    [r1,c1]=size(indexTable);
    for i=1:r1
        if indexTable(i,1) == a && indexTable(i,2) == b
            result(1,1) = indexTable(i,3);
            result(1,2) = indexTable(i,4);
            break;
        end
    end
end

