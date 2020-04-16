%% Digital image watermarking
%  
%
%% Intilize
clc
clear
close all

%% Import image
cover_image=imread('lena512.bmp');
watermark_logo=imread('cameraman.tif');
%% Plot cover image and watermark image
figure
subplot(1,2,1);
imshow(cover_image);
title('Cover image: 512 x 512');
subplot(1,2,2);
imshow(watermark_logo);
title('Watermark image: 256 x 256');

%% Example: watermark embedding and exraction  alpha=0.1 Attack: Sharpening
method = 'DWT-HD-SVD';          % Apply 'DWT-HD-SVD Method
alpha = 0.1;
attack = 'Sharpening attack';   % You can choose other attacks
param = 0.8;                    % attack parameter
[watermarked_image, extracted_watermark] = watermark(cover_image,...
    watermark_logo,method,alpha,attack,param);

% Plot results
figure;
subplot(2, 2, 1);
imshow(cover_image);
xlabel('a) Cover image');
subplot(2, 2, 2);
imshow(watermarked_image);
xlabel('b) Watermarked image');
subplot(2, 2, 3);
imshow(watermark_logo);
xlabel('c) Watermark logo');
subplot(2, 2, 4);
imshow(extracted_watermark);
xlabel('d) Extracted watermark');
sgtitle(['DWT-HD-SVD method \alpha = '+string(alpha) attack]);

%% NC vs alpha DWT-HD-SVD figure 5
%  Plot normalized correlation  for different alpha
method = 'DWT-HD-SVD';
alpha =0.005:0.005:0.2;
attacks = {'No Attack'; 'Gaussian low-pass filter'; 'Median';...
    'Gaussian noise'; 'Salt and pepper noise';'Speckle noise';...
    'JPEG compression'; 'JPEG2000 compression'; 'Sharpening attack';...
    'Histogram equalization'; 'Average filter'; 'Motion blur'};

% Attack papameters
params = [0; 3; 3; 0.001; 0; 0; 50; 12; 0.8; 0; 0; 0];
NC = NC_alpha(cover_image,watermark_logo,method,alpha,attacks,params);
%%  plot NC vs alpha figure 5
NC_plot(alpha,NC,attacks);

%% PSNR vs alpha DWT-HD-SVD
method = 'DWT-HD-SVD';
alpha =0.005:0.005:0.2;
attacks = {'No Attack'; 'Gaussian low-pass filter'; 'Median'; 'Gaussian noise';...
    'Salt and pepper noise';'Speckle noise'; 'JPEG compression';...
    'JPEG2000 compression'; 'Sharpening attack'; 'Histogram equalization';...
    'Average filter'; 'Motion blur'};
params = [0; 3; 3; 0.001; 0; 0; 50; 12; 0.8; 0; 0; 0];
PSNR = PSNR_alpha(cover_image,watermark_logo,method,alpha,attacks,params);

%% plot PSNR vs alpha
PSNR_plot(alpha,PSNR,attacks);

%% SSIM vs alpha DWT-HD-SVD figure 7 paper (see README)
method = 'DWT-HD-SVD';
alpha =0.005:0.005:0.2;
attacks = {'No Attack'; 'Gaussian low-pass filter'; 'Median'; 'Gaussian noise';...
    'Salt and pepper noise';'Speckle noise'; 'JPEG compression';...
    'JPEG2000 compression'; 'Sharpening attack'; 'Histogram equalization';...
    'Average filter'; 'Motion blur'};
params = [0; 3; 3; 0.001; 0; 0; 50; 12; 0.8; 0; 0; 0];
SSIM = SSIM_alpha(cover_image,watermark_logo,method,alpha,attacks,params);

%% plot SSIM vs alpha
SSIM_plot(alpha,SSIM,attacks);

%% FIGURE 8. Invisibility performance: Watermarked images and corresponding extracted
%  watermarks with various sizes and their corresponding PSNRs, SSIMs and NCs.

method = 'DWT-HD-SVD';
alpha =0.05;
attack = 'No Attack';
param = 0;

figure
for i=1:3
    watermark_logoi = imresize(watermark_logo,2^(-i+1));
    [watermarked_image, extracted_watermark] = watermark(cover_image,watermark_logoi,method,alpha,attack,param);
    PSNR = psnr(watermarked_image, cover_image);
    SSIM = ssim(watermarked_image, cover_image);
    NC = nc(watermark_logoi,extracted_watermark);
    subplot(2,3,i);
    imshow(watermarked_image);
    title(['watermarked image';'watermark size '+string(length(watermark_logoi))+'x'+string(length(watermark_logoi))]);
    xlabel(['PSNR='+string(PSNR);'SSIM='+string(SSIM)]);
    subplot(2,3,i+3);
    imshow(extracted_watermark);
    title('extracted watermark');
    xlabel('NC='+string(NC));
end
sgtitle('DWT-HD-SVD: Invisibility performance: watermarks with various sizes; alpha='+string(alpha)+'; No Attack');

%% plot watermarked image for different attacks and watermark sizes

method = 'DWT-HD-SVD';
alpha =0.05;
attacks = {'No Attack'; 'Gaussian low-pass filter'; 'Median'; 'Gaussian noise';...
    'Salt and pepper noise';'Speckle noise'; 'JPEG compression';...
    'JPEG2000 compression'; 'Sharpening attack'; 'Histogram equalization';...
    'Average filter'; 'Motion blur'};
