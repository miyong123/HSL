function [W] = update_W(NorX,alpha,Lc,W)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
[~,m]=size(W);
Wi=2*sqrt(sum(W.*W,2)+eps);
d=1./Wi;
D = diag(d);
A=NorX*Lc*NorX'+alpha*D;
[W, ~, ~]=eig1(A, m, 0);
end

