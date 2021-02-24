function [pano] = getPano(img1,img2,H)

    [h1,w1,n1] = size(img1);
    [h2,w2,n2] = size(img2);

    img1 = double(img1) / 255;
    img2 = double(img2) / 255;
    
    b = H*[h2;w2;1];
    
    h_new = floor(b(1));
    w_new = floor(b(2));
    
%     [Y,X] = meshgrid(1:w_new, 1:h_new);
    [X,Y] = meshgrid(1:w_new, 1:h_new);
    
    I = img2(:,:,1);
    pano = arrayfun(@(x,y) mapRight(I,H,x,y), X,Y);
    
    I = img2(:,:,2);
    pano(:,:,2) = arrayfun(@(x,y) mapRight(I,H,x,y),X,Y);
    
    I = img2(:,:,3);
    pano(:,:,3) = arrayfun(@(x,y) mapRight(I,H,x,y),X,Y);
    
    
    pano(1:h1, 1:w1, :) = img1;


end