figure()
linS = {'-', '--', ':'};
timesteps = [5000, 10000, 80000];
lgnd1 = {};
lgnd2 = {};

for i = 1:length(timesteps)
    [xvals, x1, x2] = myfun (timesteps(i));
    subplot(2, 1, 1)
    plot (xvals, x1, linS{i})
    hold on
    subplot (2, 1, 2)
    plot (xvals, x2, linS{i})
    hold on
    lgnd1{i} = strcat('Timesteps = ', num2str(timesteps(i)));
    lgnd2{i} = strcat('Timesteps = ', num2str(timesteps(i)));
end

subplot(2, 1, 1)
title ('Horizontal displacements of first mass')
xlabel ('time')
ylabel ('displacement')
legend (lgnd1)
hold on
subplot (2, 1, 2)
title ('Horizontal displacements of second mass')
xlabel ('time')
ylabel ('displacement')
legend(lgnd2)
hold on

function [xvals, x1, x2] = myfun (N)
    dt = 10/N;
    xvals = 0:dt:10;
    num1 = (-4.66*2/0.0917);
    num2 = 4.66/0.0917;
    num3 = 4.66/0.0765;
    num4 = -1*num3;
    state_matrix = [0, 1, 0, 0; num1, 0, num2, 0; 0, 0, 0, 1; num3, 0, num4, 0];
    current = [100; 0; 50; 0];
    x1 = zeros(1, N+1);
    x2 = zeros(1, N+1);
    x1(1) = current(1);
    x2(1) = current(3);
   
    for i = 1:N
        current = current + dt*(state_matrix*current);
        x1 (i+1)  = current(1);
        x2 (i+1) = current(3);
    end
end