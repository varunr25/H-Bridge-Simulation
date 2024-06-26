% ID Number: 229,506
% ECE 31033 - Project #2
% single_phase_proc.m

%% Given values
R = 0.5;                
L = 1e-3;               
V_m = 200 / pi;           % Peak voltage of V_as.
f = 60;                 % Frequency in Hz.
omega = 2 * pi * f;     % Angular frequency.
T_sw = 1 / f;              % Period of the AC voltages.

V_DC = 50; % check discord with akash for calculation

%% Simulation parameters
parameter_init;

%% Invoke the script
disp("Single Phase Forward Euler Calculations: Invoked.");
single_phase_FE; % Invoke Single Phase Euler calculations
disp("  Complete.");

%% Plotting
figure;
plot(theta_ac_deg, i_AC); 
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
N = 5000;
[avg, ak, bk, rcon, err] = fourseries(t_vec, V_AC, T_sw, N);

% Display the error
disp(['Fourier Reconstruction Error: ', num2str(err)]);
disp(['Fourier Reconstruction Error: ', (num2str(100 * err)), '%.']);

ak = ak(1:21);
bk = bk(1:21);
a1 = ak(1);
b1 = bk(1);

frequency = 0:60:1200;

figure;
sgtitle("Spectrum Analysis");
subplot(3,1,1);
stem(frequency, ak);
xlabel('Frequency (Hz)');
ylabel('A_k');
title('A_k vs Frequency');

subplot(3,1,2);
stem(frequency, bk);
xlabel('Frequency (Hz)');
ylabel('B_k');
title('B_k vs Frequency');

subplot(3,1,3);
plot(t_vec, rcon);
xlabel('Time (s)');
ylabel('Reconstructed');
title('Reconstructed vs Time');