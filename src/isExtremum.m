function [out] = isExtremum(DoG,x,y,z)

    range = -1:1;
    
    [h,w,n] = size(DoG);
    
    x_new = min(h, max(1, range+x) );
    y_new = min(w, max(1, range+y) );
    z_new = min(n, max(1, range+z) );
    
    nbrs = DoG(x_new, y_new, z_new);
    maxTest = min(nbrs(:));
    minTest = max(nbrs(:));
    
    if (DoG(x,y,z) == maxTest) || (DoG(x,y,z) == minTest)
        out = true;
        
        for i = x_new
            for j = y_new
                for k = z_new
                    if (i ~= x) && (j ~= y) && (k ~= z)
                        if (DoG(i,j,k) == DoG(x,y,z))
                            display("we got one!");
                            out = false;
                            return;
                        end
                    end
                end
            end
        end     
        
    else
        out = false;
    end
    
    

    
end

                        
%                         display("hi");
%                         display(strcat('i,j,k:', num2str(DoG(i,j,k))));
%                         display(strcat('x,y,z:', num2str(DoG(x,y,z))));
%                         display(' ');

%     
%     if (DoG(x,y,z) > maxTest) || (DoG(x,y,z) < minTest)
%         out = true;
%     else
%         out = false;
%     end