% ID Number: 229,506
% ECE 31033 - Project #2
% three_phase_FE.m

while t_vec(k) < tend
    D_a(k) = cos(omega_ac * t_vec(k));
    D_b(k) = cos(omega_ac * t_vec(k) + (2 * pi / 3));
    D_c(k) = cos(omega_ac * t_vec(k) - (2 * pi / 3));

    [T1, T2, T3, T4, T5, T6] = three_phase_sw(D_a(k), D_b(k), D_c(k), t_vec(k), T_sw);

    V_ag(k) = T1 * V_DC;
    V_bg(k) = T2 * V_DC;
    V_cg(k) = T3 * V_DC;
    
    V_as(k) = (2/3) * V_ag(k) - (1/3) * V_bg(k) - (1/3) * V_cg(k);
    V_bs(k) = (2/3) * V_bg(k) - (1/3) * V_ag(k) - (1/3) * V_cg(k);
    V_cs(k) = (2/3) * V_cg(k) - (1/3) * V_ag(k) - (1/3) * V_bg(k);

    dI_dt_a = (V_as(k) - R * i_as(k)) / L;
    i_as(k + 1) = i_as(k) + dt * dI_dt_a;
   
    dI_dt_b = (V_bs(k) - R * i_bs(k)) / L;
    i_bs(k + 1) = i_bs(k) + dt * dI_dt_b;
    
    dI_dt_c = (V_cs(k) - R * i_cs(k)) / L;
    i_cs(k + 1) = i_cs(k) + dt * dI_dt_c;
    
    V_T1(k) = V_DC * (1 - T1) / (2 - T4);
    V_T2(k) = V_DC * (1 - T2) / (2 - T5);
    V_T3(k) = V_DC * (1 - T3) / (2 - T6);
    V_T4(k) = V_DC - V_T1(k);
    V_T5(k) = V_DC - V_T2(k);    
    V_T6(k) = V_DC - V_T3(k); 
    
    V_D1(k) = -V_T1(k);
    V_D2(k) = -V_T2(k);
    V_D3(k) = -V_T3(k);
    V_D4(k) = -V_T4(k);
    V_D5(k) = -V_T5(k);
    V_D6(k) = -V_T6(k);

    if (T1)
        if (i_as(k) > 0)
            i_T1(k) = i_as(k);
            i_D1(k) = 0;
        elseif (i_as(k) < 0)
            i_T1(k) = 0;
            i_D1(k) = -i_as(k);
        else
            i_T1(k) = 0;
            i_D1(k) = 0;
        end
    end

    if (T2)
        if (i_bs(k) > 0)
            i_T2(k) = i_bs(k);
            i_D2(k) = 0;
        elseif (i_bs(k) < 0)
            i_T2(k) = 0;
            i_D2(k) = -i_bs(k);
        else
            i_T2(k) = 0;
            i_D2(k) = 0;
        end
    end
    
    if (T3)
        if (i_cs(k) > 0)
            i_T3(k) = i_cs(k);
            i_D3(k) = 0;
        elseif (i_cs(k) < 0)
            i_T3(k) = 0;
            i_D3(k) = -i_cs(k);
        else
            i_T3(k) = 0;
            i_D3(k) = 0;
        end
    end

    if (T4)
        if (i_as(k) > 0)
            i_T4(k) = 0;
            i_D4(k) = i_as(k);
        elseif (i_as(k) < 0)
            i_T4(k) = -i_as(k);
            i_D4(k) = 0;
        else
            i_T4(k) = 0;
            i_D4(k) = 0;
        end
    end

    if (T5)
        if (i_bs(k) > 0)
            i_T5(k) = 0;
            i_D5(k) = i_bs(k);
        elseif (i_bs(k) < 0)
            i_T5(k) = -i_bs(k);
            i_D5(k) = 0;
        else
            i_T5(k) = 0;
            i_D5(k) = 0;
        end
    end

    if (T6)
        if (i_cs(k) > 0)
            i_T6(k) = 0;
            i_D6(k) = i_cs(k);
        elseif (i_cs(k) < 0)
            i_T6(k) = -i_cs(k);
            i_D6(k) = 0;
        else
            i_T6(k) = 0;
            i_D6(k) = 0;
        end
    end

    t_vec(k + 1) = t_vec(k) + dt;
    k = k + 1;
end