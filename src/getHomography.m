function [H] = getHomography(points1, points2)
    
    n = size(points1,1);
    A = [];
    
    for i = 1:n
        A = [A; points2(i,1) points2(i,2) 1 0 0 0 -points1(i,1)*points2(i,1) -points1(i,1)*points2(i,2) -points1(i,1)];
        A = [A; 0 0 0 points2(i,1) points2(i,2) 1 -points1(i,2)*points2(i,1) -points1(i,2)*points2(i,2) -points1(i,2)];
    end
    
    %method 1 w/ svd
    tic;
    Aquad = transpose(A)*A;
    
    [U,S,V] = svd(Aquad);
    hflat1 = V(:,9);
    toc;
    
    %method 2 w/ vecteurs propres
    tic;
    [eigenVectors,D] = eig(Aquad);
    eigenValues = diag(D);
    [m,ind] = min(eigenValues);
    hflat2 = eigenVectors(:,ind);
    toc;
    
    hflat2 = hflat2/hflat2(9);

%     hflat1 = hflat1/hflat1(9);

    H = transpose(reshape(hflat2,[3 3]));

%     H = transpose(reshape(hflat1,[3 3]));
    
end
    