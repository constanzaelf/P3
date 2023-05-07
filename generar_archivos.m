% Ruta del archivo de entrada
rutaArchivoEntrada = 'pruebawav_termi.txt';

% Nombres de los archivos de salida para cada columna
nombreArchivoColumna1 = 'potencia_pw.txt';
nombreArchivoColumna2 = 'r1r0.txt';
nombreArchivoColumna3 = 'rlagr0.txt';

% Leer el archivo de entrada
datos = dlmread(rutaArchivoEntrada);

% Separar las columnas
columna1 = datos(:, 1);
columna2 = datos(:, 2);
columna3 = datos(:, 3);

% Guardar las columnas en archivos de texto separados
dlmwrite(nombreArchivoColumna1, columna1, ' ');
dlmwrite(nombreArchivoColumna2, columna2, ' ');
dlmwrite(nombreArchivoColumna3, columna3, ' ');
