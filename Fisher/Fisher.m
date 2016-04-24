function [mean_fisher,std_fisher]= Fisher(filename,num_crossval)
num = xlsread(filename);
[row, column] = size(num)

N = num_crossval;

n_row = int64(row/10);
row_array(1:N-1) = n_row;
array_final = horzcat(row_array, row-(N-1)*n_row);

cellA = mat2cell(num,array_final,column);

error_fisher = zeros(N,1);
for i=1:N
    count =0;
    for j=1:N
        if(i~=j)
            if(count == 0)
                number = cellA{j,1};
                count = count+1;
            else
                number = vertcat(number,cellA{j,1});
            end
        end
    end
    number = vertcat(number,cellA{i,1});
    error_fisher(i,1)= Fisher_1(number);
    number = [];
end
error_fisher
mean_fisher = mean(error_fisher)
mean_fisher/n_row
std_fisher = std(error_fisher)