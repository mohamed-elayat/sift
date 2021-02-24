function [prepared] = PrepareImg(orig)
    prepared = imresize(orig,2);
    
    temp = sqrt(1.6^2 - 1.0^2);
    mask = GaussianFilter(temp);

    prepared = conv2(prepared,mask,'same');
 
end