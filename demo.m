%清屏
clear all;
close all; clc;
warning off;


% addpath('F:\Code\Datasets\Paper feature selection');
addpath(genpath('.'));
% ds = {'COIL20','IMM40','cacmcisi','colon','Yale_32x32', 'ORL','warpPIE10P','lymphoma','jaffe', 'TOX_171','PIE'};
ds = {'Yale_32x32', 'ORL','warpPIE10P','lymphoma','jaffe', 'TOX-171','PIE'};
di = 6;
data_file = fullfile([ds{di}, '.mat']);
load(data_file);
% 
% X=fea;
% Y=gnd;

X=X';

X = double(full(X));
NorX = NormalizeFea(X, 1);


[nSmp,nFea] = size(NorX');
num_Clusters = length(unique(Y));
gt=Y;

alpha=0.001;
beta=0.01;
m=20;
O=6;



fprintf('------------Test Code-----------\n');

for retry = 1:5
    
    tic
    [Lc,idx,obj]=UFS_HSL(NorX, alpha, beta,num_Clusters,O);
    toc
    tt(retry)=toc;
    
    idx = idx';
    K=NorX';
    Xsub = K(:, idx(:,1:m));
    
    res=compute_Clustering(Xsub,gt);
    
end

a(retry)=res(1);
b(retry)=res(2);
c(retry)=res(3);

a_std=std(a);
b_std=std(b);
c_std=std(c);

t_std=std(tt);

a_mea=mean(a);
b_mea=mean(b);
c_mea=mean(c);

t_mea=mean(tt);

fs = [ds{di},'_HLS_time'];
fileID = fopen([fs,'.txt'],'a+');
%     fileID = fopen('Yale_32x32.txt','a+');
fprintf(fileID,'\n%1.5f %1.5f %1.5f %1.5f %1.5f %1.5f %1.5f  %1.5f %1.5f %1.5f %1.5f %1.5f',O,m,alpha, beta,a_mea, b_mea, c_mea,a_std,b_std,c_std,t_mea,t_std);
fclose(fileID);


% ma=mean(a);
% mb=mean(b);
% mc=mean(c);
% sa=std(a);
% sb=std(b);
% sc=std(c);
% fs = [ds{di},'_HLS'];
% fileID = fopen([fs,'.txt'],'a+');
% fprintf(fileID,'\n%1.5f %1.5f %1.5f %1.5f %1.5f %1.5f',ma, mb, mc, sa, sb, sc);
% fclose(fileID);
