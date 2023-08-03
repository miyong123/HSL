function X = rzwNormalizeFea(X,normData)
%dxn
%Z-score Normlize
if normData == 1
    for  j = 1:size(X,2)
        normItem = std(X(:,j));
        if (0 == normItem)
            normItem = eps;
        end;
        X(:,j) = (X(:,j)-mean(X(:,j)))/(normItem);
    end;
end;