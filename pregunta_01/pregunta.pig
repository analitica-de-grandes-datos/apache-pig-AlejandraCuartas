/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data = LOAD './data.tsv' AS (letter:chararray, date:chararray, amount:int);
A = GROUP Data BY letter;
B = FOREACH A GENERATE group, COUNT(Data);

STORE B INTO 'output/' using PigStorage(',');