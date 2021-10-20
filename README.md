# MLControlStock
## Challenge Mercado Libre
Control de Stock realizado por Christian Damián Cristofano

Se realiza el desafio propuesto "Control de Stock" utilizando tecnología .Net Core 3.1 en C# con base de datos Sql Server.
El proyecto esta estructurado en una arquitectura de capas similar a "Clean Architecture" .

En la que el core del negocio se encuentra en el centro de la aplicación,
en la misma se modelan las entidades necesarias, en este caso solo utilizamos una clase Stock que contiene toda la información necesaria para dar solucion a la 
problemática. La misma capa se comparte con los servicios debido al reducido tamaño de la aplicación por lo que no se consideró necesario realizar una capa única para
los servicios.
