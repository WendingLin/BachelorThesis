file_all = dir('L:\��ҵ���\BachelorThesis\data\*.txt');

total_data = zeros(48, 24);

SIG = zeros(1152,1);
LTdata = zeros(113, 150);
count = 1;


for i = 1 : 48
    for j = 1:24
        temp = load(file_all(count, 1).name);
        total_data(i, j) = mean(mean(temp(50:80,80:120)));
        SIG((i-1)*24 + j) = mean(mean(temp(50:80,80:120)));
        count = count + 1;
    end;
end;

surf(total_data);
xlabel('Сʱ');
ylabel('����');
zlabel('��λ�ն���');
dateaxis('y',6,'08/13');