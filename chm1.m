clear all
close all
%% исходный сигнал
file = fopen('24.txt')
[Signal, N] = fscanf(file,'%f')
fclose(file);
figure(1);
plot(1:N, Signal)
%% вычисление спектра сигнала
Spectrum = fftshift(fft(fftshift(-Signal)))/N;
N2 = -N/2:1:N/2 - 1;
% построение графика спектральной плотности мощности
figure(2);
semilogy(N2, abs(Spectrum).^2, '-o', 'LineWidth', 1.5)
title('Спектральная плотность мощности сигнала')
xlabel('номер гармоники')
%% восстановление сигнала по спектру
Signal_reconstructed = fftshift(ifft(fftshift(-Spectrum)))*N;
%% сравнение исходного сигнала и сигнала, восстановленного по спектру
figure(3);
subplot(2, 1, 1)
plot(1:N, Signal,'-o', 'LineWidth', 1.5)
title('Исходный сигнал')
subplot(2, 1, 2)
plot(1:N, Signal_reconstructed, '-o', 'LineWidth', 1.5);
title('Сигнал, восстановленный по спектру')
