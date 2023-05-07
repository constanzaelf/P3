
filename = 'voz_x.txt';
data = dlmread(filename);

filename2 = 'voz_r.txt';
data_autocorr = dlmread(filename2);

rutaArchivo = 'prueba.wav';
[y, fn] = audioread(rutaArchivo);
duracion = length(y) / fn;
temps = linspace(0, duracion, length(y));


fs = 20000;
t = ((0:length(data)-1)/fs)*1000;

subplot(3,1,1);
plot(temps, y);
xlabel('Tiempo');
ylabel('Amplitud');
title('Waveform de la señal');
xlim([0 duracion]);


subplot(3,1,2);
plot(t, data);
xlabel('Tiempo');
ylabel('Amplitud');
title('Senyal sonoro recortado');


[r, aut] = xcorr(data);


aut=0:length(data_autocorr)-1;

% Grafico autoc
subplot(3,1,3);
plot(aut, data_autocorr);
xlabel('Muestras');
ylabel('Autocorrelación');
title('Autocorrelación');





