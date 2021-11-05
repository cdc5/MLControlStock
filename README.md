# MLControlStock
## Challenge Mercado Libre
Control de Stock realizado por Christian Damián Cristofano

Se realiza el desafio propuesto "Control de Stock" utilizando tecnología .Net Core 3.1 en C# con base de datos Sql Server y el ORM Entity Framework.
El proyecto esta estructurado en una arquitectura de capas similar a "Clean Architecture".

![Arquitectura_Capas](https://user-images.githubusercontent.com/15236085/138007524-a5a868b1-ab3f-46ac-be01-6d81c191c8aa.jpg)

En la que el **Core del negocio (MLControlStock.Core)** se encuentra en el centro de la aplicación, en la misma se modelan las entidades necesarias, en este caso solo utilizamos una clase "Stock" que contiene toda la información para dar solucion a la problemática. La misma capa se comparte con los servicios debido al reducido tamaño de la aplicación por lo que no se consideró necesario realizar una capa única para los mismos. 

Alrededor del Core implementamos las capas:
  - **infraestructura (MLControlStock.Infrastructure)**: Se encarga de la conexión a la base de datos y al consumo de la API Rest de Mercado Libre para la consulta respecto al almacenamiento de los productos en los depósitos de ML.
  - **API (MLControlStock.Api)**: Es el contacto con el mundo exterior y la capa contra la cual impactan las solicitudes REST y devuelve los recursos solicitados. Es la capa donde se alojan los controladores.
  - **Testing (MLControlStock.UnitTests)**: Se encarga de las pruebas unitarias del proyecto.

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

## API

EL proyecto resuelve el problema planteado exponiendo 4 endpoints REST (+1 endpoint extra (GET/api/Stock/GetStockPorProductoSP) que cumple igual función (que GET/api/Stock/{deposito}/{product_id}) pero con distinta implementación):

- **GET/api/stock:** Expone un endpoint de lectura. Se nos indica un depósito y una ubicación, y este lista los productos y cantidad que hay en el mismo
- **GET/api/Stock/{deposito}/{product_id}:** Expone un endpoint de búsqueda. Se nos indica el depósito y producto, y este nos devuelve las posibles ubicaciones y cantidad en las mismas
- **GET/api/Stock/GetStockPorProductoSP:** Este Endpoint realiza lo mismo que el endpoint GET/api/Stock/{deposito}/{product_id} pero su implementación es distinta, funciona mediante un llamado a Stored Procedure, se realizo para mostrar como se puede cambiar un método para hacerlo más performante por ejemplo
- **POST /api/Stock:** Expone un endpoint REST para agregar productos en una ubicación. Cumple con todas las validaciones solicitadas por el ejercicio
      a. Se nos indicará el Depósito, producto, cantidad y ubicación donde quiere colocar.
      b. Validar que la dirección tenga el patrón correcto.
      c. Que el producto/item sea almacenado en nuestros depósitos.
      d. No se pueden colocar más de 3 productos distintos en una ubicación.
      e. La suma de las cantidades de los productos que hubiera en una ubicación no puede ser mayor a 100 unidades
  **En caso de existir un producto en la ubicación proporcionada el Endpoint adicionará la cantidad proporcionada siempre y cuando no se rompan las restricciones**
- **DELETE/Api/Stock:** Expone un endpoint para poder retirar productos de una ubicación. Se nos indicará el depósito, producto, cantidad y ubicación de donde sacarla.
  **Si la cantidad proporcionada es mayor a la existente se informa el error. Si la cantidad proporcionada es igual a la cantidad existente se elimina al producto de la base de datos y se devuelve el objeto con cantidad igual a 0 en la respuesta del endpoint.**

* **GET/api/stock **
  - Ejemplo: https://localhost:44379/Api/Stock?Deposito=AR01&Ubicacion=AL-01-05-DE
  - Recibe dos parámetros requeridos por query string:
    - deposito: string
    - ubicacion: string
  - Retorna
    -"data": [
        {
            "productId": "MLA864423456",
            "cantidad": 7
        }
    ]
   
  * **GET/api/Stock/{deposito}/{product_id}**
  - Ejemplo: https://localhost:44379/Api/Stock/AR01/MLA813727183
  - Recibe dos parámetros requeridos, pero en este caso se pasan por url
    - deposito: string
    - producto: string
  - Retorna
    -"data": [
        {
            "deposito": "AR01",
            "ubicacion": "AL-39-78-DE",
            "cantidad": 22
        },
        {
            "deposito": "AR01",
            "ubicacion": "AL-39-78-IZ",
            "cantidad": 87
        },
        {
            "deposito": "AR01",
            "ubicacion": "LM-00-00-IZ",
            "cantidad": 50
        },
        {
            "deposito": "AR01",
            "ubicacion": "LM-09-08-DE",
            "cantidad": 51
        }
    ]
    
  * **GET/api/Stock/GetStockPorProductoSP**
  - Ejemplo: https://localhost:44379/Api/Stock/GetStockPorProductoSP?Deposito=AR01&Producto=MLA813727183
  - Recibe dos parámetros requeridos por query param
    - deposito: string
    - producto: string
  - Retorna
    -"data": [
        {
            "deposito": "AR01",
            "ubicacion": "AL-39-78-DE",
            "cantidad": 22
        },
        {
            "deposito": "AR01",
            "ubicacion": "AL-39-78-IZ",
            "cantidad": 87
        },
        {
            "deposito": "AR01",
            "ubicacion": "LM-00-00-IZ",
            "cantidad": 50
        },
        {
            "deposito": "AR01",
            "ubicacion": "LM-09-08-DE",
            "cantidad": 51
        }
    ]
    
  * **POST/api/Stock**
  - Ejemplo: https://localhost:44379/Api/Stock?deposito=AR01&ubicacion=LM-09-08-DE&producto=MLA813727183&cantidad=51
  - Recibe cuatro parámetros requeridos por query param
    - deposito: string
    - ubicacion:string
    - producto: string
    - cantidad:int
  - Retorna
    -"data": {
        "deposito": "AR01",
        "area": "LM",
        "pasillo": "09",
        "fila": "08",
        "cara": "DE",
        "productId": "MLA813727183",
        "cantidad": 10
    }
    
  * **DELETE/api/Stock**
  - Ejemplo: https://localhost:44379/Api/Stock?deposito=AR01&ubicacion=LM-09-08-DE&producto=MLA813727183&cantidad=3
  - Recibe cuatro parámetros requeridos por query param
    - deposito: string
    - ubicacion:string
    - producto: string
    - cantidad:int
  - Retorna
    -"data": {
        "deposito": "AR01",
        "area": "LM",
        "pasillo": "09",
        "fila": "08",
        "cara": "DE",
        "productId": "MLA813727183",
        "cantidad": 0
    }
   
Los endpoints devuelven una estructura de respuesta similar, un objeto data que contiene una lista de elementos retornados para los endpoints que devuelven listas y un objeto data que contiene un único objeto para el caso de los endpoints que devuelven una sola entidad.

# Consumo Api Mercado Libre
Para consumir la Api de ML, se utilizó la clase HttpClient instanciada mediante un patrón Factory y la utilización de Inyección de depdendencias. Se llama a la url correspondiente https://api.mercadolibre.com/items/MLA813727183#XML y se obtiene el atributo shipping.logictic_type, para compararlo contra el valor "fullfilment" requerido. De esta manera sabemos que productos se encuentran en los depósitos de ML.

## Testing
El proyecto MLControlStock.UnitTests es el encargado de llevar a cabo las pruebas unitarias,  utilizó la libreria xUnit, para simplificar el proceso de testing. 
La clase **StockControllerTest** es donde se encuentran todas las pruebas unitarias realizadas y se encarga de testear a la clase **StockController**. Se crearon clases mock para simular el comportamiento de las clases reales:
- ApiClientMock: simula el llamado a la Api de ML para conseguir los productos existentes en depósito:
- StockRepositoryMock y UnitOfWorkMock: simulan el comportamiento del accesso a la BD.

![imagen](https://user-images.githubusercontent.com/15236085/138016442-5f51601b-686a-4c12-b16a-09e18f17a9b4.png)

## Documentación con Swagger
 
Al iniciar el proyecto, se abrirá en el explorador web la pagina de inicio (index.html) de Swagger brindando la documentación correspondiente a las solicitudes de los endpoints.

![imagen](https://user-images.githubusercontent.com/15236085/138015636-09b262dc-400d-4afb-846d-cac0c70c7452.png)

![imagen](https://user-images.githubusercontent.com/15236085/138015708-e4fd0890-1f85-4552-a803-056434e32efa.png)



