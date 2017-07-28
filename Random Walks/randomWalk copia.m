function [ C ] = randomWalk( A, X, diffStep )
scatter(X(:,1), X(:,2));
pause

n=size(A,1);

v = sum(A,1);
v = 1./v;
D = diag(v);
M = A * D;
P = zeros(n,3);

idx1=randi([1,100]);
idx2=randi([101,200]);
idx3=randi([201,300]);

P(idx1, 1) = 1;
P(idx2, 2) = 1;
P(idx3, 3) = 1;

C=zeros(n,1);
C(idx1)=1;
C(idx2)=1;
C(idx3)=1;
scatter(X(:,1), X(:,2), 20, C);
pause



for i=1:diffStep
    P = M*P;
end

[~,C] = max(P,[],2);

scatter(X(:,1), X(:,2), 20, C);


end

