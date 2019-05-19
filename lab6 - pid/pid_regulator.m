%utworzenie obiektu dynamicznego wykorzystuj¹c funkcjê pade 
%aby otrzymaæ opóŸnienie 

[liczIn, mianIn] = zp2tf([-5], [-1, -2, -3, -4], 6);
[liczOp, mianOp] = pade(1, 5);
[licz, mian] = series(liczOp, mianOp, liczIn, mianIn);
obiekt = tf(licz, mian);

%wyrysowanie linii pierwiastkowych celem odczytania Kkr
figure();
rlocus(obiekt);
title('Odczytanie wartoœci Kkr');
%pause;
%[Kkr, bieguny] = rlocfind(obiekt);

%wartoœæ odczytana na podstawie wykresu linii pierwiastkowych
Kkr = 1.652113;

%odpowiedŸ skokowa uk³adu zamkniêtego dla regulatora
%proporcjonalnego ze wzmocnieniem Kkr
figure();
step(feedback(Kkr*obiekt, 1), 50);
title('Odczytanie wartoœci Pkr');

%wartoœæ odczytana z wykresu odpowiedzi skokowej
Pkr = 5;

%ustawienie nastawu regulatora
K = 0.6*Kkr;
Ti = Pkr/2;
Td = Pkr/8;

%utworzenie regulatora
R = pidstd(K, Ti, Td);
sys_otw = series(R, obiekt);
sys_zamk = feedback(sys_otw, 1);

%odpowiedzi skokowe
figure();
t = 0:0.01:20;
y_zamk = step(sys_zamk, t);
y_otw = step(obiekt, t);
plot(t, y_zamk, t, y_otw);
legend('Zamkniêty', 'Otwarty');
title('Odpowiedzi skokowe uk³adu otwartego i zamkniêtego z regulatorem');