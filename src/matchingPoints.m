function [points1, points2] = matchingPoints(n,distanceM, kpts1,kpts2)

    sz = size(distanceM);

    [vals,indx] = sort(distanceM(:));
    
    [row,col] = ind2sub(sz,indx);
    
    Y1 = kpts1(row(1:n),1); X1 = kpts1(row(1:n),2);
    Y2 = kpts2(col(1:n),1); X2 = kpts2(col(1:n),2);
    
%     points1 = [X1 Y1];
%     points2 = [X2 Y2];
    
    points1 = [Y1 X1];
    points2 = [Y2 X2];

end