function W = block_matrix(n1,n2 )


W=zeros(n1+n2,n1+n2);

A1=ones(n1,n1);
A2=ones(n2,n2);

W(1:n1,1:n1)=A1;
W(n1+1:n1+n2, n1+1:n1+n2)=A2;




end

