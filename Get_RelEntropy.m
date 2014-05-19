function [ REntropy ] = Get_RelEntropy(prob1, prob2)
%Calculate relative entropy between 2 data
    REntropy = zeros(1,12);
    [r0,c0] = size(prob1);
    for m = 1: c0-1
        sumV = 0;
        for i=1:r0
            if prob1(i,m) == 0
                n = 0;
            else
                n = log(prob1(i,m));
            end
            if prob2(i,m) == 0
                k = 0;
            else
                k = log(prob2(i,m));
            end
            sumV = sumV + (n*(k - n)); 
        end
        REntropy(1,m)=-sumV;
    end
end

