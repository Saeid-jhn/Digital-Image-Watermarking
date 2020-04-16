%% JPEG2000 compression Attack
function jpegImageAttacked = jp2Attack(watermarked_image,compression_ratio)
imwrite(watermarked_image,'jpeg2000ImageAttacked.j2k','jp2','CompressionRatio',compression_ratio);
jpegImageAttacked = imread('jpeg2000ImageAttacked.j2k');
end
