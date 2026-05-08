clear; clc;
omega = linspace(-%pi, %pi, 1000);

X = ones(1, length(omega));
for k = 0:3
    X = X + exp(-%i * k * omega);
end
X = exp(-%i * 0 * omega);       // khởi tạo lại
X = 1 + exp(-%i*omega) + exp(-2*%i*omega) + exp(-3*%i*omega);

subplot(2,1,1);
  plot(omega/%pi, abs(X), 'b');
  xlabel('\omega/\pi'); ylabel('|X_2(e^{j\omega})|');
  title('Phổ biên độ  –  x_2(n) = \delta(n)+\delta(n-1)+\delta(n-2)+\delta(n-3)');
  xgrid();

subplot(2,1,2);
  plot(omega/%pi, atan(imag(X), real(X)), 'r');
  xlabel('\omega/\pi'); ylabel('\angle X_2(e^{j\omega})  [rad]');
  title('Phổ pha  –  x_2(n)');
  xgrid();
