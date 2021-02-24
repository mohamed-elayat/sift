function plotKeypointsOri(img, kpts)

    figure;
    imshow(img);
    hold on;
    
    n = size(kpts,1);
    scale = kpts(:,3);
    r = scale * 3;
    
    x = kpts(:,2);
    y = kpts(:,1);
    t = kpts(:,4);
    
    new_x = x + r .* cos(t);
    new_y = y + r .* sin(t);
    
    cols = ['m' 'c' 'b' 'g' 'r'];
    
       
    for i = 1:n       
        col = cols(scale(i));
        viscircles([x(i) y(i)], r(i), 'Color', col, 'LineWidth', 0.3);
        plot([x(i), new_x(i)], [y(i), new_y(i)], 'Color', col, 'LineWidth',0.3);
    end
    
end