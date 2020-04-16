%% Sharpening attack strength
function sharpenImageAttacked = sharpenAttack(watermarked_image,strength)
sharpenImageAttacked = imsharpen(watermarked_image,'Amount',strength);
end

