function[z] = distance(X)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%  ������̶��������ĳ����ʱ���϶�λ��ֵ
%  Z��48*48 �У���/ �У�������

len= length(X);

z= zeros(len, len);

for i = 1:len
    for  j = 1:len
        z(i,j) = abs(X(i)-X(j));
    end
end

