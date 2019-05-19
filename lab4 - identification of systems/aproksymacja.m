function error = aproksymacja(param)
    k = param(1);
    theta = param(2);
    T1 = param(3);
    T2 = param(4);
    load obiekt;
    t = 0:59;
    
    obiekt = tf([k], [T1*T2, T1+T2, 1], 'OutputDelay', theta);
    odp = step(obiekt,t);
    eps = y - odp;
    error = sum(eps.^2) / length(eps);
end