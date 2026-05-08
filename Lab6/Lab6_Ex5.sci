clear; clc;
omega = linspace(-%pi, %pi, 1000);

H = 1 + exp(-%i*omega);
X = 1 ./ (1 - 0.5*exp(-%i*omega));
Y = H .* X;

subplot(2,1,1);
  plot(omega/%pi, abs(Y), 'b');
  xlabel('\omega/\pi'); ylabel('|Y(e^{j\omega})|');
  title('Phổ biên độ  –  y(n) = 0.5^n u(n) + 0.5^{n-1} u(n-1)');
  xgrid();

subplot(2,1,2);
  plot(omega/%pi, atan(imag(Y), real(Y)), 'r');
  xlabel('\omega/\pi'); ylabel('\angle Y(e^{j\omega})  [rad]');
  title('Phổ pha  –  tín hiệu ra y(n)');
  xgrid();
