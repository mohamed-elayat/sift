function DoG = DoG(img, s, octave)

    pyr = GaussianPyramid(img,s,octave);
    
    [h,w,n] = size(pyr);
    
    DoG = zeros(h,w,n-1);
    
    for i = 1:(s+2)
        DoG(:,:,i) = pyr(:,:,i+1) - pyr(:,:,i);
    end

end