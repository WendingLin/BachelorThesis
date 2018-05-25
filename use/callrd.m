function[lrd] = callrd(Nkp, dis, reachdis)
%UNTITLED 此处显示有关此函数的摘要
%  计算出固定坐标点上某时空点的局部可达密度
%  Z：48

len= length(reachdis);
lrd = zeros(len, 1);

for i = 1:len
    sum_reach = 0;
    Nk = length(find(Nkp(i,:)==1));
    for j = 1 : len
        if Nkp(i, j) == 1
            sum_reach = sum_reach + reachdis(j, i);
        end
    end
    lrd(i) = Nk / sum_reach;
end
