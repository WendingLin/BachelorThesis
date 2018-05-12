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

            avg = mean(noise);
            
            for i = 1:date_size
                if(noise(i)<0.01)
                    noise(i)=0;
                end
            end
            front_per = 0;
            back_per = 0;
            Outliers = 0;
            max_val = 0;
            
            for i = 1:date_size
                
                if i == 1 
                    front_per = abs(noise(i)-avg)/noise(i);
                else
                    front_per = abs(noise(i)-noise(i-1))/noise(i);
                end
                
                if i == date_size
                    back_per = abs(noise(i)-avg)/noise(i);
                else
                    back_per = abs(noise(i)-noise(i+1))/noise(i);
                end
                
                a = front_per + back_per;
                if a>0.05 && a>max_val
                    Outliers = i;
                    max_val = a;
                end
            end
            z(r,c) = Outliers;
        end   
    end
end
