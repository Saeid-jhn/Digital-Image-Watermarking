%% This function apply watermarking based on different methods
%  inputs: orginal image, watermark image, watermarking method, applied 
%  attack
%  Output: watermarked image, extracted watermark image considering attacks

function [watermarked_image, extracted_watermark] = watermark(cover_image,watermark_logo,method,alpha,attack,param)
switch method
    case 'DWT-SVD'
        [watermarked_image, extracted_watermark] = ddwt_svd(cover_image,watermark_logo,alpha,attack,param);
    case 'DWT-HD-SVD'
        [watermarked_image, extracted_watermark] = dwt_hd_svd(cover_image,watermark_logo,alpha,attack,param);
    case 'DWT-DCT-SVD'
        [watermarked_image, extracted_watermark] = dwt_dct_svd(cover_image,watermark_logo,alpha,attack,param);
    case 'LWT-SVD'
        [watermarked_image, extracted_watermark] = lwt_svd(cover_image,watermark_logo,alpha,attack,param);
    otherwise
        errordlg('Please specify a method!');
end
end
