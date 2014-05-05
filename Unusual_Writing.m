
function [ dataUW ] = Unusual_Writing( data, prob)
%Return column wise probability sum of each sample
%   Detailed explanation goes here
    [r0, c0] = size(data);
    dataUW = zeros(r0,1);
    for i = 1:r0
        probSum=0;
        for j = 1:c0
            probSum = probSum + prob(data(i,j)+1,j);
            %prob(data(i,j)+1,j)
        end
        dataUW(i)=probSum;
    end
end

