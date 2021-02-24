function [descs] = getDescriptors(kpts,mags,thts)

    n_kpts = size(kpts,1);
    
    r = 8;
    n = 4;
    d_size = r*n^2;

    descs = zeros(n_kpts, d_size+2);
    
    descs(:,1) = kpts(:,1);
    descs(:,2) = kpts(:,2);
    
    for i = 1:n_kpts
        descs(i,3:end) = getDescriptor(kpts(i,:),mags,thts);
    end
    
end