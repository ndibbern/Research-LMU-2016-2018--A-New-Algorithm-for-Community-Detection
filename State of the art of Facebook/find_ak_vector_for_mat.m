function [ mat] = find_ak_vector_for_mat(ak,i,j,n )

r=length(ak);
mat=[];
for k=1:r
    M=zeros(n,n);
     N=zeros(n,n);
    M(i,j)=-ak(k);
    N(i,j)=1;
    v1=reshape(M',[1,n*n]);
    v2=reshape(N',[1,n*n]);
     v=[v1,v2];
    mat=[mat;v];
 end         

end
