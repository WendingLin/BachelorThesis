function [ data, C ] = generate_gauss_classes( M, S, P, N )  
%{  
    �������ܣ�  
        �����������ݣ�������̬�ֲ�  
  
    ����˵����  
        M�����ݵľ�ֵ����  
        S�����ݵ�Э�������  
        P������������������ʣ������ֲ�  
        N��������ģ  
  
    ��������  
        data���������ݣ�2*Nά����  
        C���������ݵ������Ϣ  
%}  
  
[~, c] = size(M);  
data = [];  
C = [];  
  
for j = 1:c  
    % z = mvnrnd(mu,sigma,n);  
    % ������ά��̬�������muΪ����������sigmaΪЭ�������nΪ��ģ��  
    % fix �������㷽��ȡ��  
    t = mvnrnd(M(:,j), S(:,:,j), fix(P(j)*N))';  
      
    data = [data t];  
    C = [C ones(1, fix(P(j) * N)) * j];  
end  
  
end  