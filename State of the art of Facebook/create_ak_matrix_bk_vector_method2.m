function [bk_vector,ak_matrix] = create_ak_matrix_bk_vector_method2(ab_cell)

% %get utilities list
% utilities_list=list_cell_matrix(WF,F);
% % sort the list
% [utility_list_sorted,P]=sort_list(utilities_list);
% % compute list with ak and bk with o added on the remaining k
% ab_cell=compute_ab_from_sorted_list(utility_list_sorted );

[~,n]=size(ab_cell);
ak_matrix=[];
bk_vector=[];
for i=1:n
    for j=1:n
        if j~=i
        if isempty(ab_cell{i,j}) == 0
            ak=ab_cell{i,j}(:,1);
            mat_spec_k=find_ak_vector_for_mat(ak,i,j,n);
            ak_matrix=[ak_matrix;mat_spec_k];
            bk=ab_cell{i,j}(:,2);
            bk_vector=[bk_vector;bk];
        end
        end
    end
end

end




