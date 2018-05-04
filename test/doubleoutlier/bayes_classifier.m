function [ z ] = bayes_classifier( m, S, P, X )  
%{  
    �������ܣ�  
        ���û�����С�����ʵı�Ҷ˹�Բ������ݽ��з���  
  
    ����˵����  
        m�����ݵľ�ֵ  
        S�����ݵ�Э����  
        P���������ֲ�����  
        X��������Ҫ���Ե�����  
  
    �������أ�  
        z�����������ķ���  
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