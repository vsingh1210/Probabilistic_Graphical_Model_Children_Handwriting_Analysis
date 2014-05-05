function [ meanV ] = Get_Mean( data1 )
%Returns a mean matrix
    meanV=zeros(1,12);
    [r0,c0] = size(data1);
    for m=1:c0
        meanV(1,m) = mean(data1(:,m));
    end   
end

