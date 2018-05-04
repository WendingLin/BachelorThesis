clear;

file_13 = dir('*.tif');
lat = [6734, 6846];
lon = [29228, 29377];

for n =1:length(file_13)
    file_name = file_13(n,1).name;
    [img, R] = geotiffread(file_name);
    temp = img(lat(1):lat(2), lon(1):lon(2));
    
    file_name(17:19) = 'txt';
    
    fid=fopen(['L:\毕业设计\Data\txtout2\', file_name],'wt');%写入文件路径
                      
    [row,column]=size(temp);

    for i=1:row
        for j=1:column
            if j==column
                fprintf(fid,'%u\n',temp(i,j));
            else
                fprintf(fid,'%u ',temp(i,j));
            end
        end
    end
    
    fclose(fid);
end







