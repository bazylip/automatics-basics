load obiekt;


k = 2;
theta = 7;
T1 = 5;
T2 = 8;
t = 0:59;

obiekt = tf([k], [T1*T2, T1+T2, 1], 'OutputDelay', theta);
odp1 = step(obiekt, t);


eps = y - odp;
blad = sum(eps.^2) / length(eps);

[wynik, blad] = fminsearch('aproksymacja', [k, theta, T1, T2]);
fprintf("Parametry: k:%.3f theta:%.3f T1:%.3f T2:%.3f\n", wynik(1), wynik(2), wynik(3), wynik(4));

obiekt = tf([wynik(1)], [wynik(3)*wynik(4), wynik(3)+wynik(4), 1], 'OutputDelay', wynik(2));
odp2 = step(obiekt, t);

plot(t, y, t, odp1, t, odp2);

title('Identyfikacja obiektu');
legend('obiekt', 'w³asny model', 'model fminsearch');