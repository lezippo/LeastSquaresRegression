xdata = [0 21.1 37.8 54.4 71.1 87.8 100];
ydata = [1.79 1.13 0.696 0.519 0.338 0.321 0.296];
n = length(xdata);
z = linspace(0,100,1000);
w = 3;

% As indicated in the exercise text, we approximate the data with a cubic polynomial

coeff = myls(xdata, ydata, w);
Z = coeff(4) .* z + coeff(3);
Z = Z .* z + coeff(2);
Z = Z .* z + coeff(1);

errmed = 0;

for i = 1:n
    errmed = abs(ydata(i) - coeff(1) - coeff(2) * xdata(i) - coeff(3) * xdata(i)^2 - coeff(4) * xdata(i)^3) + errmed;
end

errmed = errmed / n;

temp = [10 30 60 90]';
visc = zeros(4,1);
hold on;

for i = 1:4
    visc(i,1) = coeff(4) * temp(i).^3 + coeff(3) * temp(i).^2 + coeff(2) * temp(i) + coeff(1);
end

plot(xdata, ydata, '.', z, Z, 'm', temp, visc, '*k');

disp(table(temp, visc, 'VariableNames', {'Temperature', 'Viscosity'}));
disp('Average Error:');
disp(errmed);

spval = cubicspline(xdata, ydata, z);
plot(z, spval, 'b');
polcoeff = polyfit(xdata, ydata, n-1);
pol = polyval(polcoeff, z);
plot(z, pol, 'k');
legend('Data', 'Least Squares', 'Predictions', 'Spline', 'Interpolating Polynomial');
