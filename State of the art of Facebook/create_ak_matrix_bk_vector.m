%% 6 Creating the Matrix with $a_{i,j,k}$ and the vector with $b_{ijk}$
% this function will collect the ak from the list and locate them in the
% correct matrix used further for the linear program
%%
function [bk_vector,ak_matrix] = create_ak_matrix_bk_vector (ab_cell)
%% Initialization of variables:
% compute list with ak and bk with o added on the remaining k
[ab_cell_new,max_k] = compute_ab_from_sorted_list_max_k(ab_cell);
[~,n] = size(ab_cell_new);
% set matrix z to identity matrix
z = eye(n * n);
% initialize ak_matrix
ak_matrix = [];
% initialize bk_vector
bk_vector = [];

%% To change the matrix code for ak:
%
% Loop to create matrix.
%
% $$ \left [ \matrix{-D_{a} & I\cr}\right] \left [ \matrix{x\cr z\cr} \right]$$
% $$=-D_{a}x+z$$ where
% $$D_{a}$$  represents a diagonal matrix with the values of $$a_{i,j,k}$$ on the diagonal, for ech fixed $$k$$
%
% Also, we first create our matrix $$A_{k}$ :
% $$A_{k} = \left|\matrix{a_{11k}&a_{12k}&\ldots&a_{1jk}\cr
% a_{21k}&a_{22k}&\ldots&a_{2jk}\cr
% \vdots&\vdots&\ddots&\vdots\cr
% a_{i1k}&a_{i2k}&\ldots&a_{ijk}\cr}\right| $$
%
% And we will reshape this matrix to create a vector and then create the
% final matrix where we put each value of $$A_{ijk}$ for fixed k into a
% diagonal matrix

for k=1:max_k
    aij_specific_k=zeros(n);
    b_ijk=zeros(n);
    for i=1:n
        for j=1:n
            if j~=i
                % only calculate if for the cases
                aij_specific_k(i,j)=-ab_cell_new{i,j}(k,1);
                % compute the vector with the bk
                b_ijk(i,j)=ab_cell_new{i,j}(k,2);
                
            end
        end
    end
    %%
    % now that we have the matrix with the ak for specific ak we
    % need to reshape into vector and create diagonal matrix
    bk_s=(reshape(b_ijk,[1,n*n]))';
    bk_vector=[bk_vector;bk_s];
    
    ak_s=reshape(aij_specific_k,[1,n*n]);
    a=diag(ak_s);
    a_mat_specific_k=horzcat(a,z);
    ak_matrix=[ak_matrix;a_mat_specific_k];
    
end
end