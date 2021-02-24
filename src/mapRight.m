function [out] = mapRight(img, H, x,y)

    [h,w] = size(img);

%     b = H\[x;y;1];
    
    b = H\[y;x;1];
    
%     x0 = floor(b(1)/b(3));
%     
%     y0 = floor(b(2)/b(3));
    
    y0 = floor(b(1)/b(3));
    
    x0 = floor(b(2)/b(3));
    
%     if ( x0<0 || x0>w || y0 < 0 || y0 > h)
%         out = 0;
        
%     if or(or(x0<1, x0>h), or(y0<1, y0>w))
    if or(or(y0<1, y0>h), or(x0<1, x0>w))
        out = 0;
        
    else
        out = img(y0,x0);   
%         out = img(x0,y0);  
    end
end