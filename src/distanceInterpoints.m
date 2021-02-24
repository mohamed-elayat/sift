function [distanceMat] = distanceInterpoints(desc1,desc2)

    n1 = size(desc1,1);
    n2 = size(desc2,1);
    
    [X,Y] = meshgrid(1:n2,1:n1);
    
    function [out] = f(x,y,desc1,desc2)
        one = desc1(y,3:128);
        two = desc2(x,3:128);
        
        out = sqrt(sum((one-two).^2));
        
    end
    
    distanceMat = arrayfun( @(x,y) f(x,y,desc1,desc2), X,Y);

end