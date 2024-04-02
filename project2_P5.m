f = 400;
T = 1/f;
Vdc = 100;
m = 1;
r = 1;
L = 1e-3;
w = 360*f;
t = 0:1e-6:T;
D = zeros(1,length(t));
switch1_4 = zeros(1,length(t));
switch2_3 = zeros(1,length(t));
tend = T;
init_circuit;

k = 1; 
while t(k) < tend
    D(k) =  m*cos((2*pi*400*t(k)) - pi/2);
    switch1_4(k) = sw(D(k), t(k), 1/7600);
    switch2_3(k) = ~switch1_4(k);
    if(switch1_4(k))
        Vac(k+1) = sqrt(2)* Vdc;
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

    else
        Vac(k+1) = -sqrt(2)*Vdc;
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
    end
    theta_ac(k+1) = theta_ac(k) + w*h;
    % do the mod of theta here using the mod function
    theta_ac(k+1) = mod(theta_ac(k+1), 360);
    k = k + 1;
    
end
theta_ac(length(t)) = 360;

%plot D vd theta_ac
figure;
subplot(3,1,1);
plot(t,D);
title('D vs time');
xlabel('time');
ylabel('D');
%plot switch1_4 vs theta_ac
subplot(3,1,2);
plot(theta_ac,switch1_4);
title('switch1_4 vs theta_ac');
xlabel('theta_ac');
ylabel('switch1_4');

%plot switch2_3 vs theta_ac
subplot(3,1,3);
plot(theta_ac,switch2_3);
title('switch2_3 vs theta_ac');
xlabel('theta_ac');
ylabel('switch2_3');

plots_P4;



