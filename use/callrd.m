function[lrd] = callrd(Nkp, dis, reachdis)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%  ������̶��������ĳʱ�յ�ľֲ��ɴ��ܶ�
%  Z��48

len= length(reachdis);
lrd = zeros(len, 1);

for i = 1:len
    sum_reach = 0;
    Nk = length(find(Nkp(i,:)==1));
    for j = 1 : len
        if Nkp(i, j) == 1
            sum_reach = sum_reach + reachdis(j, i);
        end
    end
    lrd(i) = Nk / sum_reach;
end
