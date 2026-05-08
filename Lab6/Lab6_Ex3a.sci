clear; clc;

omega = linspace(-%pi, %pi, 1000);

a = 0.1;
X = 1 ./ (1 - a * exp(-%i * omega));

amplitude = abs(X);
phase     = atan(imag(X), real(X));

clf;
subplot(2, 1, 1);
    plot(omega / %pi, amplitude, 'b');
    xlabel('ω / π');
    ylabel('|X(e^{jω})|');
    title('Amplitude Spectrum  –  x₁(n) = 0.1ⁿ u(n)');
    xgrid();

subplot(2, 1, 2);
    plot(omega / %pi, phase, 'r');
    xlabel('ω / π');
    ylabel('∠X(e^{jω})  [rad]');
    title('Phase Spectrum  –  x₁(n) = 0.1ⁿ u(n)');
    xgrid();
