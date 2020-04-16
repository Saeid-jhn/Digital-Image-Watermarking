%% Normalized Correlation (NC)

function [NC] = nc(watermark_logo,extracted_watermark)

w = double(watermark_logo);
w_hat = double(extracted_watermark);
N = length(w);
A = 0; B = 0; C = 0;
for i = 1:N
    for j = 1:N
        A = A + w(i,j)*w_hat(i,j);
        B = B + w(i,j)*w(i,j);
        C = C + w_hat(i,j)*w_hat(i,j);
    end
end
B = sqrt(B); C = sqrt(C);
NC = A/(B*C);
end
