function [mask] = GaussianFilter(sigma)

    temp = floor(3*sigma);

%     temp1 = -(3*sigma):(3*sigma);
    interval = -temp:temp;

    [X,Y] = meshgrid(interval);

    mask = exp(  -(X.^2 + Y.^2) / (2*sigma^2) );
    mask = mask / (2*pi*sigma^2);
    
    mask = mask / sum(mask(:));
    

end