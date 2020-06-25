function covariates=features_extraction(y,w,m,eps)
% y One chanel LEM recording
% w is window' size
% m embedding dimension
% eps proximity parameter

Td=length(y);%length of the LEM recording
lis_ns_af=zeros(ceil(Td/w)-1,5+3);
parfor k=1:ceil(Td/w)-1;
    
x=y(1+w*(k-1):w*k);% select a window of length w
KFD = Katz_FD(x);%compute the Katz fractal dimension for the selected window
SRP=func_SRP(x,m);% compute symbolic recurrence matrix
AC=RPcla(x,m,eps);%compute the classical recurrence plot 
G=graph(AC.*SRP);%Graph of the eps-symbolic recurrence network
deg=mean(centrality(G,'degree'));%compute the degree
betw= mean(centrality(G,'betweenness'));%compute the betweenness
clos=mean(centrality(G,'closeness'));% compute the closeness
skn=skewness(x);% compute skewness
DMe=mean(abs(x-median(x)));%%compute absolute mean deviation from the median
sd=std(x)%%compute standard deviation
nn=[x(2:end-1)-x(1:end-2) x(3:end)-x(2:end-1)];
SX=mean(nn(:,1).^2);
SY=mean(nn(:,2).^2);
SXY=mean(nn(:,1).*nn(:,2));
D=sqrt(abs(SX+SY-4*(SX*SY-SXY^2)));
a=1.7321*sqrt(SX+SY+D);
b=1.7321*sqrt(SX+SY-D);
Ar=pi*a*b; %estimated area of the ellipse of the second order difference plot
lis_ns_af(k,:)=[sd,DMe,skn,Ar,KFD,deg,betw,clos];%keep all covariates,
end;

covariates=lis_ns_af;

end;