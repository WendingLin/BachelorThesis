function[z] = lof(LTdata, LAdata)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

row_size = size(LTdata, 1);
column_size = size(LTdata, 2);
date_size = size(LTdata, 3);


z= zeros(row_size, column_size);
k = 2;

for r = 1 : row_size
    for c = 1 : column_size
        if(LAdata(r,c) == 0)
            z(r,c) = 0;
        else
            X =reshape(LTdata(r,c,:), [date_size, 1]);
            dis = distance(X);
            [Nkp, reachvalue, newdis] = calNk(dis, k);
            reachdis = reachdistance(Nkp, newdis, reachvalue);
            lrd =callrd(Nkp, newdis, reachdis);
            lof = callof(Nkp, newdis, lrd);
            [val, pos] = max(lof);
            if(val < 1)
                z(r, c) = 0;
            else
                z(r,c) = pos;
            end
        end   
    end
end
