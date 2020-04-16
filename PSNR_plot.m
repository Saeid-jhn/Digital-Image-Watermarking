%% plot PSNR vs alpha figure 6
function [] = PSNR_plot(alpha,PSNR,attacks)

a = {'k<-'; 'rs-'; 'g^-'; 'gx-'; 'r*-';'b+-';'mv-'; 'yo-';...
    'ch-';'k.-';'k^-'; 'yp-'};
figure
for j=1:length(attacks)
    plot(alpha,PSNR(j,:),string(a(j)));
    hold on
end
hold off
xlim([0 0.2]);
ylim([0 80]);
grid on
title('DWT-HD-SVD: PSNRs under different scaling factors')
xlabel('scaling factor (\alpha)');
ylabel('PSNR (dB)');
legend(attacks);
end

