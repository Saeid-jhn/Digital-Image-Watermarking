%% Rescaling (0.25) Attack
function rescaleImageAttacked = rescaleAttack(watermarked_image)
scale = 0.25;
rescaleImageAttacked = imresize(watermarked_image,scale);
end

