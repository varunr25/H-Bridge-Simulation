% ID Number: 229,506
% ECE 31033 - Project #2
% sine_triangle_FE.m

while t_vec(k) < tend
    D(k) =  m * cos((omega_ac * t_vec(k)) + phi_v);

    SW1_4(k) = sw(D(k), t_vec(k), 1/7600);
    SW2_3(k) = ~SW1_4(k);
    
    if(SW1_4(k))
        if (m <= 1)
            V_AC(k+1) = sqrt(2) * V_DC;
        else
            f_m = 0.5 * sqrt(1 - (1/m)^2) + 0.25 * m * (pi - 2 * acos(1/m));
            V_AC(k+1) = (2 / pi) * V_DC * f_m * cos((omega_ac * t_vec(k)) + phi_v);
        end

        dI_dt = (V_AC(k) - R * i_AC(k)) / L;
        i_AC(k + 1) = i_AC(k) + dI_dt * dt;

        V_T1(k+1) = 0;              V_T4(k+1) = 0;
        V_T2(k+1) = V_DC;           V_T3(k+1) = V_DC;

        V_D1(k+1) = V_DC;           V_D4(k+1) = V_DC;
        V_D2(k+1) = 0;              V_D3(k+1) = 0;

        if(i_AC(k+1) > 0)
            i_T1(k+1) = i_AC(k+1);      i_T4(k+1) = i_AC(k+1);
            i_T2(k+1) = 0;              i_T3(k+1) = 0;

            i_D2(k+1) = 0;              i_D3(k+1) = 0;
            i_D1(k+1) = 0;              i_D4(k+1) = 0;
        else
            i_T1(k+1) = 0;              i_T4(k+1) = 0;
            i_T2(k+1) = 0;              i_T3(k+1) = 0;

            i_D1(k+1) = -i_AC(k+1);     i_D4(k+1) = -i_AC(k+1);
            i_D2(k+1) = 0;              i_D3(k+1) = 0;
        end

    else
        if (m <= 1)
            V_AC(k+1) = -sqrt(2) * V_DC;
        else
            f_m = 0.5 * sqrt(1 - (1/m)^2) + 0.25 * m * (pi - 2 * acos(1/m));
            V_AC(k+1) = -(2 / pi) * V_DC * f_m * cos((omega_ac * t_vec(k)) + phi_v);
        end

        dI_dt = (V_AC(k) - R * i_AC(k)) / L;
        i_AC(k + 1) = i_AC(k) + dI_dt * dt;

        V_T1(k+1) = V_DC;           V_T4(k+1) = V_DC;
        V_T2(k+1) = 0;              V_T3(k+1) = 0;

        V_D1(k+1) = 0;              V_D4(k+1) = 0;
        V_D2(k+1) = V_DC;           V_D3(k+1) = V_DC;

        if(i_AC(k+1) > 0)
            i_T1(k+1) = 0;              i_T4(k+1) = 0;
            i_T2(k+1) = 0;              i_T3(k+1) = 0;

            i_D1(k+1) = 0;              i_D4(k+1) = 0;
            i_D2(k+1) = i_AC(k+1);      i_D3(k+1) = i_AC(k+1);
        else
            i_T1(k+1) = 0;              i_T4(k+1) = 0;
            i_T2(k+1) = -i_AC(k+1);     i_T3(k+1) = -i_AC(k+1);

            i_D1(k+1) = 0;              i_D4(k+1) = 0;
            i_D2(k+1) = 0;              i_D3(k+1) = 0;
        end
    end
    
    % Update theta_ac for next step
    theta_ac_rad(k+1) = omega_ac * t_vec(k);
    theta_ac_deg(k+1) = rad2deg(theta_ac_rad(k));
    
    % Prepare for next iteration
    t_vec(k + 1) = t_vec(k) + dt;
    k = k + 1;
end