function [ result ] = JointProbability( data1 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [r0,c0] = size(data1);    
    for i = 1:c0
        [r1,] = size(unique(data1(:,i)));
        for j = 1:c0
            if i ~= j
                [r2,] = size(unique(data1(:,j)));
                calculate(data1,i,j,r1,r2);                
            end
        end
    end
end

