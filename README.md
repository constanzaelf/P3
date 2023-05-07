PAV - P3: estimación de pitch
=============================

Esta práctica se distribuye a través del repositorio GitHub [Práctica 3](https://github.com/albino-pav/P3).
Siga las instrucciones de la [Práctica 2](https://github.com/albino-pav/P2) para realizar un `fork` de la
misma y distribuir copias locales (*clones*) del mismo a los distintos integrantes del grupo de prácticas.

Recuerde realizar el *pull request* al repositorio original una vez completada la práctica.

Ejercicios básicos
------------------

- Complete el código de los ficheros necesarios para realizar la estimación de pitch usando el programa
  `get_pitch`.

   * Complete el cálculo de la autocorrelación e inserte a continuación el código correspondiente.
   <img width="764" alt="Captura de pantalla 2023-05-03 a las 9 11 44" src="https://user-images.githubusercontent.com/113508290/235852333-39cdb9da-c3e0-4107-8e64-4ef44faa15a9.png">

   

   * Inserte una gŕafica donde, en un *subplot*, se vea con claridad la señal temporal de un segmento de
     unos 30 ms de un fonema sonoro y su periodo de pitch; y, en otro *subplot*, se vea con claridad la
	 autocorrelación de la señal y la posición del primer máximo secundario.

	 NOTA: es más que probable que tenga que usar Python, Octave/MATLAB u otro programa semejante para
	 hacerlo. Se valorará la utilización de la biblioteca matplotlib de Python.

   * Determine el mejor candidato para el periodo de pitch localizando el primer máximo secundario de la
     autocorrelación. Inserte a continuación el código correspondiente.
     
     <img width="578" alt="Captura de pantalla 2023-05-03 a las 9 13 34" src="https://user-images.githubusercontent.com/113508290/235852670-911330d4-3f93-43da-9a1b-a4cb8f653727.png">


   * Implemente la regla de decisión sonoro o sordo e inserte el código correspondiente.
   <img width="703" alt="Captura de pantalla 2023-05-03 a las 9 14 09" src="https://user-images.githubusercontent.com/113508290/235852781-bac7cfe5-4e12-4fde-80f0-aa6b5bef396f.png">


   * Puede serle útil seguir las instrucciones contenidas en el documento adjunto `código.pdf`.

- Una vez completados los puntos anteriores, dispondrá de una primera versión del estimador de pitch. El 
  resto del trabajo consiste, básicamente, en obtener las mejores prestaciones posibles con él.

  * Utilice el programa `wavesurfer` para analizar las condiciones apropiadas para determinar si un
    segmento es sonoro o sordo. 
	
	  - Inserte una gráfica con la estimación de pitch incorporada a `wavesurfer` y, junto a ella, los 
	    principales candidatos para determinar la sonoridad de la voz: el nivel de potencia de la señal
		(r[0]), la autocorrelación normalizada de uno (r1norm = r[1] / r[0]) y el valor de la
		autocorrelación en su máximo secundario (rmaxnorm = r[lag] / r[0]).
		
		![image](https://user-images.githubusercontent.com/113508290/236669627-8f3b48b1-81f9-475b-a2c9-d88c269d65ad.png)


		Puede considerar, también, la conveniencia de usar la tasa de cruces por cero.

	    Recuerde configurar los paneles de datos para que el desplazamiento de ventana sea el adecuado, que
		en esta práctica es de 15 ms.

      - Use el estimador de pitch implementado en el programa `wavesurfer` en una señal de prueba y compare
	    su resultado con el obtenido por la mejor versión de su propio sistema.  Inserte una gráfica
		ilustrativa del resultado de ambos estimadores.
		
		<img width="1293" alt="image" src="https://user-images.githubusercontent.com/113508290/236668122-7a7d813a-07d3-46bc-9823-464042572e20.png">

     
		Aunque puede usar el propio Wavesurfer para obtener la representación, se valorará
	 	el uso de alternativas de mayor calidad (particularmente Python).
  
  * Optimice los parámetros de su sistema de estimación de pitch e inserte una tabla con las tasas de error
    y el *score* TOTAL proporcionados por `pitch_evaluate` en la evaluación de la base de datos 
	`pitch_db/train`..
	
	<img width="438" alt="Captura de pantalla 2023-05-03 a las 9 17 27" src="https://user-images.githubusercontent.com/113508290/235853356-62054e9e-5526-46d5-b648-1b3a7c6f809c.png">


Ejercicios de ampliación
------------------------

- Usando la librería `docopt_cpp`, modifique el fichero `get_pitch.cpp` para incorporar los parámetros del
  estimador a los argumentos de la línea de comandos.
  
  
  Esta técnica le resultará especialmente útil para optimizar los parámetros del estimador. Recuerde que
  una parte importante de la evaluación recaerá en el resultado obtenido en la estimación de pitch en la
  base de datos.

  * Inserte un *pantallazo* en el que se vea el mensaje de ayuda del programa y un ejemplo de utilización
    con los argumentos añadidos.
    
      <img width="896" alt="Captura de pantalla 2023-05-03 a las 9 18 25" src="https://user-images.githubusercontent.com/113508290/235853535-ec6eaecf-98b1-4fc6-909a-2b8835e59976.png">


- Implemente las técnicas que considere oportunas para optimizar las prestaciones del sistema de estimación
  de pitch.

  Entre las posibles mejoras, puede escoger una o más de las siguientes:

  * Técnicas de preprocesado: filtrado paso bajo, diezmado, *center clipping*, etc.

Con el center-clipping recortamos la parte “central” de la señal  según el eje horizontal a partir de un umbral. Con esto pretendemos controlar los niveles máximos de la señal sin distorsionar completamente las partes más altas.
Para definfir el umbral hemos ido probando hasta llegar a 0,0048.

  <img width="461" alt="Captura de pantalla 2023-05-03 a las 9 19 31" src="https://user-images.githubusercontent.com/113508290/235853697-ba17be9e-5b25-4333-855d-ed343b56fc3d.png">

  
  * Técnicas de postprocesado: filtro de mediana, *dynamic time warping*, etc.
  
Para poder corregir posibles valores “disparados” debido a errores de estimación hemos implementado un filtro de mediana de orden 3. Con este filtro al final lo que hacemos es comparar una muestra con sus vecinas para ver si el valor es coherente o no preservando los detalles de la señal.
  
  <img width="502" alt="Captura de pantalla 2023-05-03 a las 9 20 08" src="https://user-images.githubusercontent.com/113508290/235853808-0075831f-3074-4223-91be-25cbe1af6259.png">

  
  * Métodos alternativos a la autocorrelación: procesado cepstral, *average magnitude difference function*
    (AMDF), etc.
  * Optimización **demostrable** de los parámetros que gobiernan el estimador, en concreto, de los que
    gobiernan la decisión sonoro/sordo.
  * Cualquier otra técnica que se le pueda ocurrir o encuentre en la literatura.
  * <img width="399" alt="Captura de pantalla 2023-05-07 a las 10 56 20" src="https://user-images.githubusercontent.com/113508290/236667917-1d1ab3bc-e361-4b5a-a8b0-fc9b9f42a051.png">


  Encontrará más información acerca de estas técnicas en las [Transparencias del Curso](https://atenea.upc.edu/pluginfile.php/2908770/mod_resource/content/3/2b_PS%20Techniques.pdf)
  y en [Spoken Language Processing](https://discovery.upc.edu/iii/encore/record/C__Rb1233593?lang=cat).
  También encontrará más información en los anexos del enunciado de esta práctica.

  Incluya, a continuación, una explicación de las técnicas incorporadas al estimador. Se valorará la
  inclusión de gráficas, tablas, código o cualquier otra cosa que ayude a comprender el trabajo realizado.

  También se valorará la realización de un estudio de los parámetros involucrados. Por ejemplo, si se opta
  por implementar el filtro de mediana, se valorará el análisis de los resultados obtenidos en función de
  la longitud del filtro.
   

Evaluación *ciega* del estimador
-------------------------------

Antes de realizar el *pull request* debe asegurarse de que su repositorio contiene los ficheros necesarios
para compilar los programas correctamente ejecutando `make release`.

Con los ejecutables construidos de esta manera, los profesores de la asignatura procederán a evaluar el
estimador con la parte de test de la base de datos (desconocida para los alumnos). Una parte importante de
la nota de la práctica recaerá en el resultado de esta evaluación.
