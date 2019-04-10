%reprezentacja uk³adu sprê¿yna - t³umik

%parametry uk³adu
M = 1000;
F = 1000;
alfa = 500;
c = 400;
K = 1/c;
T = sqrt(M/c);
eps = alfa/(2*sqrt(c*M));

%ró¿ne formy reprezentacji uk³adu
licz = [1];
mian = [M alfa c];
obiekt = tf(licz, mian);
[z, p, k] = tf2zp(licz, mian);

figure(1);
step(licz,mian);
title('OdpowiedŸ skokowa');

figure(2);
impulse(licz, mian);
title('OdpowiedŸ impulsowa');

figure(3);
pzmap(obiekt);
title('Zera i bieguny uk³adu');
xlim([-3 3]);
ylim([-3 3]);

%%%%%%%%%%%%%%%%%%%

licz = [K];
mian = [T*T, 2*T*eps, 1];
figure(4);
step(licz, mian);
hold on;


alfa = 1500;
eps = alfa/(2*sqrt(c*M));
mian = [T*T, 2*T*eps, 1];
step(licz, mian);
legend('Uk³ad oscylacyjny', 'Uk³ad t³umiony');
title('Porównanie odpowiedzi skokowych uk³adu oscylacyjnego i t³umionego');