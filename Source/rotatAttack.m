%% Rotating Attack 2 degree
function rotatImageAttacked = rotatAttack(watermarked_image)
rotatImageAttacked = imrotate(watermarked_image, 2,'crop');
end


