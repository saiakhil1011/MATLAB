%Simulation of Vanderpol equation by reducing it in two first order
%equations

function vanderpol_sim()
    t_range = [0, 1000];
    y0 = [1; 0];

    mu = 0.1;
    ode = @(t,y) vanderpol(t,y,mu);
    [t1,y_mu1] = ode45(ode, t_range, y0);

    mu = 1;
    ode = @(t,y) vanderpol(t,y,mu);
    [t2,y_mu2] = ode45(ode, t_range, y0);

    mu = 100;
    ode = @(t,y) vanderpol(t,y,mu);
    [t3,y_mu3] = ode15s(ode, t_range, y0);

    figure(1)
    subplot(2,2,1)
    plot(t1,y_mu1(:,1))
    title('van der Pol Equation, \mu = 0.1')
    subplot(2,2,2)
    plot(t2,y_mu2(:,1))
    title('van der Pol Equation, \mu = 1')
    subplot(2,2,3)
    plot(t3,y_mu3(:,1))
    title('van der Pol Equation, \mu = 100')

    figure(2)
    subplot(2,2,1)
    plot(y_mu1(:,1), y_mu1(:,2), 'color', [0,0.4470,0.7410])
    title('Phase plane plot, \mu = 0.1')
    subplot(2,2,2)
    plot(y_mu2(:,1), y_mu2(:,2), 'color', [0.8500,0.3250,0.0980])
    title('Phase plane plot, \mu = 1')
    subplot(2,2,3)
    plot(y_mu3(:,1), y_mu3(:,2), 'color', [0.9290,0.6940,0.1250])
    title('Phase plane plot, \mu = 100')
end

%Function to convert vanderpol equation to first order equations
function dydt = vanderpol(t,y,mu)
    dydt = [y(2)/mu; (1-y(1)^2)*y(2)-y(1)/mu];
end
