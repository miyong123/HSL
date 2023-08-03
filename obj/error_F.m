function [error] = error_F(Lc,L,a,O)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
    error=0;
    for i=1:O
        error=error+ a(i)*norm((Lc-L{i}),'fro')^2;
    end
end

