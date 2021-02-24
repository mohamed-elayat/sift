% extras

% new = PrepareImg(imgLeftG);
% new = uint8(new);

% figure;
% imshow(new);



% 
% filt = GaussianFilter(2);
% hi1 = conv2(imgLeftG,filt,'same');
% figure;
% imshow(uint8(hi1));
% 
% filt = GaussianFilter(4);
% hi2 = conv2(imgLeftG,filt,'same');
% figure;
% imshow(uint8(hi2));

% new = PrepareImg(img1);
    
% sigma = 1.6;
%     
% prepared = imresize(orig,2);
%     
% temp = sqrt(1.6^2 - 1.0^2);
% mask = GaussianFilter(temp);
% 
% prepared = conv2(prepared,mask,'same');
    
% for i = 1:6
% 
%     k = 2^(1/s);
%     filt = GaussianFilter(1.6 + (i-1)*k;
% 
% 
% end



% sigma = 1.6;
% 
% temp = floor(3*sigma);
% 
% interval = -temp:temp;
% 
% [X,Y] = meshgrid(interval);
% 
% mask = exp(  -(X.^2 + Y.^2) / 2*sigma^2 );
% mask = mask / (2*pi*sigma^2);
% 
% mask = mask / sum(mask(:));