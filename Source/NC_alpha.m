%% This function plots normlized correlation vs alpha
function [NC] = NC_alpha(cover_image,watermark_logo,method,alpha,attacks,params)

NC = zeros(length(attacks), length(alpha));
for j=1:length(attacks)
    attack = string(attacks(j));
    param = params(j);
    for i=1:length(alpha)
        
        [watermarked_image, extracted_watermark] = watermark(cover_image,watermark_logo,method,alpha(i),attack,param);
        NC(j,i) = nc(watermark_logo,extracted_watermark);
    end
end
end