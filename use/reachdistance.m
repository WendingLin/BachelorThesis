function[reachdis] = reachdistance(Nkp, dis, reachvalue)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%  ������̶��������ĳ����ʱ���϶�λ��ֵ���ɴ����
%  Z��48*48 �У���/ �У�������

len= length (dis(1,:));

reachdis= dis;

for i = 1:len
    for j = 1:len
        if Nkp(i, j) == 1
            reachdis(i, j) = reachvalue(i);
        end
    end
end
