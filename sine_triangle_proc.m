% ID Number: 229,506
% ECE 31033 - Project #2
% sine_triangle_proc.m

%% Given values
R = 1.0; 
L = 1e-3; 
V_DC = 100; 
f_ac = 400; 
phi_v = -pi/2; 
f_sw = 7600;
T_sw = 1 / f_ac;
m = 1; 
V_DC = 100;
omega_ac = 2 * pi * f_ac;   % Angular frequency of AC voltage
omega_sw = 2 * pi * f_sw;   % Angular frequency of switching signal

%% Simulation parameters
parameter_init; 

D = [0];
SW1_4 = [0];
SW2_3 = [0];

%% Invoke the script.
disp("Sine-Triangle Forward Euler Calculations (m=1): Invoked.");
sine_triangle_FE;
disp("  Complete.");

%% Plotting
% Plotting: Transistor Voltages and Currents
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