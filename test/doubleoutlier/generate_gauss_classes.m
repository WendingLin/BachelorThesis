function [ data, C ] = generate_gauss_classes( M, S, P, N )  
%{  
    函数功能：  
        生成样本数据，符合正态分布  
  
    参数说明：  
        M：数据的均值向量  
        S：数据的协方差矩阵  
        P：各类样本的先验概率，即类别分布  
        N：样本规模  
  
    函数返回  
        data：样本数据（2*N维矩阵）  
        C：样本数据的类别信息  
%}  
  
[~, c] = size(M);  
data = [];  
C = [];  
  
for j = 1:c  
    % z = mvnrnd(mu,sigma,n);  
    % 产生多维正态随机数，mu为期望向量，sigma为协方差矩阵，n为规模。  
    % fix 函数向零方向取整  
    t = mvnrnd(M(:,j), S(:,:,j), fix(P(j)*N))';  
      
    data = [data t];  
    C = [C ones(1, fix(P(j) * N)) * j];  
end  
  
end  