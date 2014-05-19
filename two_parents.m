function [ result ] = two_parents(adj_list,a)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    r0 = size(adj_list,1);
    count=0;
    for i=1:r0
        if adj_list(i,a) == 1
            count=count+1;
        end
    end
    if count < 2
        result=true;
    else
        result=false;
    end    
end

