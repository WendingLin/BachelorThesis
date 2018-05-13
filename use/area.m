
clear;
file_all = dir('L:\±ÏÒµÉè¼Æ\BachelorThesis\data\2017-09-30*.txt');
data1 = zeros(113, 150);
data2 = zeros(113, 150);
data1 = load(file_all(1, 1).name);
data2 = load(file_all(2, 1).name);
 
data = abs(data1-data2);
WIN_VAL = 8;
size_1 = 0;
pos_x_1 = 1;
pos_y_1 = 1;
max_val_1 = 0;

size_2 = 0;
pos_x_2 = 1;
pos_y_2 = 1;
max_val_2 = 0;

size_3 = 0;
pos_x_3 = 1;
pos_y_3 = 1;
max_val_3 = 0;
for window_size = 8 : 20
    window = zeros(window_size,window_size);
    for i = 1 : 113-window_size+1
        for j = 1 : 150-window_size+1
            window = data(i:i+window_size-1, j:j+window_size-1);
            if(mean(mean(window)) > max_val_1)
                pos_y_1 = i;
                pos_x_1 = j;
                size_1 = window_size;
                max_val_1 = mean(mean(window));
            end
        end
    end
end

for window_size = 8 : 20
    window = zeros(window_size,window_size);
    for i = 1 : 113-window_size+1
        for j = 1 : 150-window_size+1
            window = data(i:i+window_size-1, j:j+window_size-1);
            if((mean(mean(window)) < max_val_1) && (mean(mean(window)) > max_val_2) &&( abs(j-pos_x_1) >WIN_VAL) && (abs(i-pos_y_1) > WIN_VAL))
                pos_y_2 = i;
                pos_x_2 = j;
                size_2 = window_size;
                max_val_2 = mean(mean(window));
            end
        end
    end
end

for window_size = 8 : 20
    window = zeros(window_size,window_size);
    for i = 1 : 113-window_size+1
        for j = 1 : 150-window_size+1
            window = data(i:i+window_size-1, j:j+window_size-1);
            if((mean(mean(window)) < max_val_1) && (mean(mean(window)) < max_val_2) &&  (mean(mean(window)) > max_val_3)...
&&(abs(j-pos_x_1) >WIN_VAL) && (abs(i-pos_y_1) > WIN_VAL)&&(abs(j-pos_x_2) >WIN_VAL) && (abs(i-pos_y_2) > WIN_VAL))
                pos_y_3 = i;
                pos_x_3 = j;
                size_3 = window_size;
                max_val_3 = mean(mean(window));
            end
        end
    end
end


imagesc(data)
hold on;
rectangle('Position',[pos_x_1,pos_y_1,size_1-1, size_1-1],'EdgeColor','r', 'LineWidth',3)
rectangle('Position',[pos_x_2,pos_y_2,size_2-1, size_2-1],'EdgeColor','r','LineWidth',3)
rectangle('Position',[pos_x_3,pos_y_3,size_3-1, size_3-1],'EdgeColor','r','LineWidth',3)
%imagesc(data(pos_y:pos_y+19,:pos_x+19));