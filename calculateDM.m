function [ DM_Result ] = calculateDM(data)
    %Dissimilarity Measure
    ZB = [0,1,0,1,1,0,1,1,2,1,1,1];
    [r0,c0] = size(data);
    DM_Result = zeros(r0,1);
    for i=1:r0
        sumSQ=0;
        for j=1:c0
            sumSQ = sumSQ + (data(i,j) - ZB(1,j))^2;
        end
        DM_Result(i,1) = (sumSQ)^(1/2);
    end
end

