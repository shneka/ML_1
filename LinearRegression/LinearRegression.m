function error = LinearRegression(number)
num = number;
[row, column]= size(num)

x_0 = ones(row,1);
I = eye(column);

row_val = row - row/10;
X_actual = num(1:row,2:column);
X_inter = horzcat(x_0, X_actual);

X = X_inter(1:row_val,1:column);
Y = transpose(X);
% To remove the close to singularity condition
W_ini = Y*X;
W_inter = pinv(W_ini);

% To get the target value y
t = zeros(row-row_val,4);
for i=1:row_val
    if (num(i,1)== 1)
       t(i,1)= 1;
    else if(num(i,1)==3)
       t(i,2)= 1;
    else if(num(i,1)==7)
       t(i,3)= 1;
    else if(num(i,1)==8)
       t(i,4)= 1;
        end
        end
        end
    end
end

W = W_inter * Y;
W_final = W*t;

% To perform testing
X_test = X_inter(row_val:row,1:column);
y = zeros(row-row_val,1);
error = 0;
for i=1:row-row_val
    [Max,Index] = max(transpose(W_final)*transpose(X_test(i,1:column)));
    if (Index == 1)
        y(i,1) = 1;
    else if(Index == 2)
        y(i,1) = 3;
    else if(Index == 3)
         y(i,1) = 7;
    else
        y(i,1) = 8;
        end
        end
    end
    if(y(i,1)~= num(row_val+(i-1),1))
        error = error+1;
    end
end
error


