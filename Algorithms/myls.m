function coeff=myls(xdata,ydata,w)
% Purpose: determine the coefficients of the least squares polynomial
% approximation to the data
%
% Syntax: coeff=myls(xdata,ydata,w)
% Input:
% xdata:   vector containing the abscissas of the points to approximate
% ydata:   vector containing the ordinates of the points to approximate
% w:       degree of the polynomial used to approximate the data
% Output:
% coeff:   vector containing the coefficients of the polynomial that
%          least squares approximates the input data
%
% Example:
% xdata=[0 1.525 3.050 4.575 6.10 7.625 9.15];
% ydata=[1 0.8617 0.7385 0.6292 0.5328 0.4481 0.3741];
% m=2;
% coeff=myls(xdata,ydata,m);
%
% Author: Luigi Emanuele Zippo


n=length(xdata)-1;
B=ones(n+1,w+1);

for i=1:(n+1)

    for j=2:(w+1)

        B(i,j)=xdata(i)^(j-1);

    end

end

A=B'*B;

b=zeros(w+1,1);

b(1,1)=sum(ydata);

for i=2:(w+1)

    for j=1:(n+1)

        b(i)=xdata(j).^(i-1)*ydata(j)+b(i);

    end

end

coeff=A\b;

end
