function[z] = wavelets(LTdata, LAdata)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

row_size = size(LTdata, 1);
column_size = size(LTdata, 2);
date_size = size(LTdata, 3);


z= zeros(row_size, column_size);


for r = 1 : row_size
    for c = 1 : column_size
        if(LAdata(r,c) == 0)
            z(r,c) = 0;
        else
            [coe,length]=wavedec(reshape(LTdata(r, c, :), 48, 1), 1, 'db1');
            coe(length(1)+1: length(1)+length(2)) = 0;
            Rebuild = waverec(coe, length, 'db1');
            noise = abs(reshape(LTdata(r, c, :), 48, 1) - Rebuild);
            [val, pos] = max(noise);
            if(val == 0)
                z(r, c) = 0;
            else
                z(r,c) = pos;
            end
        end   
    end
end
