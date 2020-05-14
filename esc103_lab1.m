%Part 1:
xvals = 10:100;
yvals = arrayfun (@(z) approximation(z), xvals);
errors = abs(14/3 - yvals);
error_bounds = 27/96*(xvals.*xvals).^-1;

figure;

subplot(2, 1, 1)
plot (xvals, yvals, 'b');
yline (14/3, '--g')
title ('Numerical Approximation of Given Definite Integral');
xlabel ('Number of subintervals');
ylabel ('Approximation');
legend ('Approximated value', 'Exact value')

subplot (2, 1, 2)
plot (xvals, errors, 'b')
hold on;
plot (xvals, error_bounds, 'g')
title ('Error Analysis');
xlabel ('Number of subintervals');
ylabel ('Error');
legend ('Actual Error', 'Error Bound')

function area = approximation (n)
    x0vals = 0:3/n:3-3/n;
    x1vals = x0vals+3/n;
    midpoint_vals = (x0vals + x1vals)/2;
    area = 3/n * sum (sqrt(midpoint_vals+1));
end


