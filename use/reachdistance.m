function[reachdis] = reachdistance(Nkp, dis, reachvalue)
%UNTITLED 此处显示有关此函数的摘要
%  计算出固定坐标点上某点在时空上定位差值（可达距离
%  Z：48*48 行：点/ 列：点与点间

len= length (dis(1,:));

reachdis= dis;

for i = 1:len
    for j = 1:len
        if Nkp(i, j) == 1
            reachdis(i, j) = reachvalue(i);
        end
    end
end
