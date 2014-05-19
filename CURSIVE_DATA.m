load 'data/cset1.mat';
data1=newdata;
data1=Clean_data(data1);
load 'data/cset2.mat';
data2=newdata;
data2=Clean_data(data2);
train_x=zeros(200,13);
%train_x=zeros(200,1);
train_x(1:100,1:12) = data1(1:100,:);
train_x(101:200,1:12) = data2(1:100,:);
for i=1:200
    if i < 101
        train_x(i,13) = 3;
    end
    if i > 100 && i < 201
        train_x(i,13) = 4;
    end
end