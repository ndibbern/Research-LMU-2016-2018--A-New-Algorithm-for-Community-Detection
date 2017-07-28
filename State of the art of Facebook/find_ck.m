function [ck] = find_ck(u)
%ck is the number . (add in appendix)
k_values=sort(unique(u),'descend');
k_max_val=length(k_values);

for n=1:k_max_val
    ck(n)=length(find(k_values(n)==u));
end
end

%create a function that calls b and a on the same function