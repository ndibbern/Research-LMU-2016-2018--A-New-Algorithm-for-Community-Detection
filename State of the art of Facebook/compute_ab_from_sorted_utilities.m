%3 adentro de compute ab_sorted list max k
function ab = compute_ab_from_sorted_utilities(u)
% describe code

% compute a
[a,pos,~]=unique(u);  % extract unique values and sort
a=flipud(a);          % reverse the sort to be descending

% compute S
pos=flipud(pos);
pos=[pos ; length(u)+1];
pos=pos-1;
pos(1)=[];
S=pos;


% compute b
b=zeros(1,length(a));
b(1)=0;
for k=2:length(a)
    display('bvalue')
    b(k)=b(k-1)+S(k-1)* (a(k-1)-a(k))   
end
b=b';
ab=horzcat(a,b);
end

% ck= find_ck(u);
% Sk=cumsum(ck);
% % ak=find_ak(u);
% b=zeros(length(a),1);
% b(1)=0;
% if length(a)>=2
% b(2)=ck(1)*a(1)-Sk(1)*a(2);
% for k=3:length(a)
%     b(k)=b(k-1)+ck(k-1)*a(k-1)+Sk(k-2)*a(k-1)-Sk(k-1)*a(k);
% end
% end
% ab=horzcat(a,b);