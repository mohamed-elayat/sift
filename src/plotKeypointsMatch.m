function plotKeypointsMatch (img1,img2,points1,points2)

    n = size(points1,1);
    radii = zeros(n,1);
    radii = radii+5;

    figure;
    imshow(img1);
    
    cols = ['r' 'g' 'b' 'c' 'm' 'y' 'k' 'w'];
    
    for i = 1:n  
        viscircles([points1(i,2) points1(i,1)],radii(i),'Color', cols(mod(i,length(cols)) + 1));
    end
             
    figure;
    imshow(img2);
    
    for i = 1:n
        viscircles([points2(i,2), points2(i,1)],radii(i),'Color', cols(mod(i,length(cols))+ 1));
    end
    
    

end