    n = -2:1;
    xn = [1, -2, 3, 6];


// TASK a. y_1(n) = x(-n)
        scf();
        
        subplot(2, 1, 1);
        plot([-3, 2], [0, 0], 'k');
        
        plot([0, 0], [min(xn)-1, max(xn)+1], 'k');
        
        plot2d3(n, xn, style=2);
        
        plot(n, xn, 'r*');
        
        xlabel('n');
        ylabel('x(n)');
        
        title('Plot of the signal x(n) = {1, -2, 3↑, 6}');
    
        n_y1 = flipdim(n, 1) * -1;
        y1 = flipdim(xn, 1);
        
        subplot(2, 1, 2);
        plot([-3, 3], [0, 0], 'k');
        plot([0, 0], [min(y1)-1, max(y1)+1], 'k');
        
        plot2d3(n_y1, y1, style=2);
        
        plot(n_y1, y1, 'r*');
        
        xlabel('n');
        ylabel('y_1(n)');
        
        title('Plot of the signal y_1(n) = x(-n)');



// TASK b. y_2 (n)=x(n+3)
        scf();
        subplot(2, 1, 1);
        plot([-3, 2], [0, 0], 'k');
        
        plot([0, 0], [min(xn)-1, max(xn)+1], 'k');
        
        plot2d3(n, xn, style=2);
        
        plot(n, xn, 'r*');
        
        xlabel('n');
        ylabel('x(n)');
        
        title('Plot of the signal x(n) = {1, -2, 3↑, 6}');
        
        n_y2 = n - 3;
        y2 = xn;
        
        subplot(2, 1, 2);
        plot([-6, 2], [0, 0], 'k');
        plot([0, 0], [min(y2)-1, max(y2)+1], 'k');
        
        plot2d3(n_y2, y2, style=2);
        
        plot(n_y2, y2, 'r*');
        
        xlabel('n');
        ylabel('y_2(n)');
        
        title('Plot of the signal y_2(n) = x(n+3)');



// TASK c. y_3 (n)=2x(-n-2)
        scf();
        
        subplot(2, 1, 1);
        plot([-3, 2], [0, 0], 'k');
        
        plot([0, 0], [min(xn)-1, max(xn)+1], 'k');
        
        plot2d3(n, xn, style=2);
        
        plot(n, xn, 'r*');
        
        xlabel('n');
        ylabel('x(n)');
        
        title('Plot of the signal x(n) = {1, -2, 3↑, 6}');
        
        n_neg_n_minus2 = -3:0;
        x_neg_n_minus2 = [6, 3, -2, 1];
        
        y3 = 2 * x_neg_n_minus2;
        
        subplot(2, 1, 2);
        plot([-4, 1], [0, 0], 'k');
        plot([0, 0], [min(y3)-1, max(y3)+1], 'k');
        
        plot2d3(n_neg_n_minus2, y3, style=2);
        
        plot(n_neg_n_minus2, y3, 'r*');
        
        xlabel('n');
        ylabel('y_3(n)');
        
        title('Plot of the signal y_3(n) = 2x(-n-2)');
