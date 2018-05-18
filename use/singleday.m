file_24_1=dir('L:\毕业设计\BachelorThesis\data\2017-09-11*');
file_24_2=dir('L:\毕业设计\BachelorThesis\data\2017-09-12*');
file_24_3=dir('L:\毕业设计\BachelorThesis\data\2017-09-13*');
file_24_4=dir('L:\毕业设计\BachelorThesis\data\2017-09-14*');
file_24_5=dir('L:\毕业设计\BachelorThesis\data\2017-09-15*');
file_24_6=dir('L:\毕业设计\BachelorThesis\data\2017-09-16*');
file_24_7=dir('L:\毕业设计\BachelorThesis\data\2017-09-17*');


LTdata_1 = zeros(113, 150, 24);
LTdata_2 = zeros(113, 150, 24);
LTdata_3 = zeros(113, 150, 24);
LTdata_4 = zeros(113, 150, 24);
LTdata_5 = zeros(113, 150, 24);
LTdata_6 = zeros(113, 150, 24);
LTdata_7 = zeros(113, 150, 24);

M_1 = zeros(24, 1);
M_2 = zeros(24, 1);
M_3 = zeros(24, 1);
M_4 = zeros(24, 1);
M_5 = zeros(24, 1);
M_6 = zeros(24, 1);
M_7 = zeros(24, 1);

for n=1:length(file_24_1)
    
    temp_1 = load(file_24_1(n,1).name);
    temp_2 = load(file_24_2(n,1).name);
    temp_3 = load(file_24_3(n,1).name);
    temp_4 = load(file_24_4(n,1).name);
    temp_5 = load(file_24_5(n,1).name);
    temp_6 = load(file_24_6(n,1).name);
    temp_7 = load(file_24_7(n,1).name);
    
    LTdata_1(:,:,n) = temp_1;
    LTdata_2(:,:,n) = temp_2;
    LTdata_3(:,:,n) = temp_3;
    LTdata_4(:,:,n) = temp_4;
    LTdata_5(:,:,n) = temp_5;
    LTdata_6(:,:,n) = temp_6;
    LTdata_7(:,:,n) = temp_7;
    
    M_1(n,1) = mean(mean(temp_1(50:80,80:120)));
    M_2(n,1) = mean(mean(temp_2(50:80,80:120)));
    M_3(n,1) = mean(mean(temp_3(50:80,80:120)));
    M_4(n,1) = mean(mean(temp_4(50:80,80:120)));
    M_5(n,1) = mean(mean(temp_5(50:80,80:120)));
    M_6(n,1) = mean(mean(temp_6(50:80,80:120)));
    M_7(n,1) = mean(mean(temp_7(50:80,80:120)));
    
end;

plot(M_1);
hold on 
plot(M_2);
plot(M_3);
plot(M_4);
plot(M_5);
plot(M_6);
plot(M_7);
xlabel('日期');
ylabel('可能性');