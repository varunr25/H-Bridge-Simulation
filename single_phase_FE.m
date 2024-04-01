% ID Number: 229,506
% ECE 31033 - Project #2
% single_phase_FE.m

while t_vec(k) < tend
    V_as(k) = V_m * cos(omega * t_vec(k));  % AC voltage

    if V_as(k) >= 0     
    % SW1 and SW4 are on, SW2 and SW3 are off during positive half-cycle
        switch_bool = 1;
        
        % SW1 conducts
        V_T1(k) = 0;            i_T1(k) = i_AC(k); 
        
        % SW4 conducts
        V_T4(k) = 0;            i_T4(k) = i_AC(k);
        
        % SW2 is off
        V_T2(k) = V_DC;         i_T2(k) = 0;
        
        % SW3 is off
        V_T3(k) = V_DC;         i_T3(k) = 0;

    % Diodes conduct when corresponding switches are off
        % D2 conducts
        V_D2(k) = 0;            i_D2(k) = i_AC(k); 

        % D3 conducts        
        V_D3(k) = 0;            i_D3(k) = i_AC(k); 

        % D1 is off
        V_D1(k) = V_DC;         i_D1(k) = 0; 

        % D4 is off
        V_D4(k) = V_DC;         i_D4(k) = 0; 

    else   
    % SW2 and SW3 are on, SW1 and SW4 are off during negative half-cycle
        switch_bool = 0;
            
        % SW2 conducts
        V_T2(k) = 0;            i_T2(k) = i_AC(k); 
        
        % SW3 conducts
        V_T3(k) = 0;            i_T3(k) = i_AC(k); 
        
        % SW1 is off 
        V_T1(k) = V_DC;         i_T1(k) = 0;
        
        % SW4 is off
        V_T4(k) = V_DC;         i_T4(k) = 0;
        
    % Diodes conduct when corresponding switches are off
        % D1 conducts
        V_D1(k) = 0;            i_D1(k) = i_AC(k); 
        
        % D4 conducts
        V_D4(k) = 0;            i_D4(k) = i_AC(k); 
        
        % D2 is off
        V_D2(k) = V_DC;         i_D2(k) = 0; 
        
        % D3 is off
        V_D3(k) = V_DC;         i_D3(k) = 0; 
    end
 
    V_AC(k) = ((2 * switch_bool) - 1) * V_DC;
    dI_dt(k) = (V_AC(k) - (R * i_AC(k))) / L;     % Change in current
    i_AC(k + 1) = i_AC(k) + dI_dt(k) * dt;       % AC current for next step

    theta_ac_rad(k) = omega * t_vec(k);             % theta_ac in radians
    theta_ac_deg(k) = rad2deg(theta_ac_rad(k));     % theta_ac in degrees
    
    t_vec(k + 1) = t_vec(k) + dt;   
    k = k + 1;
end

% DC voltage is constant across the simulation
V_DC = V_DC * ones(size(t_vec));

% DC current is the average of the absolute values of the AC current
i_DC = mean(abs(i_AC));

% Remove the extra element at the end of arrays caused by the forward Euler method
i_AC(end) = [];
t_vec(end)= [];