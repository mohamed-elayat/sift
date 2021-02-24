function sampled = downSample(img, factor)
    sampled = img(1:factor:end, 1:factor:end);
end