function [filtered_2] = filterOutPoorEdges(DoG, filtered_1)

    hess = getHessian(DoG);
    
    [h,w,n] = size(DoG);
    
    [X,Y,Z] = meshgrid(1:w,1:h,1:n);
    
    function [out] = f(kpt,hess,x,y,z)
        
        if (kpt) 
            r = 10;
            Tr = hess(x,y,z,1) + hess(x,y,z,4);
            Det = hess(x,y,z,1)*hess(x,y,z,4) - (hess(x,y,z,3))^2;
            out = (Tr^2 / Det) < ((r+1)^2 / r);
            
        else
            out = false;
            
        end
        
    end

    filtered_2 = arrayfun( @(kpt,x,y,z) f(kpt,hess,x,y,z), filtered_1,Y,X,Z);


end