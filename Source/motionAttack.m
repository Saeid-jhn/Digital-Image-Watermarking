%% Motion Blur Attack theta = 4 len = 7
function motionImageAttacked = motionAttack(watermarked_image)
h = fspecial('motion',7,4);
motionImageAttacked = imfilter(watermarked_image,h,'replicate');
end
