function [extrema,filtered_1,filtered_2,filtered_3] = detectKeypoints(DoG)

    extrema = detectExtrema(DoG);
    
    filtered_1 = filterOutLowContrast(DoG, extrema); 
    
    filtered_2 = filterOutPoorEdges(DoG, filtered_1);
    
    filtered_3 = filterBorders(filtered_2);

end