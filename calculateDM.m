function [ DM_Result ] = calculateDM(data,meanV)
    %Dissimilarity Measure
    ZB = [0,1,0,1,1,0,1,1,2,1,1,1];
    [r0,c0] = size(data);
    DM_Result = zeros(r0,1);
    for i=1:r0
        sumSQ=0;
        for j=1:c0-1
            if max(data(i,j),meanV(1,j)) == 0
                sumSQ=sumSQ + 0;
            else
                sumSQ = sumSQ + (abs(data(i,j) - meanV(1,j)))/max(data(i,j),meanV(1,j));
            end
        end
        DM_Result(i,1) = sumSQ/12;
    end
end

