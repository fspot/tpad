function [ F ] = Calc_f1( M, V, PM)
%CALC_F Summary of this function goes here
%   Detailed explanation goes here
cte = [2 2 1 1 2 3 1];
F = zeros(1,6);
for j=1:7
    for i=1:6
        F(i)= F(i) +M(j,i)*cte(j)/60;
    end
end
for i=1:6
    PM(1)*M(8,i) + PM(2)*M(9,i) + PM(3)*M(10,i)
    F(i)=F(i) + PM(1)*M(8,i) + PM(2)*M(9,i) + PM(3)*M(10,i);
end
for i= 1:6
    F(i) = F(i)-V(i);
end
end

