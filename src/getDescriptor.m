function [desc] = getDescriptor(kpt,mags,thts)

    i = kpt(1);
    j = kpt(2);
    k = kpt(3);
    t = kpt(4);
    
    mag = mags(:,:,k);
    tht = thts(:,:,k);
    
    p_size = 16;
    [img_h,img_w] = size(mag);
    range = (-p_size/2 + 0.5) : (p_size/2 - 0.5) ;
    
    m_rot = zeros(p_size);
    t_rot = zeros(p_size);
        
    [X,Y] =  meshgrid(range);
    
    sigma = p_size/2;
    
    mask = exp(- (X.^2 + Y.^2) / (2*sigma^2) );
    mask = mask./(2*pi*sigma^2);
    mask = mask./sum(mask(:));
    
%     x0=j;
%     y0=i;
    
    for ii = 1:p_size 
        for jj = 1:p_size
            
            i2 = i + range(ii);
            j2 = j + range(jj);
            
            i1 = i + cos(-t)*(i2-i) + (-sin(-t))*(j2-j) ;
            j1 = j + sin(-t)*(i2-i) + cos(-t)*(j2-j) ;
            
            i10 = floor(i1); i12 = ceil(i1);
            j10 = floor(j1); j12 = ceil(j1); 
            
            if (i10 < 1 || i10 > img_h || j10 < 1 || j10 > img_w)
                m11 = 0; theta11 = 0;
            else
                m11 = mag(i10,j10); theta11 = tht(i10,j10);end
                    
            if (i10 < 1 || i10 > img_h || j12 < 1 || j12 > img_w)
                m12 = 0; theta12 = 0;
            else
                m12 = mag(i10,j12); theta12 = tht(i10,j12);end
                
            if (i12 < 1 || i12 > img_h || j10 < 1 || j10 > img_w)
                m21 = 0; theta21 = 0;
            else
                m21 = mag(i12,j10); theta21 = tht(i12,j10);end
                
            if (i12 < 1 || i12 > img_h || j12 < 1 || j12 > img_w)
                m22 = 0; theta22 = 0;
            else
                m22 = mag(i12,j12); theta22 = tht(i12,j12);end
                
            
            mr1 = (i1 - i10)/(i12-i10)*m11 + (i12-i1)/(i12-i10)*m21;
            mr2 = (i1 - i10)/(i12-i10)*m12 + (i12-i1)/(i12-i10)*m22;
            
            tr1 = (i1 - i10)/(i12-i10)*theta11 + (i12-i1)/(i12-i10)*theta21;
            tr2 = (i1 - i10)/(i12-i10)*theta12 + (i12-i1)/(i12-i10)*theta22;
            
            m0 = (j1 - j10)/(j12-j10)*mr1 + (j12-j1)/(j12-j10)*mr2;
            t0 = (j1 - j10)/(j12-j10)*tr1 + (j12-j1)/(j12-j10)*tr2;
            
            
            m_rot(ii,jj) = m0;
            t_rot(ii,jj) = t0;
            
        end
    end
                              
   m_rot = m_rot .* mask;  
   
%    t_rot(t_rot<1e-3) = 2*pi;
%    t_rot(t_rot == 0) = 2*pi;

   n = p_size/4;
   r = 8;
   
   desc = zeros(1,r*n^2);
   
   split = 2*pi /r;
   
   inc = -1;
    
   for i=0:n-1
       for j = 0:n-1  
           inc = inc+1;
           
           hist = zeros(1,r);
                      
           for k = 1:n
               for m=1:n 
                   
                   bin = ceil(t_rot(i*n+k,j*n+m)/split);
                              
                   test = (t_rot(i*n+k,j*n+m)/split) - (bin-1);
                   
                   if bin == 0
                       bin = 8;
                       d = 0.5;
                   else
                   
                   
                       if (test <= 0.5)

                           if bin == 1
                               bin = 8;
                               d = abs(   t_rot(i*n+k,j*n+m) ) / (split) ;
                           else
                               bin = bin-1;
                               d = abs(  (bin*split - t_rot(i*n+k,j*n+m) )) / (split) ;
                           end
                       else
                           d = abs(  (bin*split - t_rot(i*n+k,j*n+m)) )/ (split) ;

                       end
                       
                   end

                   hist(bin) = hist(bin) + (1-d)*m_rot(i*n+k,j*n+m);

               end
           end
%            desc(  1+i*n^2+j*n :  1+i*n+j*n+r) = hist(bin);
           desc(  1+inc*r :  inc*r + r) = hist;
       end
   end          

   desc = desc / norm(desc);
   desc(desc>0.2) = 0.2;
   desc = desc / norm(desc);
   
end