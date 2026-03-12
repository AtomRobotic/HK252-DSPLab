// Draw x1(n)
    n = 0:3;
    x1 = [0, 1, 3, -2];
    
    subplot(3, 1, 1);
    plot([0, 0], [-3, 4], 'k');
    plot([-1, 4], [0, 0], 'k');
    
    plot2d3(n, x1, style=2);
    
    plot(n, x1, 'r*');
    
    xlabel('n');
    ylabel('x1(n)');
    title('x1(n)');


// Draw x2(n)
    n = -1:2;
    x2 = [0, 1, 2, 3];

    subplot(3, 1, 2);
    plot([0, 0], [-1, 4], 'k');
    plot([-2, 3], [0, 0], 'k');
    
    plot2d3(n, x2, style=2);
    
    plot(n, x2, 'r*');
    
    xlabel('n');
    ylabel('x2(n)');
    title('x2(n)');
    

// Draw y(n)
    n = -1:3;
    x1 = [0, 0, 1, 3, -2];
    x2 = [0, 1, 2, 3, 0];
    y = x1 .* x2;
    
    subplot(3, 1, 3);
    plot(n, y, 'r*');
    
    plot([min(n)-1, max(n)+1], [0,0], 'k');
    plot([0,0], [min(y)-1, max(y)+1], 'k');
    
    plot2d3(n, y, style=2);
    
    xlabel('n');
    ylabel('y(n)');
    title('y(n) = x1(n) * x2(n)');
