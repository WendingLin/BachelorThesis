clear;
tic;
file_9 = dir('*1300.txt');

len = length(file_9);

M = zeros(len,1);

LTdata = zeros(113,150,len);

LAdata = zeros(113, 150);

avg_data = zeros(113, 150);

max_data = zeros(113, 150);

for n=1:len

    temp = load(file_9(n,1).name);
    
    LTdata(:,:,n) = temp;
    
%     读取某一范围内数据
    
    M(n,1) = mean(mean(temp(40:80,50:90)));

%     判断有多少数据的平均没大于5（可以被忽略，数据总量为113*150=16950）
    
%     avg_data = avg_data + temp;

%     判断有多少数据的最大值没大于5（可以被忽略，数据总量为113*150=16950）
    
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
%z = oneoutlier(LTdata, LAdata);
% 差分方法
% z = laplace(LTdata, LAdata);
% 小波方法
z =wavelets(LTdata, LAdata);
% avg_data = avg_data / 21;
rank = tabulate(z(:));

total = rank(2:size(rank(:,1)) ,2);
bar(total)
%plot(M);
dateaxis('x',6,'08/13');
toc;