%% plot NC vs alpha figure 7
function [] = NC_plot(alpha,NC,attacks)

% a = {'k<-'; 'rs-'; 'g^-'; 'bd-'; 'c>-'; 'gx-'; 'r*-';'b+-';'mv-'; 'yo-';...
%     'ch-';'k.-';'k^-'; 'yp-'};
a = {'k<-'; 'rs-'; 'g^-'; 'gx-'; 'r*-';'b+-';'mv-'; 'yo-';...
    'ch-';'k.-';'k^-'; 'yp-'};
figure
for j=1:length(attacks)
    plot(alpha,NC(j,:),string(a(j)));
    hold on
end
hold off
xlim([0 0.2]);
ylim([0 1]);
grid on
title('DWT-HD-SVD: NCs under different scaling factors')
xlabel('scaling factor (\alpha)');
ylabel('NC(W,W^*)');
legend(attacks);

end



