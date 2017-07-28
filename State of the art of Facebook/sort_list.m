%% 2 Function to Sort the utilities list (cell):
% The following Function sort the list from largest utility gain to smalles utillity gain.
% $P(i,j)$ is the number of vertex that would benefit from moving from
% group $i$ to cluster $j$
%WORKS

function [ utility_list_sorted,P ] = sort_list(utilities_list)
%% Defining the variables needed:
% $R$ represents the number of places on the cell (number of clusters
% squared)
R=size(utilities_list,1);
P=zeros(R,R);
utility_list_sorted=cell(R,R);
%% Loop to sort the list:
for i=1:R
    for j=1:R
        if j~= i
             if isempty(utilities_list{i,j}) == 0
            u=utilities_list{i,j}(:,2);
            P(i,j)=length(u);
            vert=utilities_list{i,j}(:,1);
            [usorted, idx]=sort(u,'descend');
            vertsorted=vert(idx);
            utility_list_sorted{i,j}=[vertsorted,usorted];
             end
        end
    end
end
%% Calculation of $P_{ij}$
% $P_{ij}$ is used in the inequality of the linear program because..
% EXPLAIN

P=reshape(P',[1,R*R]);

end

