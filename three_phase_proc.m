% ID Number: 229,506
% ECE 31033 - Project #2
% sine_triangle_proc.m

%% Given Values
R = 1; 
L = 1e-3; 
f_fundamental = 50; 
f_sw = 3100; 
V_dc_min = 0; % need to calculate
I_as_desired = 20;

%% Simulation parameters
T = 1 / f_sw;
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

i_T5 = [0];
i_D5 = [0];

i_T6 = [0];
i_D6 = [0];