    n = -1:1;
    x = [1, 3, -2];
    
    subplot(3, 1, 1);
    plot([-1.5, 1.5], [0, 0], 'k-');
    
    plot2d3(n, x, style=5);
    
    title('Discrete-time Signal x(n)');
    xlabel('Index n');
    ylabel('Amplitude x(n)');


    n = -1:1;
    x = [1, 3, -2];
    
    x_neg = [x(3), x(2), x(1)];
    
    xo = (x - x_neg) / 2;
    
    subplot(3, 1, 2);
    plot([-2, 2], [0, 0], 'k');
    
    plot([0, 0], [-2, 2], 'k');
    
    plot2d3(n, xo, style=5); 
    
    title('Odd Component x_o(n) of the Signal');
    xlabel('Index n');
    ylabel('Amplitude x_o(n)');


    n = -1:1;
    x = [1, 3, -2];
    
    x_neg = [x(3), x(2), x(1)];
    
    xe = (x + x_neg) / 2;
    
    subplot(3, 1, 3);
    plot([-2, 2], [0, 0], 'k'); 
    
    plot([0, 0], [-2, 2], 'k');
    
    plot2d3(n, xe, style=5); 
    
    title('Even Component x_e(n) of the Signal');
    xlabel('Index n');
    ylabel('Amplitude x_e(n)');
