function[Nkp, reachvalue, newdis] = calNk(dis, k)
%UNTITLED 此处显示有关此函数的摘要
%   1返回某点的Nk值（使用01数组来表征，可以同时定位到下标）
%   仍旧是48*48 行：点/列：点上的Nk
%   2返回可达距离值


len= length(dis(1,:));

Nkp= zeros(len,len);
reachvalue = zeros(len,1);
newdis = dis;

for i = 1:len
    [sA, index] = sort(dis(i, :));
    Nk = k;
    
    j = 1;
    while j + 1  <= len && dis(i, index(1+j)) == 0
        newdis(i, index(1+j)) = 1;
        j = j + 1;
    end
    while 1 + Nk + 1<= len && newdis(i, index(1+Nk)) == newdis(i, index(1+Nk+1))
        Nk = Nk + 1;
    end
    reachvalue(i) = newdis(i, index(1+Nk));
    index_real = index(2:2+Nk -1);
    for j = 1:len
            if any(index_real(:) == j)
                Nkp(i, j) = 1;
            end
    end
end
