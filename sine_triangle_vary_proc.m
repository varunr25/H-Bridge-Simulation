% ID Number: 229,506
% ECE 31033 - Project #2
% sine_triangle_vary_proc.m

%% Given values
R = 1.0; 
L = 1e-3; 
V_DC = 100; 
f_ac = 400; 
phi_v = -pi/2; 
f_sw = 7600;
T_sw = 1 / f_ac;

m = 1;  % Modulation index (for m = 1, amplitude of sine wave equals V_DC)
V_DC = 100;

omega_ac = 2 * pi * f_ac;   % Angular frequency of AC voltage
omega_sw = 2 * pi * f_sw;   % Angular frequency of switching signal

%% Simulation parameters
parameter_init;  

m_values = [0, 0.2, 0.4, 1.0 1.3, 1.6, 2.0, 3.0, 4, 5];
i = 1;
N = 200;

fundamental_amplitudes = [0];
D = [0];

%%
disp("Sine-Triangle Forward Euler Calculations (m varies): Invoked.");
for i = 1:length(m_values)
    m = m_values(i); 
    sine_triangle_FE;

    %% Spectrum Analysis
    [avg, ak, bk, ~, ~] = fourseries(t_vec(1:k), V_AC(1:k), 1/f_ac, N);

    fundamental_amplitude = sqrt(ak(2)^2 + bk(2)^2);
    fundamental_amplitudes(i) = fundamental_amplitude;
    
    disp(['Complete for m = ', num2str(m_values(i)), ' with fundamental amplitude: ', num2str(fundamental_amplitude)]);
    
    % Plot the amplitude of the fundamental frequency component versus modulation index
    figure;
    plot(m_values(i), fundamental_amplitudes, 'o-');
    title('Fundamental Amplitude vs. Modulation Index');
    xlabel('Modulation Index (m)');
    ylabel('Fundamental Amplitude (V)');
    grid on;

    %% Reset simulation parameters
    R = 1.0; 
    L = 1e-3; 
    V_DC = 100; 
    f_ac = 400; 
    phi_v = -pi/2; 
    f_sw = 7600;
    T_sw = 1 / f_ac;

    m = 1;  % Modulation index (for m = 1, amplitude of sine wave equals V_DC)
    V_DC = 100;

    omega_ac = 2 * pi * f_ac;   % Angular frequency of AC voltage
    omega_sw = 2 * pi * f_sw;   % Angular frequency of switching signal

    parameter_init;

    theta_ac_rad = [0];
    theta_ac_deg = [0];

    i = i + 1;
end