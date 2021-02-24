function [output] = notOnEdge(listeDoG,i,j,k)
    DoG = listeDoG(:,:,k);
    DoG = padarray(DoG, [2 2], 0, 'both');
    range=0:4;
    r=10;
    window = DoG(i+range,j+range); % Fenêtre 5x5 autour du point candidat
    % Construction de la Hessienne
    H = [window(5,3)+window(1,3)-2*window(3,3), window(2,2)+window(4,4)-window(2,4)-window(4,2);
        window(2,2)+window(4,4)-window(2,4)-window(4,2), window(3,5)+window(3,1)-2*window(3,3)];
    if det(H) <= 0
        output = false;
    else
        output = trace(H)^2/det(H)<(r+1)^2/r; % Filtrage
    end
end