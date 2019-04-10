%reprezentacja uk�adu spr�yna - t�umik

%parametry uk�adu
M = 1000;
F = 1000;
alfa = 500;
c = 400;
K = 1/c;
T = sqrt(M/c);
eps = alfa/(2*sqrt(c*M));

%r�ne formy reprezentacji uk�adu
licz = [1];
mian = [M alfa c];
obiekt = tf(licz, mian);
[z, p, k] = tf2zp(licz, mian);

figure(1);
step(licz,mian);
title('Odpowied� skokowa');

figure(2);
impulse(licz, mian);
title('Odpowied� impulsowa');

figure(3);
pzmap(obiekt);
title('Zera i bieguny uk�adu');
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
legend('Uk�ad oscylacyjny', 'Uk�ad t�umiony');
title('Por�wnanie odpowiedzi skokowych uk�adu oscylacyjnego i t�umionego');