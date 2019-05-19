function e = faza(k)
    zapas = 45;
    [licz, mian] = zp2tf([], [-1 -1 -1], k);
    [Gm, Pm] = margin(licz, mian);
    e = abs(Pm - zapas);
end