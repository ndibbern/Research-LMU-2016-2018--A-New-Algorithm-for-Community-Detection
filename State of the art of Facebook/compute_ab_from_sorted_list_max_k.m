%%%%%check with laurent:
%5
%ALL OF IT WORKS
function [ab_cell_new,max_k]= compute_ab_from_sorted_list_max_k( ab_cell)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%since all the values of k are different, we need to make all the arrays of
%ak bk for all the ij the same length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,R]=size(ab_cell);
length_ak=zeros(R,R);
ab_cell_new=cell(R);
for i=1:R
    for j=1:R
        if j~=i
            %save on array all the values of k
            length_ak(i,j)=length(ab_cell{i,j}(:,1));
            
            
        end
    end
end

%find maximum value of the k
max_k=max(max(length_ak));

for i=1:R
    for j=1:R
        if j~=i
            k_ak_ij=length(ab_cell{i,j}(:,1));
            if k_ak_ij<max_k
                %since al the k's are different, I get the larger one and I
                %add 0s to the vectors that are shorter so all are the same
                extra=zeros(max_k-k_ak_ij,1);
                ab_cell_new{i,j}(:,1)=[ab_cell{i,j}(:,1);extra];
                %do the same for the bks
                ab_cell_new{i,j}(:,2)=[ab_cell{i,j}(:,2);extra];
            else
                ab_cell_new{i,j}=ab_cell{i,j};
            end
        end
    end
end
end

% function ab_cell = compute_ab_from_sorted_list( utilities_list )
% %3
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %This function creates a list with all the a b's found in the correct
% %position
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [~,R]=size(utilities_list);
% ab_cell=cell(R);
% 
% for i=1:R
%     for j=1:R
%         if j~=i
%             u=utilities_list{i,j}(:,2);
%             ab_cell{i,j}=compute_ab_from_sorted_utilities(u);
%             
%         end
%     end
%     
% end
% end




% function ab = compute_ab_from_sorted_utilities(u)
% % describe code
% 
% % compute a
% [a,pos,~]=unique(u);  % extract unique values and sort
% a=fliplr(a);          % reverse the sort to be descending
% 
% % compute S
% pos=fliplr(pos');
% pos=[pos length(u)+1];
% pos=pos-1;
% pos(1)=[];
% S=pos;
% 
% % compute b
% b=zeros(1,length(a));
% b(1)=0;
% for k=2:length(a)
%     b(k)=b(k-1)+S(k-1)* (a(k-1)-a(k));
% end
% 
% ab=[a' b'];
% end
