% damping ratio to maximum overshoot
figure();
ezplot('100*exp((-ksi*pi)/sqrt(1-ksi^2))',[0 1]);
ylabel('MO [%]'), xlabel('\xi');
grid;

% damping ratio to phase margin
figure();
ezplot('atand(2*ksi / sqrt(sqrt(1+4*ksi^2)-2*ksi^2))',[0 1]);
ylabel('PM [deg]'), xlabel('\xi');
grid;

% xi for 25% MO and relating PM (read from plot)
xi = 0.403;
Pm_comp = 39.45;

% system modeling
sys = tf([10], [1 1 0]);

% margin of uncompensated system
[Gm, Pm] = margin(sys);

phi = Pm_comp - Pm;

% a parameter
a = (1 - sind(phi)) / (1 + sind(phi));

% calculating T parameter
additional_magnitude = -10 * log(a);
omega = 0.692; % read from plot
T = 1 / (omega * sqrt(a));

% modeling compensated system
compensator = tf([1 1/T], [a 1/T]);
sys_comp = feedback(series(compensator,sys), 1);
figure();
bode(sys_comp);
title('Compensated system');

figure();
bode(sys);
grid;
title('Original system');

[Gtest, Ptest] = margin(sys_comp);