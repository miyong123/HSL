function [a] = update_a(Lc,L,O)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% for i=1:O
%     A=Lc-L{i};
%     PYFF=norm(A,'fro')^2;
%     a(i) = 0.5/sqrt(PYFF);
% end

R = zeros(O,1);
for v = 1:O
    A{v}=Lc-L{v};
    R(v)=norm(A{v},'fro')^2;%求解f变量
end

for v = 1:O
        a(v)=R(v)/sum(R.^2);
%     a(v)=sum(R)/R(v);
end

end

