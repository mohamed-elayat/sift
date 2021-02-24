function [orientation] = getOrient(hist, b2)

    
%     x1 = max(1,x2-1);
%     x3 = min(length(hist),x2+1);
    
    b1 = max(1,b2-1);
    b3 = min(length(hist),b2+1);
    
    x1 = (b1-1)/length(hist) * 2*pi;
    x2 = (b2-1)/length(hist) * 2*pi;
    x3 = (b3-1)/length(hist) * 2*pi;
    
    one = hist(b1) - hist(b2);
    two = x3-x2;
    thr = hist(b3) - hist(b2);
    fou = x2-x1;
    
    fiv = (one*two^2 - thr*fou^2)/(one*two + thr*fou);
    
    six = x2 + 0.5*fiv;
    
    orientation = min(2*pi, max(0,six));
    
%     orientation = min(length(hist), max(1,six));
    
%     orientation = (sev/pi) * 180;


end