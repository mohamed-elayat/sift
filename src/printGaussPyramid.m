function [] = printGaussPyramid(pyramid)

    s = size(pyramid,3) - 3; 
    k = 2^(1/s);
    
    figure;
    for i = 1:size(pyramid,3)
        subplot(2,3,i);
        imshow(pyramid(:,:,i));
%         title(strcat('octave: ', num2str(octave), ' hey ', num2str(k^(i-1) * 1.6)));
        title(strcat(num2str(k^(i-1) * 1.6)));
    end

end