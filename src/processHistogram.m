function [newKeypoints] = processHistogram(hist,kpts,i,j,k)

    newKeypoints = kpts;
    M = max(hist(:));
    
    for bin = 1:length(hist)
        
        if( hist(bin) > 0.8*M )
            
            t = getOrient(hist,bin);
            newKeypoints = [newKeypoints; i j k t];
        end
        
        
    end

end