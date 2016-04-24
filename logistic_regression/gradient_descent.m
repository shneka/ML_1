function theta_new = gradient_descent(M_0,train_M,column_0,actual_train)
%To implement gradient desecent
alpha = 0.0001;
epsilon =1.000;
theta_new = zeros(column_0,1);
while epsilon>1e-06
    theta_old = theta_new;
    diff_value = zeros(column_0,1);
    for i=1:actual_train
        x = transpose(train_M(i,:));
        exp_value = transpose(theta_old)*x;
        h_e = exp(-exp_value);
        h = 1/(1+h_e);
        diff =(h - M_0(i,1));
        diff_value = diff_value+diff*x;
    end
    theta_new = theta_old - alpha*(diff_value/double(actual_train));
    epsilon = norm(theta_new) - norm(theta_old);
end