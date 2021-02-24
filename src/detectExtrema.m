function [extrema] = detectExtrema(DoG)

    [h,w,n] = size(DoG);
    [X,Y,Z] = meshgrid(1:h, 1:w, 1:n);
    
    extrema = arrayfun( @(x,y,z) isExtremum(DoG,x,y,z), ...
                            X, ...
                            Y, ...
                            Z);
    
    extrema = permute(extrema, [2 1 3]);
end