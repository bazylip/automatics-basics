theta = 1;
ksi = 0.5;
n = 5;
k = 2;
T = 10;
T1 = 5;
T2 = 5;
Ti = 10;
Td = 10;

[licz_op, mian_op] = pade(theta, n);
licz_in = [0, k]; mian_in = [T, 1];

licz1 = [0, k]; mian1 = [T, 1];
licz2 = [0, 0, k]; mian2 = [T1*T2, T1+T2, 1];
licz3 = [0, 0, k]; mian3 = [T^2, 2*ksi*T, 1];
licz4 = [0, 0, k]; mian4 = [T*Ti, Ti, 0];
licz5 = [Td, 0]; mian5 = [T, 1];
[licz6, mian6] = series(licz_op, mian_op, licz_in, mian_in);

figure(1);
subplot(2, 3, 1);
bode(licz1, mian1);
title('Obiekt inercyjny I rzêdu');
subplot(2, 3, 2);
bode(licz2, mian2);
title('Obiekt inercyjny II rzêdu');
subplot(2, 3, 3);
bode(licz3, mian3);
title('Obiekt inercyjny II rzêdu oscylacyjny');
subplot(2, 3, 4);
bode(licz4, mian4);
title('Obiekt ca³kuj¹cy rzeczywisty');
subplot(2, 3, 5);
bode(licz5, mian5);
title('Obiekt ró¿niczkuj¹cy rzeczywisty');
subplot(2, 3, 6);
bode(licz6, mian6);
title('Obiekt inercyjny I rzêdu z opóŸnieniem');