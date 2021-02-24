function [newKeypoints] = assignOrientations(keypoints, pyr)

    [mags,thets] = getGradient(pyr);

    [h,w,n] = size(keypoints);
    
    s = n-2;
    oldK=2^(1/s);
    
    maskUlt = GaussianFilter(1.5* 1.6*oldK^(n-1)  );
    offsetUlt = (size(maskUlt,1) - 1) / 2; 
    
    magsPad = padarray(mags, [offsetUlt offsetUlt], 0, 'both');
    thetsPad = padarray(thets, [offsetUlt offsetUlt], 1, 'both');
    
    newKeypoints = [];
    
    for k=1:n
        
        mask = GaussianFilter(1.5* 1.6*oldK^(k-1)  );
        offset = (size(mask,1) - 1) / 2; 
        range = -offset:offset;
        
        for i=1:h
            for j=1:w 
                if keypoints(i,j,k)
                    
                    mags2 = magsPad(i+range+offsetUlt,j+range+offsetUlt);
                    mags2 = mags2*mask;
                    
                    thets2 = thetsPad(i+range+offsetUlt,j+range+offsetUlt);
                    
                    hist = getHistogram(mags2,thets2);
                    
                    newKeypoints = processHistogram(hist,newKeypoints,i,j,k);
                end
            end
        end
    end           

end