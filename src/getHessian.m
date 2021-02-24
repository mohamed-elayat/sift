function [hessian] = getHessian(DoG)

%     hSize = 2;
    [h,w,n] = size(DoG);
    hessian = zeros(h,w,n,4);
    
    Gx = [-1 0 1;
          -2 0 2;
          -1 0 1];
      
    Gy = [ 1  2  1;
           0  0  0;
          -1 -2 -1];
      
    Dxx = partDeriv(DoG,Gx,Gx);
    Dxy = partDeriv(DoG,Gx,Gy);
    Dyx = partDeriv(DoG,Gy,Gx);
    Dyy = partDeriv(DoG,Gy,Gy);
    
    hessian(:,:,:,1) = Dxx;
    hessian(:,:,:,2) = Dyx;
    hessian(:,:,:,3) = Dxy;
    hessian(:,:,:,4) = Dyy;
    
end