function [class,n]= mean_fisher(row,column,num)
% to calculate the sum of vectors in a class
class = zeros(5,column-1);

%To calculate the number of class values
n = zeros(1,5);

% To calculate the mean vector for all classes.
for i=1:row
    if(num(i,1)==1)
        class(1,:) =class(1,:)+num(i,2:column);
        n(1,1)= n(1,1)+1;
        class(5,:) =class(5,:)+num(i,2:column);
    else if(num(i,1)==3)
        class(2,:) =class(2,:)+num(i,2:column);
        n(1,2)= n(1,2)+1;
        class(5,:) =class(5,:)+num(i,2:column);
    else if(num(i,1)==7)
        class(3,:) =class(3,:)+num(i,2:column);
        n(1,3)= n(1,3)+1;
        class(5,:) =class(5,:)+num(i,2:column);
    else
        class(4,:) =class(4,:)+num(i,2:column);
        n(1,4)= n(1,4)+1;
        class(5,:) =class(5,:)+num(i,2:column);
        end
        end
    end
end
n(1,5)= row;

for j=1:5
    class(j,:)=class(j,:)/n(1,j);
end
end 