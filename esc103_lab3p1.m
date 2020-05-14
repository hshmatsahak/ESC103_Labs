nvals = [2, 3, 4, 5, 6, 7]
figure();
title ({'Solving the Boundary Value Problem',... 
    'for second order linear differential equation involving temperature'})
xlabel ('Number of subintervals');
ylabel ('Tempertaure');
hold on;
for i = 1:length(nvals)
    n = nvals (i);
    vec1 = (-0.05-(n*n/50)) * ones (1,n-1);
    vec2 = (n*n/100) * ones (1,n-2);
    A = diag(vec1, 0) + diag(vec2,1) + diag(vec2, -1);
    b = -10 * ones(n-1, 1);
    b(1) = -10-3*n*n;
    b(end) = -10-n*n*4;
    x = A\b;
    yvals = [300; x; 400];
    xvals = [0:10/n: 10];
    plot (xvals, yvals, 'DisplayName', strcat(num2str(n), ' subintervals'));
    hold on;
end
fplot (@(x) 200+20.4671*exp(sqrt(0.05)*x)+79.5329*exp(-1*sqrt(0.05)*x), [0, 10], 'DisplayName', 'Actual graph') 
legend show