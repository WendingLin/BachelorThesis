function[lof] = callof(Nkp, dis, lrd)
%UNTITLED 此处显示有关此函数的摘要
%  计算出固定坐标点上某时空点的局部可达密度
%  Z：48

len= length(lrd);
lof = zeros(len,1);

for i = 1:len
    sum_lrd = 0;
    Nk = length(find(Nkp(i,:)==1));
    for j = 1 : len
        if Nkp(i, j) == 1
            sum_lrd = sum_lrd + lrd(j);
        end
    end
    lof(i) =sum_lrd / lrd(i)/Nk;
end
