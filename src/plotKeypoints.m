function plotKeypoints(img,kpts)
    [h,w,n] = size(kpts);
    
    figure;
    imshow(img);
    
    cols = ['r' 'b' 'g' 'c' 'm'];
    
    for k = 1:n
        centers = zeros(1,2);
        
        for i = 1:h
            for j = 1:w
                
                if kpts(i,j,k)
                    centers = [centers; [j,i]];
                end
            end
        end
        
        radii = zeros(size(centers,1), 1);
        
        radii = radii+2;
        
        viscircles(centers, radii, 'Color', cols(k));
        
    end

end