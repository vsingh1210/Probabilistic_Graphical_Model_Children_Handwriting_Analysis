%% Load Data
load 'data/set4.mat'
data1=newdata;
data2=newdata2; 
%% Data Cleaning Begin
data1 = Clean_data(data1);
data2 = Clean_data(data2);
%% Probability calculation begin 
prob1 = Get_Probability(data1);
prob2 = Get_Probability(data2);
%%  Mean and variance 
meanV1 = Get_Mean(data1);
varV1 = Get_Variance(data1);
meanV2 = Get_Mean(data2);
varV2 = Get_Variance(data2);
%% Dissimilarity Measure
DM_Result1 = calculateDM(data1);
DM_Result2 = calculateDM(data2);
%Computing increase in similarity if any between 2 datasets.
checkSim = compareDM(DM_Result1, DM_Result2);
fprintf('Improvement in handwriting from 1st to 2nd: %s \n', checkSim);
%% Entropy
entropyV1 = Get_Entropy(data1,prob1);
entropyV2 = Get_Entropy(data2,prob2);
%% Relative-Entropy
REntropy = Get_RelEntropy(prob1,prob2);
%%  Unusual Writing
UW = Unusual_Writing( data1, prob1);
data_UW = data1;
data_UW(:,13) = UW;
UWSorted = sortrows(data_UW,13);
% Do not change this part - Begin
fprintf('  Top 5 unusual writing\n');
fprintf(' -----------------------\n');
fprintf(' V1  V2  V3  V4  V5  V6  V7  V8  V9  V10 V11 V12\n');
% Do not change this part - Ends
for i=1:5
    for j=1:12
        fprintf('  %d ',UWSorted(i,j));
    end    
    fprintf('\n');
end

%% Compare to Zaner-Blosar
% Data1
Result = ResultZB(data1);
data1ZB=data1;
data1ZB(:,13)=Result;
% Data2
Result = ResultZB(data2);
data2ZB=data2;
data2ZB(:,13)=Result;
% Count number of student with improved writing
[good, bad, same] = CheckWriting(data1ZB, data2ZB);
fprintf('Improved Handwritings quality   : %d \n', good);
fprintf('Decline in Handwritings quality : %d \n', bad);
fprintf('No change in Handwriting quality: %d \n', same);
pcntg =  (good*100)/(good+bad+same);
fprintf('Improvement : %f \n', pcntg);
%% Chi-Square Test - Not clear Yet *****
% chiSqResult1 = ChiSquaredTest(data1);

%% K2-Algorithm

