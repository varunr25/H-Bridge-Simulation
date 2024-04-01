% ID Number: 229,506
% ECE 31033 - Project #2
% sine_triangle_FE.m

while k < tend
    if (m_boolean)
        sine_ref = m * V_DC * sin(omega_ac * t(k) + phi_v);
        carrier = sawtooth(omega_sw * t(k), 0.5); % Shifted to be 0 to 1

        if sine_ref > V_DC * (carrier * 2 - 1) % Sine above carrier
            V_AC(k) = V_DC; % Upper switches on
            % Set voltages and currents for upper switches and lower diodes
            v_T1(k) = 0;
            i_T1(k) = i_L(k);
            % ...
        else
            V_AC(k) = -V_DC; % Lower switches on
            % Set voltages and currents for lower switches and upper diodes
            v_T1(k) = V_DC;
            i_T1(k) = 0;
            % ...
        end
        
        % Forward Euler integration for the inductor current
        di_L_dt = (V_AC(k) - R * i_L(k)) / L;
        i_L(k+1) = i_L(k) + di_L_dt * dt;

        k = k + 1;

    else
        m = m_values(i); % Set the current modulation index
    
        % Reset or initialize any other variables if needed
        % Run your forward Euler simulation here with the current value of m
        
        % Call your fourseries function to analyze the output voltage
        [avg, ak, bk, ~, ~] = fourseries(t, v_ac, T, 1); % Assuming N = 1 for the fundamental
        
        % The amplitude of the fundamental frequency is given by sqrt(a1^2 + b1^2)
        fundamental_amplitudes(k) = sqrt(ak(1)^2 + bk(1)^2);
    end
end