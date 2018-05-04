function [ z ] = euclidean_classifier( m, X )  
%{  
    �������ܣ�  
        ����ŷʽ����Բ������ݽ��з���  
  
    ����˵����  
        m�����ݵľ�ֵ����ML��ѵ�����ݣ��������Ƶõ�  
        X��������Ҫ���Ե�����  
  
    �������أ�  
        z�����������ķ���  
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
