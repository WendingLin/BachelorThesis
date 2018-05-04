function [ m_hat, s_hat ] = gaussian_ML_estimate( X )  
%{  
    函数功能：  
        样本正态分布的最大似然估计  
  
    参数说明：  
        X：训练样本  
  
    函数返回：  
        m_hat：样本由极大似然估计得出的正态分布参数，均值  
        s_hat：样本由极大似然估计得出的正态分布参数，方差  
%}  
  
% 样本规模  
[~, N] = size(X);  
% 正态分布样本总体的未知均值μ的极大似然估计就是训练样本的算术平均  
m_hat = (1/N) * sum(transpose(X))';  
  
% 正态分布中的协方差阵Σ的最大似然估计量等于N个矩阵的算术平均值  
s_hat = zeros(1);  
for k = 1:N  
    s_hat = s_hat + (X(:, k)-m_hat) * (X(:, k)-m_hat)';  
end  
s_hat = (1/N)*s_hat;  
end  
  
% 详细的计算过程推导可以参考前一篇博客：极大似然估计详解。  