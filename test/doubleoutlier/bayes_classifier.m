function [ z ] = bayes_classifier( m, S, P, X )  
%{  
    函数功能：  
        利用基于最小错误率的贝叶斯对测试数据进行分类  
  
    参数说明：  
        m：数据的均值  
        S：数据的协方差  
        P：数据类别分布概率  
        X：我们需要测试的数据  
  
    函数返回：  
        z：数据所属的分类  
%}  
  
[~, c] = size(m);  
[~, n] = size(X);  
  
z = zeros(n, 1);  
t = zeros(c, 1);  
for i = 1:n  
    for j = 1:c  
        t(j) = P(j) * comp_gauss_dens_val( m(:,j), S(:,:,j), X(:,i) );  
    end  
    [~, z(i)] = max(t);  
end  
  
end  