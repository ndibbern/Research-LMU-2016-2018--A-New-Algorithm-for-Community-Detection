function Matr = matrix_inequality_xij_xji(n)
%1 for first inequality
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this function creates the whole matrix for the first inequality of
% xij-xji<=Ti-|Vi|
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%WORKSS
%n is the number of clusters
% Matr size:(n,2*n^2);
% vect=find_up_low_bound(n);
% Need to create the function that creates the upper and lower bound
%The Ti-|Vi|
L=eye(n);
A=ones(1,n);
I=kron(A,L);
Ones_mat=kron(L,A);
Z_mat=zeros(n,n*n);
Matr=horzcat(I-Ones_mat,Z_mat);
end