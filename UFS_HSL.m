function [Lc,idex,obj] = UFS_HSL(NorX, alpha, beta,m,O)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

%初始�?
[d,n]=size(NorX);
W=rand(d,m);

I=eye(n);
k=5;

IsConverge = 0;
max_iter   = 21;
iter       = 1;
thresh     = 1e-3;

%构�?S
for i=1:O
    if(i==1)
        S{i}= constructW_PKN(NorX,k);
    else
        S{i}=zeros(n,n);
    end
end


for i=1:O
    
    a(i)=1/O;
    if(i==1)
        D{i} = diag(1./sqrt(sum(S{i}+eps)));
        L{i}=I- D{i}*S{i}*D{i};
    end
    for j=2:i
        S{i}=S{j-1}*S{j-1};
    end
    D{i} = diag(1./sqrt(sum(S{i}+eps)));
    L{i}=I- D{i}*S{i}*D{i};
end

Lc=L{1};

while (IsConverge == 0&&iter<max_iter+1)
    
    %For W
    W = update_W(NorX,alpha,Lc,W);
    
    %For L*
    Lc = update_Lc(NorX,L,O,a,beta,W);
    
    %For a
    a = update_a(Lc,L,O);
    
    error_1=error_F(Lc,L,a,O);
    error_2=error_Tr(W,Lc,NorX);
    obj(iter)=error_2+error_1;
    
    if(iter==1)
        max_err=obj(iter);
    else
        max_err=(obj(iter)-obj(iter-1))/obj(iter-1);
    end
    
    k=abs(max_err);
    
%     if k < thresh
%         IsConverge = 1;
%     end
    iter          = iter + 1;
end

[~,idex] = sort(sum(W.*W,2),'descend');
end

