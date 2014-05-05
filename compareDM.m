function [ result ] = compareDM(DM_Result1, DM_Result2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [r0,] = size(DM_Result1);
    count1 = 0;
    count2 = 0;
    for i=1:r0
        if DM_Result1(i,1)>DM_Result2(i,1)
            count1 = count1 + 1;
        end
        if DM_Result1(i,1)<DM_Result2(i,1)
            count2 = count2 + 1;
        end
    end
    if count1 > count2
        result = 'Yes';
    else if count1 < count2
            result = 'No';
        else
            result = 'No Change';
        end
    end
end

