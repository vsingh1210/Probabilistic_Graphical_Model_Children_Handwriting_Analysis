function [ varV ] = Get_Variance( data1 )
%Returns a mean matrix
    varV=zeros(1,12);
    [r0,c0] = size(data1);
    for m=1:c0
        varV(1,m) = var(data1(:,m));
    end   
end

