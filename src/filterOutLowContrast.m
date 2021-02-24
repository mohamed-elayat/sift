function [filtered_1] = filterOutLowContrast(DoG, extrema)

    thresh = 0.03;
    
%     temp = DoG + abs(min(DoG(:)));
%     DoG_norm = temp / max(temp(:));
    
    DoG_norm = DoG;
    
    filtered_1 = arrayfun(  @(val, kpt) abs(val)*kpt > thresh, ...
                        DoG_norm, ...
                        extrema  );
    
end