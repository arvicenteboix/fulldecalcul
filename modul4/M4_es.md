---
# Front matter
# Metainformació del document
title: Estratègies per a l'ús del full de càlcul
titlepage: true
subtitle: "Funcions especials: BUSCARV(), BUSCARH(), Solver"
author: 
- Alfredo Rafael Vicente Boix
lang: ca
page-background: img/bg.png

# portada
titlepage-rule-height: 2
titlepage-rule-color: AA0000
titlepage-text-color: AA0000
titlepage-background: ../portades/U4.png

# configuració de l'índex
toc-own-page: true
toc-title: Continguts
toc-depth: 2

# capçalera i peu
header-left: \thetitle
header-right: Curs 2023-2024
footer-left: CEFIRE València
footer-right: \thepage/\pageref{LastPage}

# Les figures que apareguen on les definim i centrades
float-placement-figure: H
caption-justification: centering 

# No volem numerar les linies de codi
listings-disable-line-numbers: true

# Configuracions dels paquets de latex
header-includes:

  #  imatges i subfigures
  - \usepackage{graphicx}
  - \usepackage{subfigure}
  - \usepackage{lastpage}



  #  - \usepackage{adjustbox}
  # marca d'aigua
  #- \usepackage{draftwatermark}
 # - \SetWatermarkText{\includegraphics{./img/Markdown.png}}
  #- \SetWatermarkText{Per revisar}
  #- \SetWatermarkScale{.5}
  #- \SetWatermarkAngle{20}
   
  # caixes d'avisos 
  - \usepackage{awesomebox}

  # text en columnes
  - \usepackage{multicol}
  - \setlength{\columnseprule}{1pt}
  - \setlength{\columnsep}{1em}

  # pàgines apaïsades
  - \usepackage{pdflscape}
  
  # per a permetre pandoc dins de blocs Latex
  - \newcommand{\hideFromPandoc}[1]{#1}
  - \hideFromPandoc {
      \let\Begin\begin
      \let\End\end
    }
 
# definició de les caixes d'avis
pandoc-latex-environment:
  noteblock: [note]
  tipblock: [tip]
  warningblock: [warning]
  cautionblock: [caution]
  importantblock: [important]
...


\vspace*{\fill}

![](img/cc.png){ height=50px }
Este document està subjecte a una llicència creative commons que permet la seua difusió i ús comercial reconeixent sempre l'autoria del seu creador. Es troba per a ser modificat al següent repositori de github:
<!-- CANVIAR L'ENLLAÇ -->
[https://github.com/arvicenteboix/fulldecalcul](https://github.com/arvicenteboix/fulldecalcul)
\newpage

# INTRODUCCIÓN

En esta unidad veremos las funciones BUSCARV y BUSCARH, que son funciones para buscar elementos en una matriz dada. Luego echaremos un vistazo a Solver, donde veremos un ejemplo que podremos utilizar para resolver pequeñas ecuaciones.

# BUSCARV y BUSCARH

Se trata de funciones de búsqueda de datos. Estas funciones nos permiten buscar la referencia de un valor dentro de un rango.

```
=BUSCARV( Criterio de búsqueda; matriz_de_búsqueda; Índice; ordenado )
```

## Ejemplo BUSCARV()

Vamos a buscar un valor en la primera columna de un rango, esta nos devuelve un valor en la misma fila desde una columna que especificamos. Por ejemplo:

Supongamos que tenemos una lista de estudiantes con sus calificaciones y queremos buscar la de un estudiante específico. Nuestra tabla es:

| Estudiante | Nota |
|------------|------|
| Anna       | NT   |
| Alfred     | BE   |
| Carla      | EX   |
| David      | SF   |
| Javi       | EX   |

Si queremos buscar la nota del estudiante "Carla", utilizaremos la función **BUSCARV** de la siguiente manera:

```excel
=BUSCARV("Carla"; A2:B6; 2; FALSO())
```

Esta fórmula significa:

- **"Carla"**: Es el valor que queremos buscar.
- **A2:B6**: Es el rango donde queremos buscar. "Carla" debe encontrarse en la primera columna de este rango. Esta parte es muy importante.
- **2**: Es el número de columna del rango desde donde queremos recuperar el valor. En este caso, 2 porque la nota está en la segunda columna. Si pusiéramos 1, nos devolvería "Carla", ya que es el valor que ha buscado.
- **FALSO()**: Indica que queremos una coincidencia exacta. Si pusiéramos VERDADERO(), podríamos poner por ejemplo Carlota y buscaría una semejanza con lo que estamos buscando.

Cuando introducimos esta fórmula, Excel buscará "Carla" en la primera columna del rango A2:B6 y devolverá el valor de la segunda columna, que es la nota, y en este caso sería **EX**.

En el siguiente ejemplo:

| Estudiante | Nota | Nota2 |
|------------|------|-------|
| Anna       | NT   |  NT   |
| Alfred     | BE   |  NT   |
| Carla      | EX   |  SF   |
| David      | SF   |  BE   |
| Javi       | EX   |  IN   |

Si escribiéramos la siguiente fórmula:

```excel
=BUSCARV("Carla"; A2:B6; 3; FALSO())
```

Nos daría el valor SF, ya que es el valor de la columna 3.

## Ejemplo BUSCARH()

La función **BUSCARH** es similar a **BUSCARV**, pero en lugar de buscar verticalmente en una columna, **BUSCARH** busca horizontalmente en una fila. Es útil cuando la información que queremos encontrar está organizada en filas en lugar de columnas.

Imagina que tenemos una tabla con los días de la semana y las temperaturas máximas que se han registrado. Queremos encontrar la temperatura máxima de un día específico. Nuestra tabla podría ser así:

| Día       | Lunes | Martes | Miércoles | Jueves | Viernes | Sábado | Domingo |
|-----------|-------|--------|-----------|--------|---------|--------|---------|
| Temp. Máx | 22    | 24     | 19        | 21     | 23      | 25     | 20      |

Si queremos buscar la temperatura máxima del **Jueves**, utilizaremos la función **BUSCARH** de la siguiente manera:

```excel
=BUSCARH("Jueves"; A1:H2; 2; falso())
```

Esta fórmula significa:

- **"Jueves"**: Es el valor que queremos buscar.
- **A1:H2**: Es el rango donde queremos buscar. "Jueves" debe encontrarse en la primera fila de este rango.
- **2**: Es el número de fila del rango desde donde queremos recuperar el valor. En este caso, 2 porque la temperatura está en la segunda fila.
- **FALSO()**: Indica que queremos una coincidencia exacta.





Cuando introducimos esta fórmula, la hoja de cálculo buscará "Jueves" en la primera fila del rango A1:H2 y devolverá el valor de la segunda fila, que es la temperatura máxima, y en este caso sería **21**.

# Solver

Para explicar esta herramienta siempre se parte de un ejemplo que pueda ser más o menos claro, imagina que tienes una caja llena de golosinas de diferentes colores y quieres repartirlas entre tus amigos de la manera más justa posible, pero también quieres quedarte con la mayor cantidad de golosinas verdes, que son tus favoritas. Así es como funciona el Solver.

**Solver** es una herramienta que existe, tanto para Excel como para Libreoffice, que nos ayuda a encontrar la mejor solución a un problema, como repartir las golosinas. Nos permite decirle a la hoja de cálculo qué queremos maximizar o minimizar (como las golosinas verdes) y cuáles son las reglas que no podemos romper (como no dar más de 10 golosinas a cada amigo).

:::note
Si quieres saber más, Solver es una herramienta de programación matemática lineal. Hay mucha información al respecto y se utiliza en entornos empresariales para temas de producción.[^1]
:::

[^1]: [https://es.wikipedia.org/wiki/Programaci%C3%B3n_lineal](https://es.wikipedia.org/wiki/Programaci%C3%B3n_lineal)

Para usar el Solver, primero debemos tener claro tres cosas:

1. **¿Qué queremos lograr?** Esto es nuestra **meta** u **objetivo**. Puede ser maximizar algo, como los beneficios, o minimizar, como el costo.

2. **¿Qué podemos cambiar?** Estas son nuestras **variables**. Son las cosas que podemos ajustar para intentar alcanzar nuestra meta. Como, por ejemplo, cuántas golosinas de cada color damos a nuestros amigos.

3. **¿Cuáles son las reglas?** Estas son las **restricciones**. Son las normas que no podemos pasar por alto. Como, por ejemplo, no podemos dar más golosinas de las que tenemos en la caja.

Cuando tenemos todo esto claro, configuramos Solver y él "juega" con las variables dentro de las reglas hasta encontrar la mejor manera de alcanzar el objetivo, aunque a veces nos da valores aproximados. Es como un juego de rompecabezas donde Excel prueba diferentes combinaciones hasta encontrar la que mejor funciona.

Y así es como el Solver nos puede ayudar a tomar decisiones y resolver problemas de manera fácil y sencilla. Pero veamos algún ejemplo.

# Ejemplo 1

Tenemos dos tipos de productos: camisas y pantalones. Cada camisa nos da un beneficio de 15€ y cada pantalón de 20€. Pero tenemos algunas restricciones:

- Solo podemos fabricar un máximo de 100 unidades entre camisas y pantalones a la semana debido a la capacidad de producción.
- Por cuestiones de demanda del mercado, debemos fabricar al menos 10 camisas y 10 pantalones cada semana.
- El costo de fabricación por unidad es de 8€ para las camisas y de 10€ para los pantalones, y no queremos superar un costo total de 1200€ a la semana.

Con estos datos, podemos configurar nuestro modelo en Excel de la siguiente manera:

1. **Variables de decisión**:
  - **Celda B2**: Número de camisas a fabricar.
  - **Celda B3**: Número de pantalones a fabricar.

2. **Función objetivo**:
  - **Celda B4**: Beneficio total. La fórmula sería `=15*B2 + 20*B3`.

3. **Restricciones**:
  - **Celda B5**: Total de unidades fabricadas. La fórmula sería `=B2 + B3`, y este valor debe ser menor o igual a 100.
  - **Celda B6**: Costo total de fabricación. La fórmula sería `=8*B2 + 10*B3`, y este valor debe ser menor o igual a 1200€.
  - **Celda B2** debe ser mayor o igual a 10.
  - **Celda B3** debe ser mayor o igual a 10.

Ahora, abrimos la herramienta Solver y configuramos los siguientes parámetros:

- **Establecer objetivo**: Celda B4.
- **Para maximizar**: Seleccionamos 'Max'.
- **Variables de cambio**: Celdas B2 y B3.
- **Agregar restricciones**:
  - B5 <= 100
  - B6 <= 1200
  - B2 >= 10
  - B3 >= 10

Una vez que todo está configurado, hacemos clic en 'Resolver' y Solver encontrará la combinación óptima de camisas y pantalones a fabricar para maximizar los beneficios sin superar las restricciones establecidas.

# SUMAR.SI

Otra de las fórmulas que resultan interesantes y que vamos a introducir, es la de sumar dados unas condiciones. Es muy similar a BUSCARV(), ya que busca unos valores y suma todos los valores que coinciden con ese criterio. Imaginemos que tenemos una serie de gastos con diferentes conceptos.

|  Concepto | Gasto |
| ----- | -- |
| 	Alquiler de las instalaciones 	 | 		 | 
| 	Alquiler Furgoneta coche gasoil 	 | 		 | 
| 	Alquiler Autobús 	 | 		 | 
| 	Camisetas y sudaderas 	 | 		 | 
| 	Excursión	 | 		 | 
| 	Actividades y material común	 | 		 | 
| 	Manutención	 | 		 | 
| 	Farmacia	 | 		 | 
| 	Marcha	 | 		 | 
| 	Imprevistos y cena	 | 		 | 

Por otro lado, tenemos una hoja llamada facturas donde vamos apuntando todos los gastos:

[Hoja de facturas](img/1.png)

En PARTIDA podemos tener las celdas validadas para que nos asigne ese movimiento a una partida específica:

[Hoja de facturas](img/2.png)

Lo que nos permite SUMAR.SI es buscar todas las partidas asignadas a un concepto específico y sumarlas. El esquema de la función sería:

```excel
=SUMAR.SI(Intervalo;Criterio_búsqueda;Intervalo_suma)
```

De manera que, en nuestro caso, podríamos nombrar a los intervalos de la siguiente manera:

[Rangos](img/3.png)

:::tip
Fíjate que tomamos toda la columna D:D y E:E, esto no nos importa ya que las filas anteriores y posteriores no nos molestan, por lo que podemos agregar líneas a facturas y no necesitamos tener en cuenta si tenemos que cambiar el rango.
:::

Así podríamos tener una fórmula del tipo:

```excel
=SUMAR.SI(Facturas.D:D;I9;Facturas.E:E)
```

O mejor:

```excel
=SUMAR.SI(PARTIDES;I9;IMPORTS)
```

Donde I9 correspondería a la celda donde tenemos nuestro concepto, de manera que tendríamos un resultado similar a este:

[Conceptos sumados](img/4.png)

# Caso práctico 

En este punto, os planteamos la tarea que os vamos a pedir. Vamos a imaginar que hemos organizado una salida con nuestros alumnos a un paraje natural y vamos a pasar una semana allí. Hemos decidido prepararnos una hoja de cálculo para no tener que pensar demasiado e ir anotando los gastos que vamos teniendo en una hoja llamada presupuesto. 

Nuestra hoja sería similar a esta:

[Hoja de cálculo](img/5.png)

:::caution
Los valores que tenemos aquí son totalmente inventados. Tenemos un presupuesto con unos ingresos ya realizados.
:::

Las cuestiones que plantearíamos serían:

* ¿Cuál sería el menor número de personas que necesitaríamos para hacer viable esta salida?
* Llevar un control continuo de los gastos.

## Formato condicional

En este punto vamos a añadirnos un formato condicional. Hemos creado unas celdas para que nos indique si nos pasamos de la cantidad de personas que cabemos.

[Cantidad de personas](img/9.png)

Nos crearíamos un formato condicional:

[Formato condicional](img/6.png)

Tenemos que crear un estilo nuevo:

[Estilo](img/7.png)

Resultado:

[Formato creado](img/8.png)

## Solver

Vamos a hacer uso de Solver para saber cuál sería el mínimo número de personas que necesitaríamos para hacer rentable la salida. Iríamos a Herramientas > Solver, y rellenamos las celdas de la siguiente manera:

[Solver](img/10.png)

Si intentamos buscar una solución nos dice que no hay solución posible:

[Solución](img/11.png)

Ahora, se nos plantean varias posibilidades. Podríamos contratar otro autobús (o coche, etc...), o podemos subir el precio, que es la opción que hemos buscado. Planteamos 225 €.

[Solución](img/12.png)

:::warning
Con el solver también podríamos plantear que modificara el precio de la salida dado un número de alumnos.
::

:::caution
"Estancamiento", significa que ha llegado un punto donde no es capaz de encontrar una solución mejor que la ofrecida.
:::

Le decimos que queremos "Mantener la solución" y tendríamos un resultado de la siguiente manera:

[Tabla resultante](img/13.png)

:::note
Obviamente hay que cambiar el valor de 90,4 alumnos a un número entero, en este caso pondríamos 91.
:::

## SUMAR.SI

En este punto querríamos que el valor de los gastos fuera sumándose al gasto real, además nos añadiríamos otra celda donde pondríamos el grado de cumplimiento del gasto, más que nada para ver que no pasa del 100% (hemos añadido también el formato condicional a estas celdas):

[Tabla gastos](img/14.png)

:::note
Hemos definido los rangos IMPORTS y PARTIDES, en la hoja Facturas.
:::

De esta manera ahora podríamos aplicar la fórmula:

```excel
=SUMAR.SI(PARTIDES;I9;IMPORTS)
```
Finalmente podríamos ver nuestra tabla de la siguiente manera:

[Tabla gastos](img/15.png)