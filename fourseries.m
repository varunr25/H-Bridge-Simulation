% ID Number: 229,506
% ECE 31033 - Project #2
% fourseries.m

function [avg, ak, bk, rcon, err] = fourseries(t, x, T, N)
    ak = zeros(1, N);
    bk = zeros(1, N);
    
    avg = mean(x);     
    w0 = 2 * pi / T;
    
    dt = t(2) - t(1);
    
    for k = 1:N
        sum_ak = 0;
        sum_bk = 0;
        for j = 1:length(t)
            sum_ak = sum_ak + x(j) * cos(k * w0 * t(j)) * dt;
            sum_bk = sum_bk + x(j) * sin(k * w0 * t(j)) * dt;
        end
        ak(k) = (2/T) * sum_ak;
        bk(k) = (2/T) * sum_bk;
    end
    
    rcon = avg + zeros(size(t));
    for k = 1:N
        rcon = rcon + ak(k) * cos(k * w0 * t) + bk(k) * sin(k * w0 * t);
    end
    
    err = sqrt(mean((x - rcon).^2));
end