%% This function calculates PSNR of orginal image and watermarked image
%  PSNR is used to evaluated robustness of methods
function [PSNR] = PSNR_alpha(cover_image,watermark_logo,method,alpha,attacks,params)

PSNR = zeros(length(attacks), length(alpha));
for j=1:length(attacks)
    attack = string(attacks(j));
    param = params(j);
    for i=1:length(alpha)
        [watermarked_image, extracted_watermark] = watermark(cover_image,watermark_logo,method,alpha(i),attack,param);
        PSNR(j,i) = psnr(watermarked_image, cover_image);
    end
end
end