params = [0; 3; 3; 0.001; 0; 0; 50; 12; 0.8; 0; 0; 0];
for i=3:-1:1
watermark_logoi = imresize(watermark_logo,2^(1-i));
figure
for j=1:length(attacks)
    
    attack = string(attacks(j));
    param = params(j);
    [watermarked_image, extracted_watermark] = watermark(cover_image,watermark_logoi,method,alpha,attack,param);
    PSNR = psnr(watermarked_image, cover_image);
    SSIM = ssim(watermarked_image, cover_image);
    subplot(3,4,j);
    imshow(watermarked_image);
    xlabel(['PSNR='+string(PSNR);'SSIM='+string(SSIM)]);
    title(attack);
end
sgtitle(['DWT-HD-SVD: Attacked watermarked image; Size = '+string(length(watermark_logoi))+'x'+string(length(watermark_logoi))+'; \alpha = '+string(alpha)]);
end

%% FIGURE 10. Extracted watermarks from the attacked watermarked images
%  Evaluate robustness performance
method = 'DWT-HD-SVD';
alpha =0.05;
attacks = {'No Attack'; 'Gaussian low-pass filter'; 'Median'; 'Gaussian noise';...
    'Salt and pepper noise';'Speckle noise'; 'JPEG compression';...
    'JPEG2000 compression'; 'Sharpening attack'; 'Histogram equalization';...
    'Average filter'; 'Motion blur'};
params = [0; 3; 3; 0.001; 0; 0; 50; 12; 0.8; 0; 0; 0];
for i=3:-1:1
watermark_logoi = imresize(watermark_logo,2^(1-i));
figure

for j=1:length(attacks)
        attack = string(attacks(j));
        param = params(j);
        [watermarked_image, extracted_watermark] = watermark(cover_image,watermark_logoi,method,alpha,attack,param);
        NC = nc(watermark_logoi,extracted_watermark);
        subplot(3,4,j);
        imshow(extracted_watermark);
        xlabel([attack 'NC='+string(NC)]);
end
sgtitle(['DWT-HD-SVD: Extracted watermarks image from the attacked watermarked images; Size = '+string(length(watermark_logoi))+'x'+string(length(watermark_logoi))+'; \alpha = '+string(alpha)]);
end

%% FIGURE 11. NC values under different parameters suffering various attacks
watermark_logo1 = watermark_logo;
watermark_logo2 = imresize(watermark_logo,0.5);
watermark_logo3 = imresize(watermark_logo,0.25);
method = 'DWT-HD-SVD';
alpha =0.1;
attacks = {'JPEG compression';'JPEG2000 compression';'Gaussian low-pass filter';...
           'Median';'Gaussian noise';'Sharpening attack'};
figure
for j = 1:length(attacks)
    attack = string(attacks(j));
    params = 0;
    switch attack
        case 'JPEG compression'
            params = 10:10:90;
            y = [0.98 1];
            x = [0 100];
            ticks = string(params);
            label = 'Quality Factor (QF)';
        case 'JPEG2000 compression'
            params = 4:4:36;
            y = [0.98 1];
            ticks = string(params);
            label = 'Compression Ratio (CR)';
        case 'Gaussian low-pass filter'
            params = 0.5:0.5:4.5;
             y = [0.9 1];
             ticks = string(params);
             label = 'sigma';
        case 'Median'
            params = 3:7;
            y = [0.86 1];
            ticks = {'3x3','4x4','5x5','6x6','7x7'};
            label = 'Window size';
        case 'Gaussian noise'
            params = 0.001:0.002:0.009;
            y = [0.88 1];
            ticks = string(params);
            label = 'Variance';
        case 'Sharpening attack'
            params = 0.1:0.1:0.9;
            y = [0.96 1];
            ticks = string(params);
            label = 'Strength (1-Threshold)';
    end
    NC1 = 0;
    NC2 = 0;
    NC3 = 0;
    for i = 1:length(params)
        [watermarked_image1, extracted_watermark1] = watermark(cover_image,watermark_logo1,method,alpha,attack,params(i));
        [watermarked_image2, extracted_watermark2] = watermark(cover_image,watermark_logo2,method,alpha,attack,params(i));
        [watermarked_image3, extracted_watermark3] = watermark(cover_image,watermark_logo3,method,alpha,attack,params(i));
        NC1(i) = nc(watermark_logo1,extracted_watermark1);
        NC2(i) = nc(watermark_logo2,extracted_watermark2);
        NC3(i) = nc(watermark_logo3,extracted_watermark3);
    end
    subplot(3,2,j)
    plot(params,NC1,'k<-');
    hold on
    plot(params,NC2,'rs-');
    hold on
    plot(params,NC3,'g^-');
    hold off
    grid on
    ylim(y);
%     xlim(x);
    xticks(params);
    xticklabels(ticks);
    xlabel(label);
    ylabel('NC(W,W^*)');
    legend('256 x 256', '128 x 128', '64 x 64', 'Location', 'southwest');
    title(attacks(j));
end
sgtitle('DWT-HD-SVD: NC values under different parameters suffering various attacks.');
