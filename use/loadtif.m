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
% im=double(im); %������ת��Ϊdouble����
% im=mat2gray(im); %��im��һ����[0 1]�����ڣ���im�е����ֵ����Сֵ��ֵΪ1��0
% im=im2uint8(im); %��im���䵽[0 255]
% figure(),imshow(im); %��ʾ����1������3��Χ�ڵ�ͼ��

[img, R] = geotiffread('2017-08-14-0000.tif');
img = double(img);
geoshow(img,R)