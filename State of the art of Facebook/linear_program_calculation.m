%% 7 Create Linear Program
% This function gets all the values to produce the linear program
function [ x_allowed_to_move_from_cluster ] = linear_program_calculation( ab_cell,nc,size_per_cluster,low,up,Pij)

 % let n be the number of clusters

%% For inequality type 1

lower_bound=-(low-size_per_cluster); %calculate lower bound ASK LAURENT IF OK to use absolute, this is what makes my b be different 
upper_bound=(up-size_per_cluster);  %calculate upper bound

inequality1=matrix_inequality_xij_xji(nc);

%% For inequality type 2

% [bk_vector,ak_matrix,Pij]=create_ak_matrix_bk_vector(WF,F);
[bk_vector,ak_matrix]=create_ak_matrix_bk_vector_method2(ab_cell)
% idx=find(ak_matrix==0);
% ak_matrix=ak_matrix(idx,:)=[];
% bk_vector=bk_vector(idx,:)=[];

%% Put all together into one matrix for linear program
A=[-inequality1;inequality1;ak_matrix]; % RECALL WE CHANGED THIS FROM OR PAPER
b=[lower_bound;upper_bound;bk_vector];



 % need to find a way of eliminating the entries x11 x22 .. xnn
 A     
 A(:,nc^2*2) = []
        A(:,nc^2+1) = []
        A(:,1) = []
        if nc ~= 2
        for k=1:nc
            A(:,nc*k + 1) = [];
        end
        else
            A(:,3) = [];
        end
A


%create the equality to get xii = to 0
xij_mat=ones(nc)-eye(nc);
xij_vec=reshape(xij_mat,[1,nc*nc]);
xij_zij_vec=[xij_vec, xij_vec];
xij_eq = eye(2*nc*nc);

    % Defining f
    if nc == 2
    f_for_x=-ones(1,nc);
    f_forz=zeros(1,nc);
    f=[f_forz, f_for_x]'
    else 
    f_for_x=-ones(1,nc*2);
    f_forz=zeros(1,nc*2);
    f=[f_forz, f_for_x]'
    end
    

    % to create the inequality 0<xij<Pij. We need to put -inf +inf as the
    % bounds for zij

    Pij(nc^2)=[];
    Pij(1)=[];
    if nc > 2
        for i=1:nc-2
            Pij(nc*i + 1)=[];
        end
    end
Pij

zero_vect=zeros(1,length(Pij));

up_bound_z=inf*ones(1,length(Pij));
low_bound_z=-inf*ones(1,length(Pij));
ub=[Pij,up_bound_z];
lb=[zero_vect,low_bound_z];

 x_allowed_to_move_from_cluster=linprog(f,A,b,[],[],lb,ub)
% x_allowed_to_move_from_cluster=linprog(f,A,b,xij_eq,xij_zij_vec,lb,ub)
x_allowed_to_move_from_cluster=x_allowed_to_move_from_cluster(1:nc^2);
end
