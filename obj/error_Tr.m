function [error] = error_Tr(W,Lc,Norx)
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
   error =trace(W'*Norx*Lc*Norx'*W);
end

