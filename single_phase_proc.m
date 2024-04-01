% ID Number: 229,506
% ECE 31033 - Project #2
% single_phase_proc.m

%% Given values
R = 0.5;                
L = 1e-3;               
V_m = 200 / pi;           % Peak voltage of V_as.
f = 60;                 % Frequency in Hz.
omega = 2 * pi * f;     % Angular frequency.
T = 1 / f;              % Period of the AC voltages.

%% Simulation parameters
dt = 1e-6;                  % Time step for the simulation.
k = 1;                      % Initializing counter value.

t_vec = [0];      
tend = T - dt;   % Number of elements in the time vector.

V_T1 = [0];
V_D1 = [0];

V_T2 = [0];
V_D2 = [0];

V_T3 = [0];
V_D3 = [0];

V_T4 = [0];
V_D4 = [0];

i_T1 = [0];
i_D1 = [0];

i_T2 = [0];
i_D2 = [0];

i_T3 = [0];
i_D3 = [0];

i_T4 = [0];
i_D4 = [0];

i_AC = [0];
%i_DC = [0];

V_as = [0];
V_AC = [0];

V_DC = 50; % check discord with akash for calculation

theta_ac_rad = [0];
theta_ac_deg = [0];

%%
disp("Single Phase Forward Euler Calculations: Invoked.");
single_phase_FE; % Invoke Single Phase Euler calculations
disp("  Complete.");

disp("i_DC = " + i_DC);

%% Plotting
figure; % i_AC
plot(theta_ac_deg, i_AC); % Now theta_ac_deg and i_AC are the same length
xlabel('\theta_{ac} (degrees)');
ylabel('Current (A)');
title('AC Current Waveform');
grid on;

%% Plotting: Transistor Voltages and Currents
figure;
sgtitle("Voltages and Currents for each Transistor");

% Plot voltage across T1
subplot(4, 2, 1);
plot(theta_ac_deg, V_T1);
title('Voltage across T1');
xlabel('\theta_{ac} (degrees)');
ylabel('Voltage (V)');

% Plot current through T1
subplot(4, 2, 2);
plot(theta_ac_deg, i_T1);
title('Current through T1');
xlabel('\theta_{ac} (degrees)');
ylabel('Current (A)');

% Plot voltage across T2
subplot(4, 2, 3);
plot(theta_ac_deg, V_T2);
title('Voltage across T2');
xlabel('\theta_{ac} (degrees)');
ylabel('Voltage (V)');

% Plot current through T2
subplot(4, 2, 4);
plot(theta_ac_deg, i_T2);
title('Current through T2');
xlabel('\theta_{ac} (degrees)');
ylabel('Current (A)');

% Plot voltage across T3
subplot(4, 2, 5);
plot(theta_ac_deg, V_T3);
title('Voltage across T3');
xlabel('\theta_{ac} (degrees)');
ylabel('Voltage (V)');

% Plot current through T3
subplot(4, 2, 6);
plot(theta_ac_deg, i_T3);
title('Current through T3');
xlabel('\theta_{ac} (degrees)');
ylabel('Current (A)');

% Plot voltage across T4
subplot(4, 2, 7);
plot(theta_ac_deg, V_T4);
title('Voltage across T4');
xlabel('\theta_{ac} (degrees)');
ylabel('Voltage (V)');

% Plot current through T4
subplot(4, 2, 8);
plot(theta_ac_deg, i_T4);
title('Current through T4');
xlabel('\theta_{ac} (degrees)');
ylabel('Current (A)');

%% Plotting: Diode Voltages and Currents
figure;
sgtitle("Voltages and Currents for each Diode");

% Plot voltage across D1
subplot(4, 2, 1);
plot(theta_ac_deg, V_D1);
title('Voltage across D1');
xlabel('\theta_{ac} (degrees)');
ylabel('Voltage (V)');

% Plot current through D1
subplot(4, 2, 2);
plot(theta_ac_deg, i_D1);
title('Current through D1');
xlabel('\theta_{ac} (degrees)');
ylabel('Current (A)');

% Plot voltage across D2
subplot(4, 2, 3);
plot(theta_ac_deg, V_D2);
title('Voltage across D2');
xlabel('\theta_{ac} (degrees)');
ylabel('Voltage (V)');

% Plot current through D2
subplot(4, 2, 4);
plot(theta_ac_deg, i_D2);
title('Current through D2');
xlabel('\theta_{ac} (degrees)');
ylabel('Current (A)');

% Plot voltage across D3
subplot(4, 2, 5);
plot(theta_ac_deg, V_D3);
title('Voltage across D3');
xlabel('\theta_{ac} (degrees)');
ylabel('Voltage (V)');

% Plot current through D3
subplot(4, 2, 6);
plot(theta_ac_deg, i_D3);
title('Current through D3');
xlabel('\theta_{ac} (degrees)');
ylabel('Current (A)');

% Plot voltage across D3
subplot(4, 2, 7);
plot(theta_ac_deg, V_D4);
title('Voltage across D3');
xlabel('\theta_{ac} (degrees)');
ylabel('Voltage (V)');

% Plot current through D3
subplot(4, 2, 8);
plot(theta_ac_deg, i_D4);
title('Current through D3');
xlabel('\theta_{ac} (degrees)');
ylabel('Current (A)');

%% Spectrum Analysis
% Perform Fourier series analysis
N = 100;
[avg, ak, bk, rcon, err] = fourseries(t_vec, V_as, T, N);

% Display the error
disp(['Fourier Reconstruction Error: ', num2str(err)]);

% Spectrum Analysis
% Define the frequency range for analysis
f_max = 1200; % Maximum frequency to analyze
f_s = 1/dt; % Sampling frequency
N_fft = length(V_as); % Number of points for FFT, can be set to a power of 2 for faster computation

% Calculate the frequency bins
freq_bins = f_s * (0:(N_fft/2)) / N_fft;

% Perform FFT and take the magnitude
V_as_fft = fft(V_as);
V_as_magnitude = abs(V_as_fft/N_fft);

% Plot the spectrum
figure;
plot(freq_bins, V_as_magnitude(1:N_fft/2+1)); % Plot only the positive frequencies
xlabel('Frequency (Hz)');
ylabel('|V(f)|');
title('Frequency Spectrum of the Output Voltage');
xlim([0 f_max]); % Limit x-axis to the range of interest