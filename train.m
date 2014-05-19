%% Load Data - printed
load 'data/train_data_printed.mat'
data1=train_x;
%% Load Data - Cursive
%load 'data/train_data_cursive.mat'
%data1=train_x;
%% Data Cleaning Begin
data1 = Clean_data(data1);

%% Probability calculation begin 
prob1 = Get_Probability(data1);

%%  Mean and variance 
meanV1 = Get_Mean(data1);
varV1 = Get_Variance(data1);
%% Dissimilarity Measure
DM_Result1 = calculateDM(data1,meanV1);

data_DM1=data1;
data_DM1(:,14) = DM_Result1;
DMSorted = sortrows(data_DM1,14);
fprintf('  Handwriting-Most Similar to Mean\n');
fprintf(' -----------------------\n');
fprintf(' X1  X2  X3  X4  X5  X6  X7  X8  X9  X10 X11 X12 X13\n');
% Do not change this part - Ends
for i=1:5
    for j=1:13
        fprintf('  %d ',DMSorted(i,j));
    end    
    fprintf('\n');
end

%Computing increase in similarity if any between 2 datasets.
%checkSim = compareDM(DM_Result1, DM_Result2);
%fprintf('Improvement in handwriting from 1st to 2nd: %s \n', checkSim);
%% Entropy
entropyV1 = Get_Entropy(data1,prob1);
%entropyV2 = Get_Entropy(data2,prob2);
%% Relative-Entropy
%REntropy = Get_RelEntropy(prob1,prob2);
%%  Unusual Writing
UW = Unusual_Writing( data1, prob1);
data_UW = data1;
data_UW(:,14) = UW;
UWSorted = sortrows(data_UW,14);
% Do not change this part - Begin
fprintf('  Top 5 unusual writing\n');
fprintf(' -----------------------\n');
fprintf(' V1  V2  V3  V4  V5  V6  V7  V8  V9  V10 V11 V12 V13\n');
% Do not change this part - Ends
for i=1:5
    for j=1:13
        fprintf('  %d ',UWSorted(i,j));
    end    
    fprintf('\n');
end

%% Compare to Zaner-Blosar
% Data1
Result = ResultZB(data1);
data1ZB=data1;
data1ZB(:,14)=Result;
% Data2
%Result = ResultZB(data2);
%data2ZB=data2;
%data2ZB(:,13)=Result;
% Count number of student with improved writing
%[good, bad, same] = CheckWriting(data1ZB, data2ZB);
%fprintf('Improved Handwritings quality   : %d \n', good);
%fprintf('Decline in Handwritings quality : %d \n', bad);
%fprintf('No change in Handwriting quality: %d \n', same);
%pcntg =  (good*100)/(good+bad+same);
%fprintf('Improvement : %f \n', pcntg);

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
% Sort the chi-square result in non-decreasing-order
chiSqTable=flipdim(sortrows(result,3),1);
% Log Loss computation
[r3,c3]=size(chiSqTable);
BN_Nodes=zeros(r3,2);
for i = 1:20
    if(LogLoss(data1,chiSqTable(i,1),chiSqTable(i,2))==true)
        BN_Nodes(i,1)=chiSqTable(i,1);
        BN_Nodes(i,2)=chiSqTable(i,2);   
    else
        BN_Nodes(i,2)=chiSqTable(i,1);
        BN_Nodes(i,1)=chiSqTable(i,2);
    end
end
%% Bayesian Network Computation
% Create adjacency list
adj_list = zeros(13,13);
for i = 1:20
    if (two_parents(adj_list,BN_Nodes(i,2))) == true
        adj_list(BN_Nodes(i,1),BN_Nodes(i,2))=1;
        if DAG_1(adj_list)==true
            adj_list(BN_Nodes(i,1),BN_Nodes(i,2))=0;
        end
    end
end
ids = {'X1','X2','X3','X4','X5','X6','X7','X8','X9','X10','X11','X12','Grade'};
view(biograph(adj_list,ids));    
%% K2-Algorithm
%DAG=K2BN(data1);
%% Conditional Probability
result2 = ConditionalProbability( data1, 1, 2 );
%% Markov network from Bayesian Network
hulahula=MarkovNetwork(adj_list);
view(biograph(hulahula,ids));