function [X,tnn,trank] = prox_utnn(UU, Y,rho)

% The proximal operator of the tensor nuclear norm of a 3 way tensor
%
% min_X rho*||X||_*+0.5*||X-Y||_F^2
%
% Y     -    n1*n2*n3 tensor
%
% X     -    n1*n2*n3 tensor
% tnn   -    tensor nuclear norm of X
% trank -    tensor tubal rank of X
%

% 

[n1,n2,n3] = size(Y);
X = zeros(n1,n2,n3);
% Y = fft(Y,[],3);
O = tenmat(Y,[3]); %square norm
SS = O.data;
Y1 = UU'*SS;
if size(UU,1)>size(UU,2)
 Y = zeros(n1,n2,size(UU,2));  
 O= tenmat(Y,[3]);
end
Y1 = tensor(tenmat(Y1, O.rdims, O.cdims, O.tsize));
Y = Y1.data;
tnn = 0;
trank = 0;
if size(UU,1)>size(UU,2)
   Y(:,:,size(UU,2)+1:n3)=0;
end
% % first frontal slice
% [U,S,V] = svd(Y(:,:,1),'econ');
% S = diag(S);
% S = max(S-rho,0);
% r = length(find(S~=0));
% S = S(1:r);
% X(:,:,1) = U(:,1:r)*diag(S)*V(:,1:r)';
% tnn = tnn+sum(S);
% trank = max(trank,r);

% i=2,...,halfn3
% halfn3 = round(n3/2);
for i = 1 : n3
    [U,S,V] = svd(Y(:,:,i),'econ');
    S = diag(S);
    S = max(S-rho,0);
    r = length(find(S~=0));
    S = S(1:r);
    X(:,:,i) = U(:,1:r)*diag(S)*V(:,1:r)';    
%     X(:,:,n3+2-i) = conj(X(:,:,i));
    tnn = tnn+sum(S)*2;
    trank = max(trank,r);
end

% % if n3 is even
% if mod(n3,2) == 0
%     i = halfn3+1;
%     [U,S,V] = svd(Y(:,:,i),'econ');
%     S = diag(S);
%     S = max(S-rho,0);
%     r = length(find(S~=0));
%     S = S(1:r);
%     X(:,:,i) = U(:,1:r)*diag(S)*V(:,1:r)';
%     tnn = tnn+sum(S);
%     trank = max(trank,r);
% end
O = tenmat(X,[3]); %square norm
SS = O.data;
if size(UU,1)>size(UU,2)
   SS = SS(1:size(UU,2),:);
end 
Y = UU*SS;
Y = tensor(tenmat(Y, O.rdims, O.cdims, O.tsize));
X = Y.data;

tnn = tnn/n3;
% X = ifft(X,[],3);
