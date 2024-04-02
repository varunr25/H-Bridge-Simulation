% ID Number: 229,506
% ECE 31033 - Project #2
% single_phase_FE.m

while t_vec(k) < tend
    V_as(k) = V_m * cos(omega * t_vec(k));  % AC voltage calculation
    
    % Apply switching logic based on the quarter periods
    %if V_as(k) >= 0
    if(t_vec(k) < 0.25/f) || (t_vec(k) > 0.75/f)
        % T2 and T3 are ON, T1 and T4 are OFF
        V_AC(k) = -V_DC;
        V_T1(k) = V_DC;
        V_T2(k) = 0;
        V_T3(k) = 0;
        V_T4(k) = V_DC;

        V_D1(k) = 0;
        V_D2(k) = V_DC;
        V_D3(k) = V_DC;
        V_D4(k) = 0;

        if i_AC(k) > 0
            i_T1(k) = (V_T1(k) == 0) * i_AC(k);
            i_T2(k) = 0;
            i_T3(k) = 0;
            i_T4(k) = (V_T4(k) == 0) * i_AC(k);
    
            i_D1(k) = 0;
            i_D2(k) = (V_T2(k) == V_DC) * i_AC(k);
            i_D3(k) = (V_T3(k) == V_DC) * i_AC(k);
            i_D4(k) = 0;
        else
            i_T1(k) = 0;
            i_T2(k) = (V_T2(k) == 0) * -i_AC(k);
            i_T3(k) = (V_T3(k) == 0) * -i_AC(k);
            i_T4(k) = 0;
    
            i_D1(k) = (V_T1(k) == V_DC) * -i_AC(k);
            i_D2(k) = 0;
            i_D3(k) = 0;
            i_D4(k) = (V_T4(k) == V_DC) * -i_AC(k);
        end
    else
        % T1 and T4 are ON, T2 and T3 are OFF
        V_AC(k) = V_DC;
        V_T1(k) = 0;
        V_T2(k) = V_DC;
        V_T3(k) = V_DC;
        V_T4(k) = 0;

        V_D1(k) = V_DC;
        V_D2(k) = 0;
        V_D3(k) = 0;
        V_D4(k) = V_DC;

        if i_AC(k) > 0
            i_T1(k) = (V_T1(k) == 0) * i_AC(k);
            i_T2(k) = 0;
            i_T3(k) = 0;
            i_T4(k) = (V_T4(k) == 0) * i_AC(k);
    
            i_D1(k) = 0;
            i_D2(k) = (V_T2(k) == V_DC) * i_AC(k);
            i_D3(k) = (V_T3(k) == V_DC) * i_AC(k);
            i_D4(k) = 0;
        else
            i_T1(k) = 0;
            i_T2(k) = (V_T2(k) == 0) * -i_AC(k);
            i_T3(k) = (V_T3(k) == 0) * -i_AC(k);
            i_T4(k) = 0;
    
            i_D1(k) = (V_T1(k) == V_DC) * -i_AC(k);
            i_D2(k) = 0;
            i_D3(k) = 0;
            i_D4(k) = (V_T4(k) == V_DC) * -i_AC(k);
        end
    end
    
    % Calculate current for next time step
    dI_dt = (V_AC(k) - R * i_AC(k)) / L;
    i_AC(k + 1) = i_AC(k) + dI_dt * dt;
    
    % Update theta_ac for next step
    theta_ac_rad(k) = omega * t_vec(k);
    theta_ac_deg(k) = rad2deg(theta_ac_rad(k));
    
    % Prepare for next iteration
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