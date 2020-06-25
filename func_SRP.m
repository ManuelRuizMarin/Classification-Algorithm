function [SRP]=func_SRP(y,m)
% y is the time series used to compute the symbolic recurrence matrix
% m is the embedding dimension
T=length(y);% compute the length of the time series


for i=1:T-(m-1);
    [B,mh(i,:)]=sort(y(i:i+(m-1))');%compute ordinal patterns and keep it in mh
end;    

symbs=perms(1:m);% compute all possible ordinal patterns for embedding dimension m

SRP=zeros(T-m+1,T-m+1);
for i=1:factorial(m)
    loc{i}=ismember(mh,symbs(i,:),'rows');
    A{i}=kron(loc{i},loc{i}');
    SRP=SRP+A{i};
end;
