%% This function calculates the Structural Similarity Index (SSIM) for different alphas
%  SSIM compares the similarity of watermarked image and orginal image

function [SSIM] = SSIM_alpha(cover_image,watermark_logo,method,alpha,attacks,params)

SSIM = zeros(length(attacks), length(alpha));
for j=1:length(attacks)
    attack = string(attacks(j));
    param = params(j);
    for i=1:length(alpha)
        [watermarked_image, extracted_watermark] = watermark(cover_image,watermark_logo,method,alpha(i),attack,param);
        SSIM(j,i) = ssim(watermarked_image, cover_image);
    end
end
end