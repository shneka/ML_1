function error = Logistic_Regression(M_0,M_1,train_percent)
 % To get the size of the matrix
 [row_0,column_0] = size(M_0);
 [row_1,column_1] = size(M_1);
 
 %To seperate train and test data
 train_0 = int64(80*row_0)/100;
 test_0 = row_0 -train_0;

 train_1 = int64(80*row_1)/100;
 test_1 = row_1 -train_1;

test_M_0  = M_0(train_0+1:train_0+test_0,:);
test_M_1  = M_1(train_1+1:train_1+test_1,:);
actual_test = vertcat(test_M_0,test_M_1);
[rows, cols] = size(actual_test);
actual_test_new = actual_test(:,2:cols);
test_x0 = horzcat(ones(rows,1),actual_test_new);

actual_train_0 = int64(train_percent*train_0)/100;
actual_train_1 = int64(train_percent*train_1)/100;

% To seperate out the training matrix 
train_M_0 = M_0(1:actual_train_0,:);
train_M_1 = M_1(1:actual_train_1,:);
train_M = vertcat(train_M_0,train_M_1);
[row_actual, col] = size(train_M);
train_M_new = train_M(:,2:col);
train_x0 = horzcat(ones(row_actual,1),train_M_new);

% To train the data using gradient descent
theta = gradient_descent(train_M,train_x0,col,row_actual);

% To test the working
error = 0;
for i=1:rows
        x = transpose(test_x0(i,:));
        exp_value = transpose(theta)*x;
        h_e = exp(-exp_value);
        h = 1/(1+h_e);
        if(h>=0.5)
            value = 1;
        else
            value = 0;
        end
        if(value ~= actual_test(i,1))
            error = error+1;
        end
end
end
