function err = naive(M_0,M_1,train_percent)
 % To get the size of the matrix
 [row_0,column_0] = size(M_0);
 [row_1,column_1] = size(M_1);
 
 %To seperate train and test data
 train_0 = int64(80*row_0)/100;
 test_0 = row_0 -train_0;

 train_1 = int64(80*row_1)/100;
 test_1 = row_1 -train_1;

test_M_0  = M_0(train_0+1:train_0+test_0,2:column_0);
[r1 c1] = size(test_M_0);
test_M_1  = M_1(train_1+1:train_1+test_1,2:column_1);
[r2 c2] = size(test_M_1);

actual_train_0 = (train_percent*train_0)/100;
actual_train_1 = (train_percent*train_1)/100;

% To find out prior probabilities
g_0 = row_0 /(row_0+row_1);
g_1 = row_1 /(row_0+row_1);
% To seperate out the training matrix to calculate mean and covariance
train_M_0 = M_0(1:actual_train_0,2:column_0);
train_M_1 = M_1(1:actual_train_1,2:column_1);

mu_0 = mean(train_M_0);
mu_1 = mean(train_M_1);

var_0 = var(train_M_0);
var_1 = var(train_M_1);

err =0;
for j =1:test_0
    p_0 = unigauss(test_M_0(j,:),mu_0,var_0);
    p_1 = unigauss(test_M_0(j,:),mu_1,var_1);
    if(p_0*g_0 <p_1*g_1)
        err = err+1;
    end
end
for k =1:test_1
    p_0 = unigauss(test_M_1(k,:),mu_0,var_0);
    p_1 = unigauss(test_M_1(k,:),mu_1,var_1);
    if(p_0*g_0 >p_1*g_1)
        err = err+1;
    end
end






