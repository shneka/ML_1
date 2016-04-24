function error = Fisher_1(Number)
num = Number;
[row, column] = size(num);

num_val = (10*row)/100;
num_consider = row-num_val;
X = num(1:row,2:column);

[class,n] = mean_fisher(row,column,num);
S_w = covariance(row,column,num,class);

%To find the parameter SB
S_B = zeros(column-1,column-1);
for i=1:4
    value = class(i,:)-class(5,:);
    inter = transpose(value) * value;
    S_B = S_B + n(1,i)*inter;
end

Scatter_Matrix = pinv(S_w)*(S_B);
[V,D] = eigs(Scatter_Matrix,3);
Y = X * V;
M = num(1:row,1);
new_number = horzcat(M,Y);
new_num = new_number(1:num_consider,:);

% To do multivariate gaussian distribution
% to split array based on the index value 
sorted_num = sortrows(new_num,1);
[~,~,uniqueIndex] = unique(sorted_num(:,1));  
cellA = mat2cell(sorted_num,accumarray(uniqueIndex(:),1),4);  
% shifting cell to matrix
M_1 = cellA{1,1};
M_2 = cellA{2,1};
M_3 = cellA{3,1};
M_4 = cellA{4,1};
% removing the label
mat_1 = M_1(:,2:4);
[n_1,c_1] = size(mat_1);
mat_2 = M_2(:,2:4);
[n_2,c_2] = size(mat_2);
mat_3 = M_3(:,2:4);
[n_3,c_3] = size(mat_3);
mat_4 = M_4(:,2:4);
[n_4,c_4] = size(mat_4);
tot = n_1+n_2+n_3+n_4;

% To calculate the prior probabilities
p_1 = n_1/tot;
p_2 = n_2/tot;
p_3 = n_3/tot;
p_4 = n_4/tot;
% To find the mean value of array
mu_1 = mean(mat_1);
mu_2 = mean(mat_2);
mu_3 = mean(mat_3);
mu_4 = mean(mat_4);

% To find the covariance matrix

C_1 = cov(mat_1);
C_2 = cov(mat_2);
C_3 = cov(mat_3);
C_4 = cov(mat_4);

% to evaluate using gaussian distribution.
value = zeros(4,1);
y = zeros(row-num_consider,1);
error = 0;
for j= num_consider:row
    g_1 = gauss(new_number(j,2:4),mu_1,C_1);
    g_2 = gauss(new_number(j,2:4),mu_2,C_2);
    g_3 = gauss(new_number(j,2:4),mu_3,C_3);
    g_4 = gauss(new_number(j,2:4),mu_4,C_4);
    value(1,1) = p_1*g_1;
    value(2,1) = p_2*g_2;
    value(3,1) = p_3*g_3;
    value(4,1) = p_4*g_4;
    [Max ,Index] = max(value);
    if (Index == 1)
        y(j-num_consider+1,1) = 1;
    else if(Index == 2)
        y(j-num_consider+1,1) = 3;
    else if(Index == 3)
         y(j-num_consider+1,1) = 7;
    else
        y(j-num_consider+1,1) = 8;
        end
        end
    end
    if(y(j-num_consider+1,1)~= num(j,1))
        error = error+1;
    end
end
