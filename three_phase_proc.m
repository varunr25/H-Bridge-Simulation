% ID Number: 229,506
% ECE 31033 - Project #2
% three_phase_proc.m

%% Given Values
R = 1; 
L = 1e-3; 
f_ac = 50; 
f_sw = 3100; 
I_dsr = 20;
V_DC = 40;

%% Simulation parameters
T_sw = 1 / f_sw;
omega_ac = 2 * pi * f_ac;
parameter_init;
tend = 1 / f_ac;

i_T4 = [0];
i_D4 = [0];

i_T5 = [0];
i_D5 = [0];

i_T6 = [0];
i_D6 = [0];

V_as = [0];
V_bs = [0];
V_cs = [0];

i_as = [0];
i_bs = [0];
i_cs = [0];

V_ag = [0];
V_bg = [0];
V_cg = [0];

T1 = [0];
T2 = [0];
T3 = [0];
T4 = [0];
T5 = [0];
T6 = [0];

D_a = [0];
D_b = [0];
D_c = [0];

%% Invoke the Forward Euler
disp("Three Phase Forward Euler Calculations: Invoked.");
three_phase_FE; % Invoke Single Phase Euler calculations
disp("  Complete.");

%% Plotting
theta_ac_deg_rad(k+1) = omega_ac * t_vec(k);
theta_ac_deg_deg(k+1) = rad2deg(theta_ac_deg_rad(k));

%%
% Transistor Voltages
figure;
sgtitle("Voltages for each Transistor");

subplot(3, 2, 1)
plot(theta_ac_deg, V_T1)
title('Transistor 1: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 2)
plot(theta_ac_deg, V_T2)
title('Transistor 2: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 3)
plot(theta_ac_deg, V_T3)
title('Transistor 3: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 4)
plot(theta_ac_deg, V_T4)
title('Transistor 4: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 5)
plot(theta_ac_deg, V_T5)
title('Transistor 5: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 6)
plot(theta_ac_deg, V_T6)
title('Transistor 6: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

% Transistor Currents
figure;
sgtitle("Currents for each Transistor");

subplot(3, 2, 1)
plot(theta_ac_deg, i_T1)
title('Transistor 1: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 2)
plot(theta_ac_deg, i_T2)
title('Transistor 2: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 3)
plot(theta_ac_deg, i_T3)
title('Transistor 3: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 4)
plot(theta_ac_deg, i_T4)
title('Transistor 4: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 5)
plot(theta_ac_deg, i_T5)
title('Transistor 5: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 6)
plot(theta_ac_deg, i_T6)
title('Transistor 6: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

% Diode Voltages
figure;
sgtitle("Voltages for each Diode");

subplot(3, 2, 1)
plot(theta_ac_deg, V_D1)
title('Diode 1: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 2)
plot(theta_ac_deg, V_D2)
title('Diode 2: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 3)
plot(theta_ac_deg, V_D3)
title('Diode 3: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 4)
plot(theta_ac_deg, V_D4)
title('Diode 4: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 5)
plot(theta_ac_deg, V_D5)
title('Diode 5: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 6)
plot(theta_ac_deg, V_D6)
title('Diode 6: Voltage')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

% Diode Currents
figure;
sgtitle("Currents for each Diode");

subplot(3, 2, 1)
plot(theta_ac_deg, i_D1)
title('Diode 1: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 2)
plot(theta_ac_deg, i_D2)
title('Diode 2: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 3)
plot(theta_ac_deg, i_D3)
title('Diode 3: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 4)
plot(theta_ac_deg, i_D4)
title('Diode 4: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 5)
plot(theta_ac_deg, i_D5)
title('Diode 5: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 6)
plot(theta_ac_deg, i_D6)
title('Diode 6: Current')
xlabel('\theta (degrees)');
ylabel('Current (A)')

%% Phase Leg Voltages and currents
figure;
sgtitle("Phase Leg Voltages and Currents");

subplot(3, 2, 1)
plot(theta_ac_deg, V_as)
title('Vas')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 2)
plot(theta_ac_deg, i_as)
title('ias')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 3)
plot(theta_ac_deg, V_bs)
title('Vbs')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 4)
plot(theta_ac_deg, i_bs)
title('ibs')
xlabel('\theta (degrees)');
ylabel('Current (A)')

subplot(3, 2, 5)
plot(theta_ac_deg, V_cs)
title('Vcs')
xlabel('\theta (degrees)');
ylabel('Voltage (V)')

subplot(3, 2, 6)
plot(theta_ac_deg, i_cs)
title('ics')
xlabel('\theta (degrees)');
ylabel('Current (A)')

%% Spectrum Analysis
[avg_a, ak_a, bk_a, rcon_a, err_a] = fourseries(t_vec, V_as, T_sw, 1200);
[avg_b, ak_b, bk_b, rcon_b, err_b] = fourseries(t_vec, V_bs, T_sw, 1200);
[avg_c, ak_c, bk_c, rcon_c, err_c] = fourseries(t_vec, V_cs, T_sw, 1200);

disp("Fundamental Frequency of ak (for a): " + num2str(ak_a(1)));
disp("Fundamental Frequency of bk (for a): " + num2str(bk_a(1)));

disp("Fundamental Frequency of ak (for b): " + num2str(ak_b(1)));
disp("Fundamental Frequency of bk (for b): " + num2str(bk_b(1)));

disp("Fundamental Frequency of ak (for c): " + num2str(ak_c(1)));
disp("Fundamental Frequency of bk (for c): " + num2str(bk_c(1)));