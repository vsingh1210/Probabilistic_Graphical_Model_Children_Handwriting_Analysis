function [ result ] = ChiSq( data1,a,b )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    sorted1=sort(unique(data1(:,a)));
    sorted2=sort(unique(data1(:,b)));
    s1 = size(unique(data1(:,a)));
    s1 = s1(1,1);
    s2 = size(unique(data1(:,b)));
    s2 = s2(1,1);
    observed = zeros(s1,s2);
    expected = zeros(s1,s2);
    [r0,c0]=size(data1);
    [r1,c1] = size(sorted1);
    [r2,c2] = size(sorted2);
    temp = zeros(s1*s2,4);
    index=1;
    row=1;
    for i=1:r1
        col=1;
        for j=1:r2
            temp(index,1)=sorted1(i,1);
            temp(index,2)=sorted2(j,1);
            temp(index,3)=row;
            temp(index,4)=col;
            index=index+1;
            col=col+1;
        end
        row=row+1;
    end
    for i = 1:r0
        IndexPos=GetIndex(temp, data1(i,a),data1(i,b));
        observed(IndexPos(1,1),IndexPos(1,2)) = observed(IndexPos(1,1),IndexPos(1,2)) + 1;
    end
    for i=1:s1
        for j=1:s2
            expected(i,j)=sum(observed(i,:))*sum(observed(:,j))/r0;
        end
    end
    result=0;
    for i=1:s1
        for j=1:s2
            result = result + ((observed(i,j) - expected(i,j))^2)/expected(i,j);
        end
    end
end

