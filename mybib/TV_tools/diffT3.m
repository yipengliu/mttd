%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  compute the inverse-diff. of one 3-order tensor (3*N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function diffT_a = diffT3(a, sizeD,w)

N    = prod(sizeD);
tenX = reshape(a(1: N), sizeD);
tenY = reshape(a(N+1: 2*N), sizeD);
tenZ = reshape(a((2*N+1):3*N), sizeD);
dfx     = diff(tenX, 1, 1);
dfy     = diff(tenY, 1, 2);
dfz     = diff(tenZ, 1, 3);

dfxT   = zeros(sizeD);
dfyT   = zeros(sizeD);
 dfzT   = zeros(sizeD);
dfxT(1,:,:) = tenX(end, :, :) - tenX(1, :, :); %
dfxT(2:end,:,:) = -dfx;
dfyT(:,1,:)     =  tenY(:,end,:) - tenY(:,1,:);
dfyT(:,2:end,:) = -dfy;
dfzT(:,:,1)     = tenZ(:,:,end) - tenZ(:,:,1);
dfzT(:,:,2:end) = -dfz;

diffT_a = w(1)*dfxT +w(2)*dfyT+w(3)*dfzT;
diffT_a = diffT_a(:);
end