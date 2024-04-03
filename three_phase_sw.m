% ID Number: 229,506
% ECE 31033 - Project #2
% sw.m

function [T1, T2, T3, T4, T5, T6] = three_phase_sw(D_a, D_b, D_c, t, T)
    triangle = 0;
    w = 2 * pi / T;

    for k=1:100
        ak = (1 / (2 * (k ^ 2) * (pi ^ 2))) * (8 * cos(T * k * w / 2) - 4 * cos(T * k * w) - T * k * w * sin(T * k * w) - 4);
        triangle = triangle + ak * cos(k * w * t);
    end

    if D_a >= triangle
        T1 = 1;
        T4 = 0;
    else
        T1 = 0;
        T4 = 1;
    end

    if D_b >= triangle
        T2 = 1;
        T5 = 0;
    else
        T2 = 0;
        T5 = 1;
    end

    if D_c >= triangle
        T3 = 1;
        T6 = 0;
    else
        T3 = 0;
        T6 = 1;
    end
end