clear; clc;
omega = linspace(-%pi, %pi, 1000);

H = 1 ./ (1 + 0.1*exp(-%i*omega) + 0.2*exp(-2*%i*omega));

subplot(2,1,1);
  plot(omega/%pi, abs(H), 'b');
  xlabel('\omega/\pi'); ylabel('|H(e^{j\omega})|');
  title('Phổ biên độ  –  hệ thống LTI');
  xgrid();

subplot(2,1,2);
  plot(omega/%pi, atan(imag(H), real(H)), 'r');
  xlabel('\omega/\pi'); ylabel('\angle H(e^{j\omega})  [rad]');
  title('Phổ pha  –  hệ thống LTI');
  xgrid();
