function [ data ] = Clean_data( data1 )
% Clean_data function excepts a matrix as argument and returns a matrix
    [r0,c0] = size(data1);
    for m=1:c0
        values=unique(data1(:,m));
        [r1,] = size(values);
        max = 0;
        for i=1:r1
           if max < values(i) && values(i) ~= -1 && values(i) ~= 99
              max = values(i);
           end
        end
        temp = zeros(max+1,1);
        [r1,] = size(data1);
        for i = 1:r1
            if data1(i,m) ~= -1 && data1(i,m) ~= 99
                temp(data1(i,m)+1) = temp(data1(i,m)+1) + 1;
            end
        end
        [r1,] = size(temp);
        max=0;
        index = 0;
        for i=1:r1
            if max < temp(i)
                max = temp(i);
                index = i;
            end
        end
        [r1,] = size(data1);
        for i=1:r1
            if data1(i,m) == -1 || data1(i,m) == 99
                data1(i,m) = index - 1;
            end
        end
    end
    data = data1;
end

