% ID Number: 229,506
% ECE 31033 - Project #2
% sw.m

function state = sw(D, t, T_sw)    
    w = 2 * pi / T_sw;

    a_k = 0;
    triangle_wave = 0.5;

    N = 200; % Number of Fourier terms.    

    k = 1;
    while k <= N
        z = k * w * T_sw; % Temporary variable; to simplify code for the coefficient.

        a_k = (2 * (4 * cos(0.5 * z) - 2 * cos(z) - 2)) / (z^2);
        triangle_wave = triangle_wave + a_k * cos(k * w * t);
        k = k + 1;
    end

    if D >= triangle_wave 
        state = 1;
    else
        state = 0;
    end
end