function[Nkp, reachvalue, newdis] = calNk(dis, k)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   1����ĳ���Nkֵ��ʹ��01����������������ͬʱ��λ���±꣩
%   �Ծ���48*48 �У���/�У����ϵ�Nk
%   2���ؿɴ����ֵ


len= length(dis(1,:));

Nkp= zeros(len,len);
reachvalue = zeros(len,1);
newdis = dis;

for i = 1:len
    [sA, index] = sort(dis(i, :));
    Nk = k;
    
    j = 1;
    while j + 1  <= len && dis(i, index(1+j)) == 0
        newdis(i, index(1+j)) = 1;
        j = j + 1;
    end
    while 1 + Nk + 1<= len && newdis(i, index(1+Nk)) == newdis(i, index(1+Nk+1))
        Nk = Nk + 1;
    end
    reachvalue(i) = newdis(i, index(1+Nk));
    index_real = index(2:2+Nk -1);
    for j = 1:len
            if any(index_real(:) == j)
                Nkp(i, j) = 1;
            end
    end
end
