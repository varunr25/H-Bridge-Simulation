% ID Number: 229,506
% ECE 31033 - Project #2
% parameter_init.m

%% Simulation parameters
dt = 1e-6;                  % Time step for the simulation.
k = 1;                      % Initializing counter value.

t_vec = [0];      
tend = T_sw;   % Number of elements in the time vector.

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
dI_dt = [0];

V_as = [0];
V_AC = [0];

theta_ac_rad = [0];
theta_ac_deg = [0];