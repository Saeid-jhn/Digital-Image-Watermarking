%% plot SSIM vs alpha figure 7
function [] = SSIM_plot(alpha,SSIM,attacks)

a = {'k<-'; 'rs-'; 'g^-'; 'gx-'; 'r*-';'b+-';'mv-'; 'yo-';...
    'ch-';'k.-';'k^-'; 'yp-'};
figure
for j=1:length(attacks)
    plot(alpha,SSIM(j,:),string(a(j)));
    hold on
end
hold off
xlim([0 0.2]);
ylim([0 1]);
grid on
title('DWT-HD-SVD: SSIMs under different scaling factors')
xlabel('scaling factor (\alpha)');
ylabel('SSIM');
legend(attacks);

end

