/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS 
        ( driverId:int,
          truckId:int,
          eventTime:charArray,
          eventType:charArray,
          longitude:Double,
          latitude:Double,
          eventKey:charArray,
          correlationId:charArray,
          driverName:charArray,
          routeId:int,
          routeName:charArray,
          eventDate:charArray);

data3 = FOREACH data GENERATE driverId,truckId, eventTime; 
limit_data = LIMIT data3 10;
order_by = ORDER limit_data BY driverId ASC, truckId ASC, eventTime ASC;
STORE order_by INTO 'output' USING PigStorage(',');