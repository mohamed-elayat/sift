function [] = printDoG(DoG)

    s = size(DoG,3) - 2; 
    k = 2^(1/s);
    
    
    figure;
    for i = 1:size(DoG,3)
        subplot(2,3,i);
        imshow(DoG(:,:,i), []);
        title(strcat(num2str(k^(i-1) * 1.6)));
    end

end