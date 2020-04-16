%% Histogram Equalization attack
function histImageAttacked = histAttack(watermarked_image)
histImageAttacked = histeq(watermarked_image);
end
