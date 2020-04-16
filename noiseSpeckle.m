%% Speckle Noise Attack
function SpeckleNoiseImageAttacked = noiseSpeckle(watermarked_image)
SpeckleNoiseImageAttacked = imnoise(watermarked_image, 'speckle', 0.001);
end