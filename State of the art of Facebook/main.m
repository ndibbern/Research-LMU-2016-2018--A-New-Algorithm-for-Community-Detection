%% Example 1

 load('simple.mat')
 low=2;
  up=3;

%% Example 2

%  load('block.mat')
%  nc=2;
% low=600;
% up=2100;

%% Example3
% load('smallgraph.mat')
% nc=3;
% n=10;
% 
% low=3;
% up=5;
%% MAIN

 n=length(C);
 F=full(sparse(1:n,C,1,n,nc));
 WF=W*F;
size_per_cluster=(sum(F))'    %calculate size of clusters
%get utilities list
utilities_list=list_cell_matrix(WF,F);

% sort the list
[utility_list_sorted,P]=sort_list(utilities_list);

% compute list with ak and bk with o added on the remaining k
ab_cell=compute_ab_from_sorted_list(utility_list_sorted );

% solve linear program
[ x_allowed_to_move_from_cluster ] = linear_program_calculation( ab_cell,nc,size_per_cluster,low,up,P)

% % update partition
% C=update_partition(sorted_list,x_allowed_to_move);


