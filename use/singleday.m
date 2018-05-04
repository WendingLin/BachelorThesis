file_24_1=dir('2017-08-16*');
file_24_6=dir('2017-08-23*');

LTdata_1 = zeros(113, 150, 24);
LTdata_6 = zeros(113, 150, 24);

M_1 = zeros(24, 1);
M_6 = zeros(24, 1);

for n=1:length(file_24_1)
    
    temp_1 = load(file_24_1(n,1).name);
    temp_6 = load(file_24_6(n,1).name);
    
    LTdata_1(:,:,n) = temp_1;
    LTdata_6(:,:,n) = temp_6;
    
    M_1(n,1) = mean(mean(temp_1(50:80,80:120)));
    M_6(n,1) = mean(mean(temp_6(50:80,80:120)));
    
end;

plot(M_1);
hold on 
plot(M_6);