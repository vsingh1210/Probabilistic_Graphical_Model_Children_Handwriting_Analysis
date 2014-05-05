%% Load Data
load 'data/set4.mat'
data1=newdata;
%% Data Cleaning Begin
data1 = Clean_data(data1);
%% Chi-Square Test
[r0,c0] = size(data1);
result = zeros(c0*(c0-1)/2,3);
count=1;
for i = 1:c0
    for j = i+1:c0
        result(count,1) = i;
        result(count,2) = j;
        result(count,3) = ChiSq(data1,i,j);
        count=count+1;
    end
end

%% Sort the chi-square result in non-decreasing-order
result=flipdim(sortrows(result,3),1);
