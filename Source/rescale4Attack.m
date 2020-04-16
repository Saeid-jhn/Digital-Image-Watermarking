%% Rescaling (4) Attack
function rescaleImageAttacked = rescale4Attack(watermarked_image)
scale = 4;
rescaleImageAttacked = imresize(watermarked_image,scale);
end