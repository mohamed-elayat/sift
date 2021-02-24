function [partDeriv] = partDeriv(DoG, mask1,mask2)

    [h,w,n] = size(DoG);
    partDeriv = zeros(size(DoG));
    
    for i=1:n  
%         partDeriv(:,:,i) = conv2(mask2, (conv2(mask1,DoG(:,:,i),'same')),'same');  
        
        partDeriv(:,:,i) = conv2((conv2(DoG(:,:,i),mask1,'same')),mask2,'same');  
        
    end

end