load 'data/set1.mat';
data1=newdata;
data1=Clean_data(data1);
load 'data/set2.mat';
data2=newdata;
data2=Clean_data(data2);
load 'data/set3.mat';
data3=newdata;
data3=Clean_data(data3);
load 'data/set4.mat';
data4=newdata;
data4=Clean_data(data4);
train_x=zeros(400,13);
train_x=zeros(400,1);
train_x(1:100,1:12) = data1(1:100,:);
train_x(101:200,1:12) = data2(1:100,:);
train_x(201:300,1:12) = data3(1:100,:);
train_x(301:400,1:12) = data4(1:100,:);
for i=1:400
    if i < 101
        train_x(i,13) = 1;
    end
    if i > 100 && i < 201
        train_x(i,13) = 2;
    end
    if i > 200 && i < 301
        train_x(i,13) = 3;
    end
    if i > 300
        train_x(i,13) = 4;
    end
end
%% Test data
test_x=zeros(40,12);
test_x(1:10,:) = data1(101:110,:);
test_x(11:20,:) = data2(101:110,:);
test_x(21:30,:) = data3(101:110,:);
test_x(31:40,:) = data4(101:110,:);
test_y=zeros(40,1);
for i=1:40
    if i < 11
        test_y(i) = 1;
    end
    if i > 10 && i < 21
        test_y(i) = 2;
    end
    if i > 20 && i < 31
        test_y(i) = 3;
    end
    if i > 30
        test_y(i) = 4;
    end
end