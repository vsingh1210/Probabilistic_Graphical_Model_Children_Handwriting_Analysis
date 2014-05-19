%ControlCentor
% when you test the code,please correct the directory in next command
%%load('Sample.mat');

% Sample is a variable that saves our training database.
LGObj = ConstructLGObj( data1 ); % construct an object

Order = [1 2 6 11 12 3 4 5 7 8 9 10]; % Order is the ordering of the input in K2 algorithm

u = 2; % u is the maximum edges of node in output graph.

[ DAG,K2Score ] = k2( LGObj,Order,u )
h = view(biograph( DAG ))