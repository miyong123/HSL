function [res]= myclustering(U,Y,numclass)

stream = RandStream.getGlobalStream;
reset(stream);

%指示矩阵归一化
U_normalized = U ./ repmat(sqrt(sum(U.^2, 2)), 1,numclass);
% maxIter = 50;
maxIter = 50;

% 求每一次k-means迭代的结果
tmp1 = zeros(maxIter,1);%Accuracy
tmp2 = zeros(maxIter,1);%MutualInfo
tmp3 = zeros(maxIter,1);%Purity
tmp4 = zeros(maxIter,1);%Fscore
tmp5 = zeros(maxIter,1);%Precision
tmp6 = zeros(maxIter,1);%Recall

%K-means with NMF聚类
for iter = 1:maxIter
    indx = litekmeans(U_normalized,numclass,'MaxIter',100, 'Replicates',1);
    indx = indx(:);
    [newIndx] = bestMap(Y,indx);
    % 50次的值,参照Clustering8Measure
%     tmp1(iter) = Accuracy(newIndx,Y);
%     tmp2(iter) = MutualInfo(Y,newIndx);
%     tmp3(iter) = purFuc(Y,newIndx); 
    tmp1(iter) = mean(Y==newIndx);
%     tmp1(iter) = length(find(Y == newIndx))/length(Y);%ACC
    tmp2(iter) = MutualInfo(Y,newIndx);
    tmp3(iter) = purFuc(Y,newIndx); 
    [tmp4(iter),tmp5(iter),tmp6(iter)] = compute_f(newIndx, Y); 
end


res = [max(tmp1),max(tmp2),max(tmp3),max(tmp4),max(tmp5),max(tmp6)];
