function [ z ] = comp_gauss_dens_val( m, s, x )  
%{  
    函数功能：  
        计算高斯分布N（m, s），在某一个特定点的值  
  
    参数说明：  
        m：数据的均值  
        s：数据的协方差  
        x：我们需要计算的数据点  
  
    函数返回：  
        z：高斯分布在x出的值  
%}  
  
z = ( 1/( (2*pi)^(1/2)*det(s)^0.5 ) ) * exp( -0.5*(x-m)'*inv(s)*(x-m) );  
  
end  
