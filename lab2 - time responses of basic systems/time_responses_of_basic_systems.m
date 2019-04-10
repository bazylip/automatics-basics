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
step(licz1, mian1);
title('Obiekt inercyjny I rzêdu');
subplot(2, 3, 2);
step(licz2, mian2);
title('Obiekt inercyjny II rzêdu');
subplot(2, 3, 3);
step(licz3, mian3);
title('Obiekt inercyjny II rzêdu oscylacyjny');
subplot(2, 3, 4);
step(licz4, mian4);
title('Obiekt ca³kuj¹cy rzeczywisty');
xlim([0, 20]);
subplot(2, 3, 5);
step(licz5, mian5);
title('Obiekt ró¿niczkuj¹cy rzeczywisty');
subplot(2, 3, 6);
step(licz6, mian6);
title('Obiekt inercyjny I rzêdu z opóŸnieniem');

figure(2);
t=0:0.05:5;
dl=length(t);
number=12;
y=zeros(dl,number);
n=1;
while(n<=number)
 [licz,mian]=zp2tf([],[-n/4+3*i -n/4-3*i], (n/4)^2+9);
 [y(1:dl,n),x,tt]=step(licz,mian,t);
 n=n+1;
end
mesh(t,1:12,y'); 
title('Wp³yw biegunów na odpowiedŸ skokow¹ uk³adu');