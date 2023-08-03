function M = corelation(H,numOfView,numOfLayer)
%CORELATION �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
for p=1:numOfView
    for q=1:numOfView
        M(p,q) = trace((H{p,numOfLayer}'*H{p,numOfLayer})*(H{q,numOfLayer}'*H{q,numOfLayer}));
    end
end
M = (M+M')/2+1e-6*eye(numOfView);  % ???
end

