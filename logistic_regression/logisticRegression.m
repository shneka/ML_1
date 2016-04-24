% To do logistic regression
function[log_mean,log_std]= logisticRegression(filename,num_splits,train_percent)
num = xlsread(filename);
% to split 0 and 1
N=num_splits;
[row, column] = size(num);

sorted_num = sortrows(num,1);
[~,~,uniqueIndex] = unique(sorted_num(:,1));  
cellA = mat2cell(sorted_num,accumarray(uniqueIndex(:),1),column);  

% To convert cell to matrix
M_0 = cellA{1,1};
M_1 = cellA{2,1};

% To call the training set
training_set = train_percent;
len = length(training_set);
logistic_error = zeros(len,N);

% Call the random value 100 times
for i =1:N
    % To generate random values
    rand_M_0 = M_0(randperm(size(M_0,1)),:);
    rand_M_1 = M_1(randperm(size(M_1,1)),:);
    for j=1:len
        error_logistic = Logistic_Regression(rand_M_0,rand_M_1,training_set(j));
        logistic_error(j,i)=error_logistic;
     end
end
log_mean = mean(logistic_error,2)/921;
log_std = std(logistic_error,0,2)/921;
subplot(2,1,1)
plot(training_set,log_mean);ylim([0.3,0.5]);
xlabel('Percentage training'); ylabel('mean');
subplot(2,1,2)
plot(training_set,log_std);ylim([0,0.3]);
xlabel('Percentage training');ylabel('standard deviation');

