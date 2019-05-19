% modelowanie uk³adu
[licz, mian] = zp2tf([],[0 -1 -5], 5);
obiekt = tf(licz, mian);

% wyrysowanie linii pierwiastkowych, poszukiwanie wartoœci wsp. t³umienia =
% 0.707
figure();
rlocus(licz, mian);
line([0 -1], [0 1]);
sgrid();
pause;

[k, bieguny] = rlocfind(obiekt);

% odpowiedŸ skokowa uk³adu zamkniêtego
sys = feedback(series(k,obiekt), 1);
figure();
step(sys);
title('OdpowiedŸ skokowa uk³adu zamkniêtego bez kompensatora');

% dodanie kompensatora
komp = tf([1 1], [0.1 1]);
sys_k = series(komp, obiekt);

% wyrysowanie linii pierwiastkowych, poszukiwanie wartoœci wsp. t³umienia =
% 0.707
figure();
rlocus(sys_k);
line([0 -5], [0 5]);
sgrid();
pause;

[k_k, bieguny_k] = rlocfind(sys_k);

sys_k2 = feedback(series(k_k,sys_k), 1);
figure();
step(sys_k2);
title('OdpowiedŸ skokowa uk³adu zamkniêtego z kompensatorem');