% ID Number: 229,506
% ECE 31033 - Project #2
% sw.m

function state = sw(D, t, T)
    %create the fourier series all positive triangle wave array with period T
    triangle = 0;
    for n = 1:2:100
        triangle = triangle + (8/(pi^2))*(1/n^2)*((-1)^((n-1)/2))*sin(n*2*pi*t/T);
    end

    %compare the triangle wave with the duty cycle
    if D >= triangle
        state = 1;
    else
        state = 0;
    end
end