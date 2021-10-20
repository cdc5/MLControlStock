# MLControlStock
## Challenge Mercado Libre
Control de Stock realizado por Christian Damián Cristofano

Se realiza el desafio propuesto "Control de Stock" utilizando tecnología .Net Core 3.1 en C# con base de datos Sql Server.
El proyecto esta estructurado en una arquitectura de capas similar a "Clean Architecture".

![Arquitectura_Capas](https://user-images.githubusercontent.com/15236085/138007524-a5a868b1-ab3f-46ac-be01-6d81c191c8aa.jpg)

En la que el **Core del negocio (MLControlStock.Core)** se encuentra en el centro de la aplicación, en la misma se modelan las entidades necesarias, en este caso solo utilizamos una clase "Stock" que contiene toda la información para dar solucion a la problemática. La misma capa se comparte con los servicios debido al reducido tamaño de la aplicación por lo que no se consideró necesario realizar una capa única para los mismos. 

Alrededor del Core implementamos las capas:
  - **infraestructura (MLControlStock.Infrastructure)**: Se encarga de la conexión a la base de datos y al consumo de la API Rest de Mercado Libre para la consulta respecto al almacenamiento de los productos en los depósitos de ML.
  - **API (MLControlStock.Api)**: Es el contacto con el mundo exterior y la capa contra la cual impactan las solicitudes REST y devuelve los recursos solicitados. Es la capa donde se alojan lso controladores.
  - **Testing (MLControlStock.UnitTests)**: Se encarga de las pruebas unitarias del proyecto, se decidió realizar las pruebas sobre los controladores para realizar una muestra como testeo general del proyecto completo.

## Instalación y uso:

* El proyecto esta realizado en .Net Core 3.1 por lo que es necesaria la instalación del paquete de .Net Core correspondiente.
* Para la creación de la base de datos se provee un Script en la carpeta MLControlStock\MlControlStock.Infrastructure\Data\Scripts\ llamado ScriptBD_MLControlStock_inicial.sql que se encarga de crear la base "MLControlStock", generar su estructura e insertar algunos datos para pruebas.
* Se debe modificar la cadena de conexión correspondiente al atributo xml "ConnectionStrings" ubicada en el archivo appsettings.json dentro del proyecto MLControlStock.Api por el nombre del servidor en donde se instale el motor de base de datos Sql Server, reemplazar <Nombre_Servidor>
# Ejemplo

    -"ConnectionStrings": { "MLControlStock": "Server=<Nombre_servidor>;Database=MLControlStock;Integrated Security = true" }
  
  Reemplazar por:
  
    -"ConnectionStrings": { "MLControlStock": "Server=SERVER1;Database=MLControlStock;Integrated Security = true" }

## Estructura Base de Datos

La base de datos cuenta con una sola Tabla **"stock"** que almacena todas ubicaciones para los productos. Se utiliza una clave primaria compuesta conforomada por:
- **deposito**: alfanumérica 4 caracteres
- **area**: alfanumérica 2 caracteres
- **pasillo**: alfanumérica 2 caracteres
- **fila**: alfanumérica 2 caracteres
- **cara**: alfanumérica 2 caracteres
- **product_id**: alfanumérica 50 caracteres

Items correspondientes al formato requerido por el ejercicio para identificar la ubicacion (Deposito + ubicación) de cada producto y el identificador correspondiente al propio producto.

Se supone que los productos se almacenan en cantidades enteras por lo que se utiliza el campo "**cantidad**" de tipo entero para almacenar las cantidades de cada producto .

![imagen](https://user-images.githubusercontent.com/15236085/138010428-459a7256-8e86-49ae-9115-eda62ba8f45b.png)

Al no existir restricciones de performance en el ejercicio no se consideró la posibilidad de utilizar identificadores únicos o de clave substituta, o de tipo entero para modelar las tablas de la base de datos.


   
