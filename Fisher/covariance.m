function S_w = covariance(row,column,num,class)
% find the parameter Sw
S_w = zeros(column-1,column-1);
for i=1:row
    if(num(i,1)==1)
        value = (num(i,2:column)-class(1,:));
        inter = transpose(value)*value;
        S_w =S_w + inter;
    else if(num(i,1)==3)
        value = (num(i,2:column)-class(2,:));
        inter = transpose(value)* value;
        S_w = S_w + inter;
    else if(num(i,1)==7)
        value = (num(i,2:column)-class(3,:));
        inter = transpose(value)*value;
        S_w =S_w + inter;
    else
        value = (num(i,2:column)-class(4,:));
        inter = transpose(value)*value;
        S_w =S_w + inter;
        end
        end
    end
end
