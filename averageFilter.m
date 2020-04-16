%% Average Filter Attack theta = 4 len = 7
function averageImageAttacked = averageFilter(watermarked_image)
h = fspecial('average',[3 3]);
averageImageAttacked = imfilter(watermarked_image,h,'replicate');
end
