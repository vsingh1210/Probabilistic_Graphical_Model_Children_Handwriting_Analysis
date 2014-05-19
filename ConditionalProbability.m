function [ result ] = ConditionalProbability( data1, a, b )
% Compute conditional probability p(a|b) where a and b are columns.
    max1 =  max(unique(data1(:,a)));
    max2 =  max(unique(data1(:,b)));
    [r0, c0] = size(data1);
    count = 0;
    for i = 1:max1+1
        for j = 1:max2+1
            for k = 1:r0
                if data1(k,a) == i - 1 && data1(k,b) == j - 1
                    count = count + 1;
                end
            end
            marginal_prob(i,j) = count/r0;
            count = 0;
        end
    end
    prob = Get_Probability(data1);
    [r1,c1] = size(marginal_prob);
    for i = 1:r1
        for j = 1:c1
            if prob(i,a) == 0
                result(i,j)=0;
            else
                result(i,j) = marginal_prob(i,j) / prob(i,a);
            end
        end
    end
    
end

