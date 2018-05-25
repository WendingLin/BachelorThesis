function[z] = distance(X)
%UNTITLED 此处显示有关此函数的摘要
%  计算出固定坐标点上某点在时空上定位差值
%  Z：48*48 行：点/ 列：点与点见

len= length(X);

z= zeros(len, len);

for i = 1:len
    for  j = 1:len
        z(i,j) = abs(X(i)-X(j));
    end
end

