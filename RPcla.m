function results=RPcla(y,m,eps)
% y i sthe time series to compute the classical recurrence matrix
T=length(y);%Compute length of the sime series

ym=[];% initialize the m-history
for k=1:m
ym=[ym y(k:end-m+k)];
end;
 
Reclas=zeros(T-m+1,T-m+1);% initialize the recurrence matrix
for i=1:T-m+1
        aa=(max(abs(xm-repmat(xm(i,:),T-m+1,1)),[],2)<eps);% computes the column of the recurrence matrix
        Reclas(:,i)=aa;% fill in the columns
end;
results=Reclas-eye(T-m+1);% we do not consider the self-recurrences