clear;
tic;

file_9 = dir('L:\��ҵ���\BachelorThesis\data\*1300.txt');

len = length(file_9);

M = zeros(len,1);

LTdata = zeros(113,150,len);

LAdata = zeros(113, 150);

avg_data = zeros(113, 150);

max_data = zeros(113, 150);

for n=1:len

    temp = load(file_9(n,1).name);
    
    LTdata(:,:,n) = temp;
    
%     ��ȡĳһ��Χ������
    
     M(n,1) = mean(mean(temp(40:80,50:90)));

%     �ж��ж������ݵ�ƽ��û����5�����Ա����ԣ���������Ϊ113*150=16950��
    
%     avg_data = avg_data + temp;

%     �ж��ж������ݵ����ֵû����5�����Ա����ԣ���������Ϊ113*150=16950��
    
    max_data = max(max_data, temp);
    
end

for i = 1:113
    for j = 1:150
        if max_data(i,j)>10
            LAdata(i,j) = 1;
        else
            LAdata(i,j) = 0;
        end
    end
end

% 3
% z = oneoutlier(LTdata, LAdata);
% ��ַ���
%  z = laplace(LTdata, LAdata);
% С�����
%  z =wavelets(LTdata, LAdata);
% С������
z =waveletlap(LTdata, LAdata);
% LOF����
% z = lof(LTdata, LAdata);
avg_data = avg_data / 21;
rank = tabulate(z(:));

total = rank(2:size(rank(:,1)) ,2);
bar(total)
% plot(M);
dateaxis('x',6,'08/13');
xlabel('����');
ylabel('������');
toc;