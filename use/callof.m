function[lof] = callof(Nkp, dis, lrd)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%  ������̶��������ĳʱ�յ�ľֲ��ɴ��ܶ�
%  Z��48

len= length(lrd);
lof = zeros(len,1);

for i = 1:len
    sum_lrd = 0;
    Nk = length(find(Nkp(i,:)==1));
    for j = 1 : len
        if Nkp(i, j) == 1
            sum_lrd = sum_lrd + lrd(j);
        end
    end
    lof(i) =sum_lrd / lrd(i)/Nk;
end
