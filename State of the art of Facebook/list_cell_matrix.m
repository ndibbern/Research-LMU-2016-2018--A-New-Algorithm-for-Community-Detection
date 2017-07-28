%% 1 Create a Cell structure that will contain the utilities list
% utilities_list is a cell containing R^{2}% lists.
% List (i,j) contain the index of the vertices that want to move from cluster
% i to cluster j (first column) and the utility gain (second column)
%WORKS
function [ utilities_list] = list_cell_matrix(WF,F)
%%
% each entry tells how  much is gained by switching vertex i to group r
[n,R]=size(F);
Ut_gain=bsxfun(@minus, WF , sum(WF.*F,2) );
utilities_list=cell(R,R);
[~,C]=max(F,[],2);

%% Loop section to fill the cell:
% $i$ is the index for the vertices
% $r$ is the index for the cluster
for i=1:n
    
    for r=1:R
        if Ut_gain(i,r)>0
            utilities_list{C(i),r}=[utilities_list{C(i),r} ; [i , Ut_gain(i,r)] ];
            
        end
    end
end
end

