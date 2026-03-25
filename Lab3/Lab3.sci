//==================================================
// LAB 3 - DISCRETE-TIME SIGNAL OPERATIONS IN SCILAB
//==================================================

funcprot(0);
clc;
clear;

//--------------------------------------------------
// Utility: print result to console
//--------------------------------------------------
function print_result(title_str, yn, yorigin)
    mprintf("\n====================================\n");
    mprintf("%s\n", title_str);
    mprintf("====================================\n");
    disp("yn = ");
    disp(yn);
    mprintf("yorigin = %d\n", yorigin);
endfunction

//--------------------------------------------------
// Utility: validate signal origin
//--------------------------------------------------
function check_origin(xn, xorigin, signal_name)
    if size(xn, "*") == 0 then
        error(msprintf("%s must not be empty.", signal_name));
    end

    if xorigin < 1 | xorigin > length(xn) then
        error(msprintf("%s origin must be between 1 and %d.", signal_name, length(xn)));
    end
endfunction

//--------------------------------------------------
// Utility: plot one discrete-time signal
//--------------------------------------------------
function draw_signal(n, x, title_str, color_id)
    plot2d3(n, x, style=color_id);
    plot(n, x, "o");

    a = gca();
    xmin = min(n) - 1;
    xmax = max(n) + 1;
    ymin = min([0 x]) - 1;
    ymax = max([0 x]) + 1;

    if ymin == ymax then
        ymin = ymin - 1;
        ymax = ymax + 1;
    end

    a.data_bounds = [xmin, ymin; xmax, ymax];
    xgrid();
    xtitle(title_str, "n", "Amplitude");
endfunction

//--------------------------------------------------
// Utility: align two signals to the same time axis
//--------------------------------------------------
function [s1, s2, n, yorigin] = align_signals(x1n, x1origin, x2n, x2origin)
    check_origin(x1n, x1origin, "x1");
    check_origin(x2n, x2origin, "x2");

    n1_start = 1 - x1origin;
    n1_end   = length(x1n) - x1origin;

    n2_start = 1 - x2origin;
    n2_end   = length(x2n) - x2origin;

    n_start = min(n1_start, n2_start);
    n_end   = max(n1_end, n2_end);

    n = n_start:n_end;
    N = length(n);

    s1 = zeros(1, N);
    s2 = zeros(1, N);

    idx1_start = n1_start - n_start + 1;
    idx1_end   = idx1_start + length(x1n) - 1;
    s1(idx1_start:idx1_end) = x1n;

    idx2_start = n2_start - n_start + 1;
    idx2_end   = idx2_start + length(x2n) - 1;
    s2(idx2_start:idx2_end) = x2n;

    yorigin = 1 - n_start;
endfunction

//--------------------------------------------------
// Exercise 1: Delay
// y(n) = x(n-k), k > 0
//--------------------------------------------------
function [yn, yorigin] = delay(xn, xorigin, k)
    check_origin(xn, xorigin, "x");

    if k <= 0 then
        error("k must be > 0 for delay.");
    end

    yn = xn;
    yorigin = xorigin - k;

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;

    scf();
    clf();

    subplot(2,1,1);
    draw_signal(nx, xn, "Input signal x(n)", 2);

    subplot(2,1,2);
    draw_signal(ny, yn, "Delayed signal y(n) = x(n-k)", 5);

    print_result("EXERCISE 1: DELAY", yn, yorigin);
endfunction

//--------------------------------------------------
// Exercise 2: Advance
// y(n) = x(n+k), k > 0
//--------------------------------------------------
function [yn, yorigin] = advance(xn, xorigin, k)
    check_origin(xn, xorigin, "x");

    if k <= 0 then
        error("k must be > 0 for advance.");
    end

    yn = xn;
    yorigin = xorigin + k;

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;

    scf();
    clf();

    subplot(2,1,1);
    draw_signal(nx, xn, "Input signal x(n)", 2);

    subplot(2,1,2);
    draw_signal(ny, yn, "Advanced signal y(n) = x(n+k)", 5);

    print_result("EXERCISE 2: ADVANCE", yn, yorigin);
endfunction

//--------------------------------------------------
// Exercise 3: Fold
// y(n) = x(-n)
//--------------------------------------------------
function [yn, yorigin] = fold(xn, xorigin)
    check_origin(xn, xorigin, "x");

    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;

    scf();
    clf();

    subplot(2,1,1);
    draw_signal(nx, xn, "Input signal x(n)", 2);

    subplot(2,1,2);
    draw_signal(ny, yn, "Folded signal y(n) = x(-n)", 5);

    print_result("EXERCISE 3: FOLD", yn, yorigin);
endfunction

//--------------------------------------------------
// Exercise 4: Add
// y(n) = x1(n) + x2(n)
//--------------------------------------------------
function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    [s1, s2, n, yorigin] = align_signals(x1n, x1origin, x2n, x2origin);
    yn = s1 + s2;

    scf();
    clf();

    subplot(3,1,1);
    draw_signal(n, s1, "Signal x1(n)", 2);

    subplot(3,1,2);
    draw_signal(n, s2, "Signal x2(n)", 3);

    subplot(3,1,3);
    draw_signal(n, yn, "Sum y(n) = x1(n) + x2(n)", 5);

    print_result("EXERCISE 4: ADD", yn, yorigin);
endfunction

//--------------------------------------------------
// Exercise 5: Multiply
// y(n) = x1(n) .* x2(n)
//--------------------------------------------------
function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    [s1, s2, n, yorigin] = align_signals(x1n, x1origin, x2n, x2origin);
    yn = s1 .* s2;

    scf();
    clf();

    subplot(3,1,1);
    draw_signal(n, s1, "Signal x1(n)", 2);

    subplot(3,1,2);
    draw_signal(n, s2, "Signal x2(n)", 3);

    subplot(3,1,3);
    draw_signal(n, yn, "Product y(n) = x1(n) .* x2(n)", 5);

    print_result("EXERCISE 5: MULTIPLY", yn, yorigin);
endfunction

//--------------------------------------------------
// Exercise 6: Convolution
// y(n) = x(n) * h(n)
//--------------------------------------------------
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    check_origin(xn, xorigin, "x");
    check_origin(hn, horigin, "h");

    yn = conv(xn, hn, "full");
    yorigin = xorigin + horigin - 1;

    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;

    scf();
    clf();

    subplot(3,1,1);
    draw_signal(nx, xn, "Input signal x(n)", 2);

    subplot(3,1,2);
    draw_signal(nh, hn, "System response h(n)", 3);

    subplot(3,1,3);
    draw_signal(ny, yn, "Convolution y(n) = x(n) * h(n)", 5);

    print_result("EXERCISE 6: CONVOLUTION", yn, yorigin);
endfunction

//==================================================
// TEST CASES
//==================================================

// Exercise 1
[yn1, yo1] = delay([1, -2, 3, 6], 3, 1);

// Exercise 2
[yn2, yo2] = advance([1, -2, 3, 6], 3, 1);

// Exercise 3
[yn3, yo3] = fold([1, -2, 3, 6], 3);

// Exercise 4
[yn4, yo4] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);

// Exercise 5
[yn5, yo5] = multi([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);

// Exercise 6
[yn6, yo6] = convolution([1, 2, 1], 2, [1, -1, 2], 2);
