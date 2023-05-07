% Ruta del archivo WAV
rutaArchivo = 'prueba.wav';

% Leer el archivo WAV
[y, fs] = audioread(rutaArchivo);

% Obtener la duración del archivo WAV
duracion = length(y) / fs;

% Calcular el tiempo en segundos para cada muestra
t = linspace(0, duracion, length(y));

% Plot del waveform
figure
plot(t, y);

% Configurar el título y etiquetas de los ejes

title('Waveform del archivo WAV');
xlabel('Tiempo (s)');
ylabel('Amplitud');

% Mostrar cuadrícula
grid on;

% Ajustar el eje x para que coincida con la duración del archivo WAV
xlim([0 duracion]);
