function [filtered_3] = filterBorders(filtered_2)

    [h,w,n] = size(filtered_2);
    
    thr = 5;
    
    
    for k = 1:n
        for i = 1:h
            for j=1:w
                
                if filtered_2(i,j,k)
                    
                    if (i-thr < 1 || i+thr > h || j-thr<1 || j+thr>w)
                        filtered_2(i,j,k) = false;
                    end
                end
            end
        end
    end
    filtered_3 = filtered_2;

end