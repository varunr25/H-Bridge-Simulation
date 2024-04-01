% Parameters
R = 0.5; % Resistance in ohms
L = 1e-3; % Inductance in henrys
V_m = 200/pi; % Peak voltage of V_as
f = 60; % Frequency in Hz
omega = 2 * pi * f; % Angular frequency
T = 1 / f; % Period of the AC voltage

% Time vector for one period
dt = T / 1000; % Time step
t = 0:dt:T-dt; % One period, 0 to T

% AC Voltage
V_as = V_m * cos(omega * t);

% Initialize AC Current
I_ac = zeros(1, length(t));

% Euler forward integration
for k = 1:length(t)-1
    dI_dt = (V_as(k) - R * I_ac(k)) / L;
    I_ac(k+1) = I_ac(k) + dI_dt * dt;
end

% DC current (average over one period)
I_dc = mean(I_ac);

% Voltage across the switch when it is on
V_sw_on = 0; % Ideal switch voltage when on

% Voltage across the switch when it is off
V_dc = max(V_as) * pi / 2; % Assuming the relation based on the notes
V_sw_off = V_dc; % Voltage across the switch when off

% Plot the AC current waveform
figure;
plot(t, I_ac);
xlabel('Time (s)');
ylabel('Current (A)');
title('AC Current Waveform');
grid on;

% Since we do not have switching moments, we assume ideal switches
% The currents and voltages for the switches would need more context
% but are typically 0 when on and V_dc when off for the voltages,
% and follow I_ac when each respective switch is on for the currents.
