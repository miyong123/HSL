function [Lc] = update_Lc(NorX,L,O,a,beta,W)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
[~,n]=size(NorX);
M=zeros(n);

for i=1:O
    M=M+(1/O)*a(i)*L{i};
end
Lc=M-(1/(2*beta*O))*NorX'*W*W'*NorX;

b=1/O;

end

