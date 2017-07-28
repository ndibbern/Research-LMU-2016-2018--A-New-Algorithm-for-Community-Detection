function ab_cell = compute_ab_from_sorted_list( utilities_list )
%4 va adentro de compute ab max k
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function creates a list with all the a b's found in the correct
%position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,R]=size(utilities_list);
ab_cell=cell(R);

for i=1:R
    for j=1:R
        if j~=i
            if isempty(utilities_list{i,j}) == 0
            u=utilities_list{i,j}(:,2);
            
            ab_cell{i,j}=compute_ab_from_sorted_utilities(u);
            end
        end
    end
    
end
end
