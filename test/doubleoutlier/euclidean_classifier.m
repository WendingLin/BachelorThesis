function [ z ] = euclidean_classifier( m, X )  
%{  
    函数功能：  
        利用欧式距离对测试数据进行分类  
  
    参数说明：  
        m：数据的均值，由ML对训练数据，参数估计得到  
        X：我们需要测试的数据  
  
    函数返回：  
        z：数据所属的分类  
%}  
  
[~, c] = size(m);  
[~, n] = size(X);  
  
z = zeros(n, 1);  
de = zeros(c, 1);  
for i = 1:n  
    for j = 1:c  
        de(j) = sqrt( (X(:,i)-m(:,j))' * (X(:,i)-m(:,j)) );  
    end  
    [~, z(i)] = min(de);  
end  
  
end  
