k = 10;
T1 = 0.1;
T2 = 0.5;
T3 = 0.8;

licz = [k];
mian1 = [T1*T2, T1+T2, 1];
mian2 = [T1*T2*T3, T1*T2 + T1*T3 + T2*T3, T3, 1];

figure(1);
hold on;
nyquist(licz, mian1);
nyquist(licz, mian2);
title('Wp³yw dodawania biegunów na stabilnoœæ');
legend('2 bieguny', '3 bieguny');

%Obliczanie zapasu wzmocnienia i fazy dla uk³adu zamkniêtego

[licz, mian] = zp2tf([], [-1 -1 -1], 4);
%[Gm, Pm] = margin(licz, mian);


%ZnaleŸæ wzmocnienie dla którego zapas fazy wynosi 45 stopni

[wynik, blad] = fminsearch('faza', 1)

zapas = 45;
step = 0.01;
threshold = 10;
tol = 0.1;
for k = 1:step:threshold
   [liczOb, mianOb] = zp2tf([], [-1 -1 -1], k);
   [Gm, Pm] = margin(liczOb, mianOb);
   if(abs(Pm - zapas) < tol)
        fprintf(1, 'Dla k = %.3f zapas fazy wynosi %.3f\n', k, Pm);
        return
   end
end

