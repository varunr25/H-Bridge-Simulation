r = 0.5;
L = 1e-3;
Vdc = 50;
f = 60;
w = 360*f;

k = 1;
t = 0:1e-6:1/f + 1e-6;


init_circuit;

%  single phase invertor
while t(k) < tend
    if(t(k) < 0.25/f) || (t(k) > 0.75/f) % T2 and T3 are ON
        Vac(k+1) = -Vdc;
        Iac(k+1) = Iac(k) + (Vac(k) - r*Iac(k))*h/L;
        Vt1_4(k+1) = Vdc;
        Vt2_3(k+1) = 0;
        Vd2_3(k+1) = 0;
        Vd1_4(k+1) = 0;
        if(Iac(k+1) > 0)
            It1_4(k+1) = 0;
            It2_3(k+1) = 0;
            Id1_4(k+1) = 0;
            Id2_3(k+1) = Iac(k+1);
        else
            It1_4(k+1) = 0;
            It2_3(k+1) = -Iac(k+1);
            Id1_4(k+1) = 0;
            Id2_3(k+1) = 0;
        end
    else  % T1 and T4 are ON
        Vac(k+1) = Vdc;
        Iac(k+1) = Iac(k) + (Vac(k) - r*Iac(k))*h/L;
        Vt1_4(k+1) = 0;
        Vt2_3(k+1) = Vdc;
        Vd2_3(k+1) = 0;
        Vd1_4(k+1) = 0;
        if(Iac(k+1) > 0)
            It1_4(k+1) = Iac(k+1);
            It2_3(k+1) = 0;
            Id1_4(k+1) = 0;
            Id2_3(k+1) = 0;
        else
            It1_4(k+1) = 0;
            It2_3(k+1) = 0;
            Id1_4(k+1) = -Iac(k+1);
            Id2_3(k+1) = 0;
        end

    end

    theta_ac(k+1) = theta_ac(k) + w*h;
    % do the mod of theta here using the mod function
    theta_ac(k+1) = mod(theta_ac(k+1), 360);
    k = k + 1;
    
end
theta_ac(length(t)) = 360;

plots_P4;

[avg, ak,bk, rconn, err] = fourseries(t, Vac, 1/60, 12000);

fprintf('Average Value: %f\n', avg);
fprintf('Error: %f\n', err);

ak = ak(1:21);
bk = bk(1:21);
a1 = ak(1);
b1 = bk(1);
ak(3:21) = ak(2:20);
bk(3:21) = bk(2:20);
ak(2) = a1;
bk(2) = b1;
ak(1) = avg;
bk(1) = 0;

frequency = 0:60:1200;
figure;
subplot(3,1,1);
stem(frequency, ak);
xlabel('Frequency (Hz)');
ylabel('Ak');
title('Ak vs Frequency');

subplot(3,1,2);
stem(frequency, bk);
xlabel('Frequency (Hz)');
ylabel('Bk');
title('Bk vs Frequency');

subplot(3,1,3);
plot(t, rconn);
xlabel('Time (s)');
ylabel('Rconn');
title('Rconn vs Time');