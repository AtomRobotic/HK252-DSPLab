    x = 1:4;
    result1 = x + 1;

    disp("Vector in form (x1+1,x2+1,x3+1,x4+1), x=1:4");
    disp(result1);
    mprintf('\n');


    x = 1:4;
    y = 5:8;
    result2 = x .* y;

    disp("Vector in form (x1y1,x2y2,x3y3,x4y4), x=1:4, y=5:8");
    disp(result2);
    mprintf('\n');


    x = linspace(0, %pi, 10);
    result3 = sin(x);

    disp("Vector in form (sin(x1),sin(x2),…,sin(x10))");
    disp(result3);
