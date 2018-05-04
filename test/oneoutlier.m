 
%利用最大似然估计，检测一元离群点  
%气温测试数据，单位为摄氏度，这里假设数据服从正太分布  

% TData=[24,24.1,28.9,28.9,29.0,29.1,29.1,29.2,29.2,29.3,29.4,29,28,29.2,29.3,29,29.5,29.3,29,29,29,29,29,29.4,29.1];  
TData = M;
len=length(TData);  
%利用最大似然估计计算均值和方差  
phat=mle(TData);  
mu=phat(1);  
sigma=phat(2);  
%定义离群点集  
Outliers=[];  
%落在 mu+/-3sigma区间范围之外的数据即为离群点  
for i=1:len  
    a=abs(TData(i)-mu)/sigma;  
    if a>3  
        Outliers(length(Outliers)+1)=i;  
    end  
end  