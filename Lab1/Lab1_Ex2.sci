    // The period T of the signal xa (t) is: T = 2π/ω = 0.02 seconds
    T = 0.02;
    t = 0:0.0001:5*T;
    
    xa = 3 * sin(100 * %pi * t);
    
    plot(t, xa);
    
    title('Analog Signal xa(t) = 3sin(100πt)');
    xlabel('Time (s)');
    ylabel('xa');


    // Ts = 1/Fs = 1/300 seconds
    // We sample the signal from t = 0 to t = 5*T = 0.1 seconds at intervals of Ts
    Fs = 300;
    Ts = 1/Fs;
    n = 0:Ts:5*T;
    xn = 3 * sin(100 * %pi * n);


    fd = 50;
    N = Fs / fd;
    F = 1/N;

    disp("Frequency F of x(n): " + string(F));
    disp("Period N of x(n): " + string(N));

    plot(n, xn, 'r*');

    title('Discrete-Time Signal x(n) = 3sin(πn/3)');
    xlabel('Time (s)');
    ylabel('x(n)');


    Delta = 0.1;

    xq = floor(xa / Delta) * Delta;

    t_stairs = [];
    xq_stairs = [];

    for i = 1:length(t)-1
        t_stairs = [t_stairs, t(i), t(i+1)];
        xq_stairs = [xq_stairs, xq(i), xq(i)];
    end

    t_stairs = [t_stairs, t($)];
    xq_stairs = [xq_stairs, xq($)];
    
    plot(t_stairs, xq_stairs, 'r');

    title('Quantized Signal xq(n) with Δ = 0.1');
    xlabel('Time (s)');
    ylabel('xq(n)');
