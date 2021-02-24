function pyramid = GaussianPyramid(img, s, octave)

    k = 2^(1/s);
%     sigmas = zeros(1,s+3);

    if octave == 1        
        sigma = sqrt(1.6^2 - 1.0^2);
%         imgCurr = imresize(img,2);
        imgCurr = img;
        [h,w] = size(imgCurr);
        pyramid = zeros(h,w,s+3);        
    else       
        sigma = 1.6;
        lastPyr = GaussianPyramid(img,s,octave-1);
        gaussed = lastPyr(:,:,s+1);
        imgCurr = downSample(gaussed,2);       
    end

    for i = 1:s+3
        filt = GaussianFilter(k^(i-1) * sigma);
        pyramid(:,:,i) = conv2(imgCurr,filt,'same');  
%         sigmas(i) = k^(i-1)*1.6;
    end
  
end


