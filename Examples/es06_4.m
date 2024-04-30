xdata = [0 4 8 12 16 20];
ydata = [67.38 74.67 82.74 91.69 101.60 112.58];
n = length(xdata);
z = linspace(0,20,100);

hold on;

errmed = zeros(3,1);
Z35 = errmed;

% Linear model
w = 1;
coeff = myls(xdata, ydata, w);
Z = coeff(1) + coeff(2) * z;
plot(xdata, ydata, '*k', z, Z, 'm');

for i = 1:n
    errmed(1,1) = abs(ydata(i) - coeff(1) - coeff(2) * xdata(i)) + errmed(1,1);
end

% Quadratic model
w = 2;
coeff = myls(xdata, ydata, w);
Z = coeff(3) .* z + coeff(2);
Z = Z .* z + coeff(1);
plot(z, Z, 'b');

for i = 1:n
    errmed(2,1) = abs(ydata(i) - coeff(1) - coeff(2) * xdata(i) - coeff(3) * xdata(i)^2) + errmed(2,1);
end

% Exponential model
w = 1;
ydata2 = log(ydata);
coeff = myls(xdata, ydata2, w);
alfa = exp(coeff(1));
beta = coeff(2);
Z = alfa * exp(beta .* z);
plot(z, Z);

for i = 1:n
    errmed(3,1) = abs(ydata(i) - alfa * exp(beta .* xdata(i))) + errmed(3,1);
end

errmed = errmed / n;

table(errmed, 'VariableNames', {'Mean Error'}, 'RowNames', {'Linear', 'Quadratic', 'Exponential'});

% As we can see from the mean error, the exponential model is the most accurate one

spval = cubicspline(xdata, ydata, z);
plot(z, spval);
polcoeff = polyfit(xdata, ydata, n-1);
pol = polyval(polcoeff, z);
plot(z, pol);
