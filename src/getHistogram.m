function [hist] = getHistogram(mags,thets)

    [h,w] = size(mags);
    split = 2*pi/36;
    hist = zeros(1,36);
    
    for i=1:h
        for j=1:w
            bin = ceil(thets(i,j) / split);
            hist(bin) = hist(bin) + mags(i,j);
        end
    end
end