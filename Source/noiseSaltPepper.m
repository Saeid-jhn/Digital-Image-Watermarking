%% Salt and Pepper Noise Attack
function SaltPepperNoiseImageAttacked = noiseSaltPepper(watermarked_image)
SaltPepperNoiseImageAttacked = imnoise(watermarked_image,'salt & pepper',0.001);
end