function [magnitudes, thetas] = getGradient(pyr)
    
    [h,w,n] = size(pyr);
    
    magnitudes = zeros(h,w,n-1);
    thetas = zeros(h,w,n-1);
    
    new_pyr = padarray(pyr, [1 1], 0, 'both');
    
    for k = 1:n-1
        for i = 2:h+1
            for j = 2:w+1
                
                dy = new_pyr(i+1,j,k) - new_pyr(i-1,j,k);
                dx = new_pyr(i,j+1,k) - new_pyr(i,j-1,k);
                
%                 if (dx == 0 && dy ==0)
%                     dx = 1e-6;
%                 end
                
                if dx ==0
                    dx = 1e-6;
                end
                
                magnitudes(i-1,j-1,k) = sqrt(dx^2+dy^2);
                thetas(i-1,j-1,k) = atan(dy/dx);
                
                if( (dx < 0) &&(dy <= 0) )
                    thetas(i-1,j-1,k) = thetas(i-1,j-1,k) + pi;
                elseif ( (dx < 0) && (dy > 0) ) 
                    thetas(i-1,j-1,k) = thetas(i-1,j-1,k) + pi;
                elseif (  (dx > 0) && (dy < 0) )
                    thetas(i-1,j-1,k) = thetas(i-1,j-1,k) + 2*pi;
                elseif atan(dy/dx)==0
                    thetas(i-1,j-1,k) = 2*pi;
                    
                end
                
            end
            
        end
    end
                
                
                
                
                
                
    
    


    




end