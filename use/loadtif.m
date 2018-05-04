% t=Tiff('2017-08-14-0000.tif', 'r');
% 
% offsets = t.getTag('SubIFD');
% 
% t.setSubDirectory(offsets(1));

% t=imread('2017-08-14-0000.tif');
% imshow(t);

% [boston, R] = geotiffread('2017-08-14-0000.tif');
% figure
% mapshow(boston, R);
% axis image off
%info=geotiffinfo('2017-08-14-0000.tif');

% im=imread('2017-08-14-0000.tif');
% im=double(im); %将数据转换为double类型
% im=mat2gray(im); %将im归一化到[0 1]区间内，且im中的最大值和最小值赋值为1和0
% im=im2uint8(im); %将im扩充到[0 255]
% figure(),imshow(im); %显示波段1到波段3范围内的图像

[img, R] = geotiffread('2017-08-14-0000.tif');
img = double(img);
geoshow(img,R)