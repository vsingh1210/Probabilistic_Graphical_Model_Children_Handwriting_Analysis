function [ ZB_Result ] = ResultZB(data1)
    ZB = [0,1,0,1,1,0,1,1,2,1,1,1];
    [r0,c0] = size(data1);
    ZB_Result=zeros(r0,1);
    for i=1:r0
        count = 0;
        for j = 1:c0-1
            if data1(i,j)==ZB(1,j)
                count = count+1;
            end
            ZB_Result(i) = count;
        end
    end
end

