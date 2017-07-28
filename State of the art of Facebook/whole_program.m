function  main()

load('simple.mat')

% n is number of cluster
% W is the association matrix, of weighted matrix
%R is the number of points
R=lenth(C);
F=full(sparce(1:R,C,1,R,n));
WF=W*F;

%get utilities list
utilities_list=list_cell_matrix(WF,F);
% sort the list
[utility_list_sorted,P]=sort_list(utilities_list);
% compute list with ak and bk with o added on the remaining k
ab_cell=compute_ab_from_sorted_list(utility_list_sorted );

% while %something
% x_that_move=linear_program_calculation(ab_cell);
% 
%now that I have the x how do I interpret these?
    

end

%questions:

%this will give me value for x and z, just take x, but x are repeated how
%do I do?? ask..

