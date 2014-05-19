function [ result ] = ZanB( data, type )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    Z_P = [2,1,1,1,2,1,0,0,2,1,1,1]; 
    Z_C = [0,1,0,1,1,0,1,1,2,1,1,1];
    if type == 'C'
        Z=Z_C;
    else
        Z = Z_P;
    end
    
    [r0,c0] = size(data);
    result = zeros(r0,1);
    for i = 1:r0
        sumQ=0;
        for j=1:c0-1
            sumQ= sumQ + (data(i,j) - Z(1,j))*(data(i,j) - Z(1,j));
        end
        result(i,1)=sumQ^0.5;
    end
end

