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
m = 1;  % Modulation index (for m = 1, amplitude of sine wave equals V_DC)

omega_ac = 2 * pi * f_ac;   % Angular frequency of AC voltage
omega_sw = 2 * pi * f_sw;   % Angular frequency of switching signal

%% Simulation parameters
dt = 1e-6;              
k = 1;                  

t_vec = 0:dt:T-dt;      
tend = length(t_vec);   

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
V_AC = [0];

V_as = [0];

theta_ac_rad = [0];
theta_ac_deg = [0];

disp("Sine-Triangle Forward Euler Calculations (m=1): Invoked.");
sine_triangle_FE;
disp("  Complete.");

%% Reset for multiple values of m
dt = 1e-6;              
k = 1;                  

t_vec = 0:dt:T-dt;      
tend = length(t_vec);   

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
V_AC = [0];

V_as = [0];

theta_ac_rad = [0];
theta_ac_deg = [0];

m_values = [0, 0.2, 0.4, 1.0, 1.3, 1.6, 2.0, 3.0, 4, 5];
fundamental_amplitudes = [0];

m_boolean = 0;
sine_triangle_FE;

disp("Sine-Triangle Forward Euler Calculations (m varies): Invoked.");
sine_triangle_FE;
disp("  Complete.");