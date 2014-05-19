function [ entropyV ] = Get_Entropy(data1,prob)
    entropyV = zeros(1,12);
    [r0,c0] = size(data1);
    for m = 1: c0-1
        sumV = 0;
        for i=1:r0
           sumV = sumV + prob(data1(i,m)+1,m)*log(prob(data1(i,m)+1,m)); 
        end
        entropyV(1,m)=-sumV;
    end
end

