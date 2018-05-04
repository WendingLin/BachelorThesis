function[z] = laplace(LTdata, LAdata)
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
            avg = mean(LTdata(r, c, :));
            front_per = 0;
            back_per = 0;
            Outliers = 0;
            max_val = 0;
            
            for i = 1:date_size
                if i == 1 
                    front_per = abs(LTdata(r, c, i)-avg)/LTdata(r, c, i);
                else
                    front_per = abs(LTdata(r, c, i)-LTdata(r, c, i-1))/LTdata(r, c, i);
                end
                
                if i == date_size
                    back_per = abs(LTdata(r, c, i)-avg)/LTdata(r, c, i);
                else
                    back_per = abs(LTdata(r, c, i)-LTdata(r, c, i+1))/LTdata(r, c, i);
                end
                
                a = front_per + back_per;
                if a>0.2 && a>max_val
                    Outliers = i;
                    max_val = a;
                end
            end
            z(r,c) = Outliers;
        end   
    end
end
