% modelowanie uk�adu
[licz, mian] = zp2tf([],[0 -1 -5], 5);
obiekt = tf(licz, mian);

% wyrysowanie linii pierwiastkowych, poszukiwanie warto�ci wsp. t�umienia =
% 0.707
figure();
rlocus(licz, mian);
line([0 -1], [0 1]);
sgrid();
pause;

[k, bieguny] = rlocfind(obiekt);

% odpowied� skokowa uk�adu zamkni�tego
sys = feedback(series(k,obiekt), 1);
figure();
step(sys);
title('Odpowied� skokowa uk�adu zamkni�tego bez kompensatora');

% dodanie kompensatora
komp = tf([1 1], [0.1 1]);
sys_k = series(komp, obiekt);

% wyrysowanie linii pierwiastkowych, poszukiwanie warto�ci wsp. t�umienia =
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
title('Odpowied� skokowa uk�adu zamkni�tego z kompensatorem');