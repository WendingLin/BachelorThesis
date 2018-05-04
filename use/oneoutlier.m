function [ z ] = oneoutlier(LTdata, LAdata )
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
            phat = mle(reshape(LTdata(r,c,:), [1,date_size]));
            mu = phat(1);
            sigma = phat(2);
            Outliers = 0;
            max_val = 0;
            for i = 1:date_size
                a = abs(LTdata(r,c,i)-mu)/sigma;
                if a>3 && a>max_val
                    Outliers = i;
                    max_val = a;
                end
            end
            z(r,c) = Outliers;
        end   
    end
end

