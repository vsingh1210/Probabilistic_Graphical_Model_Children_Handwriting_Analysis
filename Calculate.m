function [ result ] = Calculate( data1, i , j, r1, r2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [r0,] = size(data1);
    result = ones(r1,r2);
    for a = 1:r0
        result(data1(a,i),data1(a,j)) = result(data1(a,i),data1(a,j)) + 1;
    end
end

