Use MASTER;
Go
Create database RestauranteBD;
Go
Use RestauranteBD;
Go
Create table Usuarios(
	nombredeUsuario varchar(30) primary key not null,
	nombre varchar(30),
	apellidos varchar(30),
	edad int,
	telefono varchar(15),
	email varchar(50),
	contraseña varchar(64),
	rol varchar(20)
);
Go
Create table Proveedores(
	idProveedor int identity(1,1) primary key not null,
	nombre varchar(50),
	ubicacion varchar(60),
	telefono varchar(15),
	email varchar(30)
);
Go
Create table ProductosVenta(
	idProductoV int identity(1,1) primary key not null,
	nombre varchar(25),
	precio money,
	categoria varchar(20)
);
Go
Create table ProductosCompra(
	idProductoC int identity(1,1) primary key not null,
	nombre varchar(25),
	precio money,
	categoria varchar(20),
	idProveedor int foreign key references Proveedores(idProveedor)
);
Go
Create table Ventas(
	idVenta int identity(1,1) primary key not null,
	fechadeVenta date,
	totalPagar money,
	estado varchar(15),
	nombredeUsuario varchar(30) Foreign key references Usuarios(nombredeUsuario)
);
Go
Create table DetallesVenta(
	idDetallesV int identity(1,1) primary key not null,
	idProductoV int foreign key references ProductosVenta(idProductoV),
	precioCompra float,
	cantidad int,
	totalProducto money,
	idVenta int foreign key references Ventas(idVenta)
);
Go
Create table Compraas(
	idCompra int identity(1,1) primary key not null,
	fechadeCompra date,
	totalaPagar money,
	idProveedor int foreign key references Proveedores(idProveedor),
	nombredeUsuario varchar(30) foreign key references Usuarios(nombredeUsuario)
);
Go
Create table DetallesCompra(
	idDetallesC int identity(1,1) primary key not null,
	idProductoC int foreign key references ProductosCompra(idProductoC),
	precioCompra float,
	cantidad int,
	totalProducto money,
	idCompra int foreign key references Compraas(idCompra)
);
Go
Create table Almacen(
idAlmacen int identity(1,1) primary key not null,
idProductoC int foreign key references ProductosCompra(idProductoC),
cantidadDisponible float,
unidad varchar(20)
);
Go

--------Actualización 23/05/2020--------------------
Alter table ProductosVenta drop column categoria
Alter table ProductosCompra drop column categoria

Create table Categorias(
idCategoria int identity(1,1) primary key not null,
nombreCategoria varchar(50)
);
Go

Alter table ProductosVenta add idCategoria int not null;
Alter table ProductosVenta add foreign key(idCategoria) references Categorias(idCategoria);
Alter table ProductosCompra add idCategoria int not null;
Alter table ProductosCompra add foreign key(idCategoria) references Categorias(idCategoria);

-----------Actualizacion 26/05/2020-------------------
Create table Recetas(
idReceta int identity(1,1) primary key not null,
idProductoV int foreign key references ProductosVenta(idProductoV),
idProductoC int foreign key references ProductosCompra(idProductoC),
cantidadProdIngrediente int
);

-----------Actualizacion 01/06/2020-------------------
/*Solo le cambie el nombre a la tabla Compras a 'Compraas', borren esta base, 
y ejecuten este script*/

-----------Actualizacion 03/06/2020-------------------
Alter table Ventas add NumMesa int

Alter table Ventas alter column fechadeVenta datetime

----------Actualizacion 04/06/2020-------------------
Alter table Almacen drop column unidad

----------Actualizacion 06/06/2020-------------------
Alter table ProductosVenta add estado varchar(20)
Alter table ProductosCompra add estado varchar(20)
Alter table Proveedores add estado varchar(20)
Alter table Categorias add estado varchar(20)
Alter table Usuarios add estado varchar(20)

-----------Datos para hacer pruebas------------
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('iShares Morningstar Mid-Cap ETF', null, '6118920538', 'mmagne0@about.com','Activo');
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('Ubiquiti Networks, Inc.', null, '4716458269', 'tmackerel1@marriott.com','Activo');
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('Tile Shop Hldgs, Inc.', null, '9066404663', 'fmccreagh2@washington.edu','Activo');
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('NexPoint Residential Trust, Inc.', null, '8574542915', 'bgleadle3@ucoz.ru','Activo');
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('QuinStreet, Inc.', null, '8168895875', 'drennock4@scribd.com','Activo');
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('Verizon Communications Inc.', null, '2176793729', 'bfrancioli5@surveymonkey.com','Activo');
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('Autoliv, Inc.', null, '9214602214', 'bdebold6@usda.gov','Activo');
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('Ambac Financial Group, Inc.', null, '2558495834', 'agauge7@wisc.edu','Activo');
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('Willis Towers Watson Public Limited Company', null, '6675864596', 'csymms8@nsw.gov.au','Activo');
insert into Proveedores (nombre, ubicacion, telefono, email, estado) values ('Legg Mason Low Volatility High Dividend ETF', null, '4026699152', 'blandeaux9@japanpost.jp','Activo');

insert into Categorias (nombreCategoria, estado) values ('Desayunos', 'Activo');
insert into Categorias (nombreCategoria, estado) values ('Almuerzos', 'Activo');
insert into Categorias (nombreCategoria, estado) values ('Cenas', 'Activo');
insert into Categorias (nombreCategoria, estado) values ('Postres', 'Activo');
insert into Categorias (nombreCategoria, estado) values ('Bebidas', 'Activo');