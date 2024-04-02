% ID Number: 229,506
% ECE 31033 - Project #2
% four_series_proc.m

%% Initialization
T = 1 / 40;                   % Period of the fundamental frequency
N = 50;                     % Number of harmonics
t = linspace(0, T, 10000);   % 1000 samples over the period T

% x(t), as defined in the briefing.
x = 15 - 30 * cos(2 * pi * 40 * t) + 20 * sin(2 * pi * 40 * t) + ...
    8 * cos(2 * pi * 800 * t) + 2 * sin(2 * pi * 1600 * t) - ...
    5 * cos(2 * pi * 2000 * t);

[avg, ak, bk, rcon, err] = fourseries(t, x, T, N);  % Invoking fourseries.m

%% Plotting
disp(['Fourier Reconstruction Error: ', (num2str(100 * err)), '%.']);

% Plotting both waveforms on the same plot
figure; 
plot(t, x, 'b', t, rcon, 'r--'); % original = blue | reconstructed = red dashed 
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Waveform and Fourier Reconstruction Plotted Together');
legend('Original', 'Reconstruction');

% Plotting both waveforms on the different plots
figure;
sgtitle("Original Waveform and Fourier Reconstruction Plotted Seperately");

subplot(1, 2, 1);
plot(t, x);
title('Original Waveform');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(1, 2, 2);
plot(t, rcon);
title('Reconstructed Waveform');
xlabel('Time (s)');
ylabel('Amplitude');