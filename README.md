**Only a Smart Inventory System** es una solución diseñada para optimizar la gestión de inventarios en pequeñas empresas.  
La aplicación permite llevar un control eficiente de productos, así como de las entradas y salidas de cantidades, reduciendo errores humanos y mejorando la toma de decisiones.

Su enfoque principal es ofrecer una **aplicación móvil intuitiva, segura y escalable**, que facilite la administración de los productos manejados por el cliente.  
La aplicación móvil se centra en el manejo de operaciones **CRUD (Crear, Leer, Actualizar y Eliminar)** y en el control de stock, garantizando simplicidad y efectividad en la gestión diaria.

Se podrá visulaizar en un "log" la fecha en la que se modifican las cantidades de cada producto, para saber cuándo y quién fue el responsable del ajuste.

A continuación, se dejará el link del avance del diseño de la aplicación.
https://www.figma.com/proto/xvJ8ROvnIRfAs0QuXQyrvc/DESIGN---O.A.S.I.S?node-id=1-2&p=f&t=0Nj6VLUXYSX0D531-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=1%3A2



El proyecto tendrá la siguiente estructura.

## Estructura del Proyecto OASIS

```
lib/📁
│
├── main.dart                # Punto de entrada de la aplicación
│
└── app/📁
    │
    ├── app.dart             # Widget raíz donde se configura MaterialApp
    │
    ├── config/📁              # Configuraciones globales de la aplicación
    |   |── environment/     # Variables de entorno
    |   |── constants/       # Valores globales
    │   ├── router/          # Configuración de rutas y navegación
    │   └── theme/           # Temas globales (colores, estilos, tipografía)
    │
    ├── features/📁            # Funcionalidades o módulos de la aplicación
    │   │
    │   ├── auth/📁
    │   │   ├── screens/     # Pantallas de la funcionalidad
    │   │   ├── widgets/     # Widgets específicos de esta funcionalidad
    │   │   └── services/    # Lógica de negocio o consumo de APIs
    |   |
    │   ├── products/📁
    │   │   ├── createProducts/📁     # Crear productos.
    │   │   |   ├── screens/     # Pantallas de la funcionalidad
    │   │   |   ├── widgets/     # Widgets específicos de esta funcionalidad
    │   │   |   └── services/    # Lógica de negocio o consumo de APIs
    |   |   |
    |   |   ├── productList/📁
    │   │   |    ├── screens/     # Pantallas de la funcionalidad
    │   │   |    ├── widgets/     # Widgets específicos de esta funcionalidad
    │   │   |    └── services/    # Lógica de negocio o consumo de APIs
    |   |   |
    |   |   ├── productManagement/📁
    │   │       ├── screens/     # Pantallas de la funcionalidad
    │   │       ├── widgets/     # Widgets específicos de esta funcionalidad
    │   │       └── services/    # Lógica de negocio o consumo de APIs
    |   |   
    │   ├── category/📁
    │   │   ├── screens/     # Pantallas de la funcionalidad
    │   │   ├── widgets/     # Widgets específicos de esta funcionalidad
    │   │   └── services/    # Lógica de negocio o consumo de APIs
    |   |
    │   ├── home/📁
    │   │   ├── screens/     # Pantallas de la funcionalidad
    │   │   ├── widgets/     # Widgets específicos de esta funcionalidad
    │   │   └── services/    # Lógica de negocio o consumo de APIs
    |   |
    |   |
    |   |
    │   ├── inventory/📁
    │   │   ├── screens/     # Pantallas de la funcionalidad
    │   │   ├── widgets/     # Widgets específicos de esta funcionalidad
    │   │   └── services/    # Lógica de negocio o consumo de APIs
    │   │
    │   └── contacts/📁
    │       ├── screens/
    │       ├── widgets/
    │       └── services/
    |
    |── repositories/📁              # Es una capa que abstrae el origen de los datos.
    │
    └── shared/📁              # Elementos reutilizables en toda la aplicación
        ├── widgets/         # Widgets reutilizables globalmente
        ├── services/        # Servicios compartidos
        └── models/          # Modelos de datos utilizados en varias partes
```

**Arquitectura del proyecto**

La aplicación está organizada siguiendo una arquitectura basada en funcionalidades (Feature-Based Architecture).

Esto significa que el proyecto se estructura principalmente por componentes funcionales, donde cada feature contiene sus propias pantallas, widgets y servicios.

Este enfoque permite que cada funcionalidad sea independiente, escalable y fácil de mantener.

Esta organización facilita el crecimiento del proyecto y mejora la mantenibilidad del código a medida que la aplicación evoluciona.

## Documentación

- En el primero sprint (Rama: feaure/OASIS-create-products), se realizó la creación del widget que se encarga de crear los produtos con sus respectivas validaciones. Únicamente los crea, no los lista.

También se realizó la conexión con Firebase para poder guardar los registros en una base de datos en la nube.

Adicionalmente algunos campos contiene datos quemados, como lo son **categoría** y **contacto**, debido a que esos campos son seleccionables y de momento no existe el maestro para obtener la información.

Estos maestros se crearán en más adelante.

- En el segundo sprint se desarrolló la creación del widget que lista los productos, estos se visualizan en tarjetas individuales, con la opción de **editar** y **eliminar**.

Cuando el usuario hace un tap en una tarjeta, la misma se visualiza con un borde de color púrpura para tener una mejor visualización del producto que se quiere editar o eliminar.

Actualmente las acciones de editar y eliminar están en desarrollo, no están 100% funcionales.