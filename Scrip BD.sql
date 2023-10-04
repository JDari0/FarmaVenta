use master

create database FarmaVenta

use FarmaVenta

create table cliente(
	idCliente int primary key IDENTITY(1,1),
	cedula varchar(10),
	nombre varchar(30),
	apellido varchar(30),
	direccion varchar(50),
	telefono varchar(10),
	email varchar(50)
)

create table proveedor(
	idProveedor int primary key IDENTITY(1,1),
	ruc varchar(13),
	nombre varchar(30),
	telefono varchar(10),
	direccion varchar(30),
	email varchar(50)
)

create table usuario(
	idUsuario int primary key IDENTITY(1,1),
	nombre varchar(30),
	apellido varchar(30),
	rol varchar(4),
	contraseña varchar(30),
	cedula varchar(10),
)

create table producto(
	idProducto int primary key IDENTITY(1,1),
	codigo varchar(6) not null,
	descripcion varchar(50) not null,
	medida varchar(50) not null,
	valor money not null,
	stock int
)

create table Kardex(
	idKardex int primary key IDENTITY(1,1),
	iddProducto int not null,
	stock int,
	vendido int,
	fecha datetime
)


create table cabeceraCompra(
	idCabeceraCompra int IDENTITY(1,1),
	numeroFactura varchar(10) primary key not null,
	fechaCompra datetime not null,
	idProveedor int not null,
	subTotal decimal(8,2) not null,	
	iva0 decimal(8,2) not null,
	iva12 decimal(8,2) not null,
	total decimal(8,2) not null,
	FOREIGN KEY (idProveedor) REFERENCES proveedor(idProveedor)
)

create table detalleCompra(
	numeroFactura varchar(10) not null,
	codigoProdcuto varchar(6) not null,
	iva varchar(6) not null,
	cantidad int not null,
	precio decimal(8,2) not null,
	FOREIGN KEY (numeroFactura) REFERENCES cabeceraCompra(numeroFactura)
)


--****************************


create table cabeceraFactura(
	idFactura int IDENTITY(1,1),
	codigoFactura varchar(10) primary key not null,
	idCliente int not null,
	fechaEmision datetime not null,
	idUsuario int not null,
	subTotal decimal(8,2) not null,	
	iva0 decimal(8,2) not null,
	iva12 decimal(8,2) not null,
	total decimal(8,2) not null,
	FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
	FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
)

create table detalleFactura(
	codigoFactura varchar(10) not null,
	codigoProdcuto varchar(6) not null,
	cantidad int not null,
	precio decimal(8,2) not null,
	FOREIGN KEY (codigoFactura) REFERENCES cabeceraFactura(codigoFactura)
)

select	cf.codigoFactura, cf.idCliente,
		cli.nombre, cli.apellido,
		cli.cedula, cli.telefono,
		cf.fechaEmision, cf.idUsuario,
		us.nombre, us.apellido,
		us.rol, cf.subTotal,
		cf.iva0, cf.iva12,
		cf.total, df.codigoProdcuto,
		pro.descripcion, df.cantidad,
		df.precio 
		from cabeceraFactura as cf
inner join detalleFactura as df
on cf.codigoFactura = df.codigoFactura
inner join cliente as cli
on cli.idCliente = cf.idCliente
inner join usuario as us
on us.idUsuario = cf.idUsuario
inner join producto as pro
on pro.codigo = df.codigoProdcuto
where cf.codigoFactura = 
and df.codigoFactura = 










SELECT count(cedula) from usuario where cedula = '1878561245' and contraseña = '1452';


INSERT INTO usuario (nombre, apellido, rol, contraseña, cedula)
     VALUES ('Lenin', 'Lopez', '1', '1452', '1878561245');

INSERT INTO usuario (nombre, apellido, rol, contraseña, cedula)
     VALUES ('Lara', 'Castillo', '2', '0055', '0945718256');

INSERT INTO usuario (nombre, apellido, rol, contraseña, cedula)
     VALUES ('Janeth', 'Guaman', '0', '0202', '1234567891');

INSERT INTO proveedor(ruc,nombre, telefono, direccion, email)
     VALUES ('1234567891001', 'GuamanCorporaciones', '2276113', 'Mucho Lote', 'guamanCorporaciones@ guamancorporaciones.com');

INSERT INTO cliente(cedula, nombre, apellido,  direccion, telefono, email)
     VALUES ('1234567891', 'Jorde', 'Zurdo', 'Barrio Centenario', '222222', 'jordeZ@ gmail.com');


select * from producto

select * from usuario

select * from proveedor

select * from cliente


SELECT * from proveedor where ruc = '1111111111001'

delete from usuario where cedula='9874563210'
delete from cliente where cedula='0000000000';

delete from usuario
delete from proveedor

--drop table proveedor
--drop table cliente
--drop table producto

INSERT INTO producto(codigo, descripcion, medida, valor) VALUES('0011', 'paracetamol', '10gr', 32.5);

DROP TABLE proveedor

DROP TABLE proveedor
DROP TABLE producto








ALTER TABLE  detalleCompra
ADD iva varchar(6);


select	cc.numeroFactura, cc.fechaCompra,
		prv.idProveedor, prv.nombre,
		prv.ruc, prv.direccion,
		prv.telefono, prv.email,
		cc.subTotal, cc.iva0,
		cc.iva12, cc.total
		from cabeceraCompra as cc
inner join proveedor as prv
on cc.idProveedor = prv.idProveedor
where cc.numeroFactura = '2626'



select	dc.codigoProdcuto, p.descripcion,
		dc.iva, dc.cantidad,
		dc.precio 
		from detalleCompra as dc
inner join producto as p
on dc.codigoProdcuto = p.codigo
where dc.numeroFactura = '2626'

select * from cabeceraCompra where numeroFactura = '2626'
select * from detalleCompra where numeroFactura = '2626'
select * from producto



select	cc.numeroFactura, cc.fechaCompra,
		prv.idProveedor, prv.nombre,
		prv.ruc, prv.direccion,
		prv.telefono, prv.email,
		cc.subTotal, cc.iva0,
		cc.iva12, cc.total,
		dc.codigoProdcuto, p.descripcion,
		dc.iva, dc.cantidad,
		dc.precio
		from cabeceraCompra as cc
inner join proveedor as prv
on cc.idProveedor = prv.idProveedor
inner join detalleCompra as dc
on dc.numeroFactura = cc.numeroFactura
inner join producto as p
on dc.codigoProdcuto = p.codigo
where dc.numeroFactura = '2626'














select cc.numeroFactura, cc.fechaCompra, 
prv.idProveedor, prv.nombre, 
prv.ruc, prv.direccion, 
prv.telefono, prv.email, 
cc.subTotal, cc.iva0, 
cc.iva12, cc.total, 
dc.codigoProdcuto, dc.cantidad, 
dc.precio 
from cabeceraCompra as cc 
inner join detalleCompra as dc 
on cc.numeroFactura = dc.numeroFactura 
inner join proveedor as prv 
on cc.idProveedor = prv.idProveedor

delete from [cabeceraCompra] where numeroFactura='020202022'
delete from [detalleCompra]	where numeroFactura='020202022'


delete from [cabeceraCompra]
delete from [detalleCompra]


drop table [cabeceraCompra]
drop table [detalleCompra]

select * from usuario
SELECT p.codigo, p.descripcion, p.medida, p.valor, dc.iva from producto as p inner join detalleCompra as dc on p.codigo= dc.codigoProdcuto

select * from [cabeceraCompra] where numeroFactura='1234567410'
select * from [detalleCompra] where numeroFactura='1234567410'

select * from [cabeceraFactura]
select * from [detalleFactura]
select * from producto

select cc.numeroFactura, cc.fechaCompra, prv.idProveedor, prv.nombre, prv.ruc, prv.direccion, prv.telefono, prv.email, cc.subTotal, cc.iva0, cc.iva12, cc.total, dc.codigoProdcuto, dc.cantidad, dc.precio from cabeceraCompra as cc inner join detalleCompra as dc on cc.numeroFactura = dc.numeroFactura inner join proveedor as prv on cc.idProveedor = prv.idProveedor where cc.numeroFactura = dc.numeroFactura



INSERT INTO [dbo].[cabeceraCompra]
           ([numeroFactura]
           ,[fechaCompra]
           ,[idProveedor]
           ,[subTotal]
           ,[iva0]
           ,[iva12]
           ,[total])
     VALUES
           ('03030303' ,'12/08/2022', '2',225.00,25.00 ,32.00 , 150.00)


INSERT INTO [dbo].[detalleCompra]
           ([numeroFactura]
           ,[codigoProdcuto]
           ,[cantidad]
           ,[iva]
           ,[precio])
     VALUES
           ( '03030303','0011' ,12,'12' ,0.85 )





INSERT INTO [dbo].[cabeceraFactura]
           ([codigoFactura]
           ,[idCliente]
           ,[fechaEmision]
           ,[idUsuario]
           ,[subTotal]
           ,[iva0]
           ,[iva12]
           ,[total])
     VALUES
           ('00000001' ,'2' , '25/05/2022','2' ,225 ,25 ,12 ,125)


INSERT INTO [dbo].[detalleFactura]
           ([codigoFactura]
           ,[codigoProdcuto]
           ,[cantidad]
           ,[precio])
     VALUES
           ( '00000001', '010101',2 ,2.25 )



INSERT INTO [dbo].[cabeceraCompra] 
([numeroFactura],[fechaCompra],
[idProveedor],[subTotal],
[iva0],[iva12],[total]) 
VALUES ('00ff5', 12/08/2022, 2, 20.3, 0.5, 0.3, 20.8);



select cc.numeroFactura, cc.fechaCompra, prv.idProveedor, prv.nombre, prv.ruc, prv.direccion, prv.telefono, prv.email, cc.subTotal, cc.iva0, cc.iva12, cc.total, dc.codigoProdcuto, dc.cantidad, dc.precio from cabeceraCompra as cc inner join detalleCompra as dc on cc.numeroFactura = dc.numeroFactura inner join proveedor as prv on cc.idProveedor = prv.idProveedor where cc.numeroFactura ='11ee34' AND dc.numeroFactura = '11ee34'


update [dbo].producto set     
	[stock] = ( (select stock from producto where codigo = 000081) + 3) 
	where codigo = 000081

select * from producto

-- cc cv dc dv pro cli


select * from proveedor
select * from cliente

select * from producto

update producto set stock = ( (select stock from producto) - 2) where codigo = '010101'

select stock from producto



select * from [cabeceraFactura] where codigoFactura= '21212121'
select * from [cabeceraFactura] where codigoFactura= '22222222'

select * from [cabeceraFactura]
select * from [detalleFactura] 
select * from producto

drop table [cabeceraFactura]
drop table [detalleFactura]



delete from [cabeceraFactura]
delete from [detalleFactura]

INSERT INTO [dbo].[cabeceraFactura] ([codigoFactura],[idCliente],[fechaEmision],[idUsuario],[subTotal],[iva0],[iva12],[total]) 
VALUES ('21212121', 1,'20120618 10:34:09', 2, 225.25, 25.25, 25.25, 250.25);

INSERT INTO [dbo].[cabeceraFactura] ([codigoFactura],[idCliente],[fechaEmision],[idUsuario],[subTotal],[iva0],[iva12],[total]) 
VALUES ('0000000014', 1, '2023-02-22 04:38:43', 2, 225.25, 25.25, 25.25, 250.25);

select cc.numeroFactura, cc.fechaCompra, prv.idProveedor, prv.nombre, prv.ruc, prv.direccion, prv.telefono, prv.email, cc.subTotal, cc.iva0, cc.iva12, cc.total, dc.codigoProdcuto, p.descripcion, dc.iva, dc.cantidad, dc.precio 
from cabeceraCompra as cc inner join proveedor as prv 
on cc.idProveedor = prv.idProveedor 
inner join detalleCompra as dc 
on dc.numeroFactura = cc.numeroFactura 
inner join producto as p on dc.codigoProdcuto = p.codigo where dc.numeroFactura = '8527418527'


select cc.fechaCompra,cf.fechaEmision, pro.nombre, cli.nombre,cli.apellido ,dc.cantidad, df.cantidad, dc.precio, df.precio, df.codigoProdcuto
from cabeceraCompra as cc 
inner join detalleCompra as dc on cc.numeroFactura=dc.numeroFactura 
inner join proveedor as pro on cc.idProveedor = pro.idProveedor 
inner join detalleFactura as df on df.codigoProdcuto=dc.codigoProdcuto 
inner join cabeceraFactura as cf on cf.codigoFactura = df.codigoFactura
inner join cliente as cli on cli.idCliente= cf.idCliente
where dc.codigoProdcuto = ' 015685'






select * from producto


select cv.fechaEmision, cli.nombre, cli.apellido, dv.cantidad, dv.precio
from cabeceraFactura as cv inner join detalleFactura as dv on cv.codigoFactura=dv.codigoFactura 
inner join cliente as cli on cv.idCliente = cli.idCliente 
where dv.codigoProdcuto = '015685'



SELECT p.codigo, p.descripcion, p.medida, p.valor, dc.iva, p.stock from producto as p inner join detalleCompra as dc on p.codigo= dc.codigoProdcuto

select cv.fechaEmision, cv.codigoFactura, cli.nombre, cli.apellido, cv.total
from cabeceraFactura as cv inner join detalleFactura as dv on cv.codigoFactura=dv.codigoFactura 
inner join cliente as cli on cv.idCliente = cli.idCliente
where cv.idUsuario= '3' and cv.fechaEmision>='21/02/2023 00:00:00' and cv.fechaEmision<='21/02/2023 23:59:59'

select cv.fechaEmision, cv.codigoFactura, (cli.nombre +cli.apellido) as cliente, cv.total
from cabeceraFactura as cv inner join detalleFactura as dv on cv.codigoFactura=dv.codigoFactura 
inner join cliente as cli on cv.idCliente = cli.idCliente
WHERE cv.idUsuario = '2' AND cv.fechaEmision >= CONVERT(datetime, CONVERT(varchar(8), GETDATE(), 112))

--ENIN

select 	cc.fechaCompra as fecha , tipo = 'I',
	pro.nombre as proveedor, cliente = '',
	dc.cantidad as cantidadCompra , cantidadVenta = '' ,
	dc.precio as precioCompra, precioVenta = '', 
	p.stock as saldo
from cabeceraCompra as cc 
inner join detalleCompra as dc on cc.numeroFactura=dc.numeroFactura 
inner join proveedor as pro on cc.idProveedor = pro.idProveedor 
inner join producto as p on dc.codigoProdcuto = p.idProducto 
	where dc.codigoProdcuto = '015685'


SELECT CONVERT(varchar(8), cv.fechaEmision, 108) as hora, cv.codigoFactura as numeroFactura, (cli.nombre+ ' '+cli.apellido) as cliente, cv.total as totalVendido
FROM cabeceraFactura as cv 
INNER JOIN cliente as cli ON cv.idCliente = cli.idCliente
WHERE cv.idUsuario = '2' AND cv.fechaEmision >= CONVERT(datetime, CONVERT(varchar(8), GETDATE(), 112))

select * from cabeceraFactura
select * from detalleFactura


select * from cabeceraCompra
select * from detalleCompra

select * from cliente
select * from producto
select * from proveedor
select * from usuario
select * from Kardex

--si funcionan para kardex
SELECT cc.fechaCompra AS fecha, tipo = 'I', pro.nombre AS proveedor, 
cliente = '', dc.cantidad AS cantidadCompra, cantidadVenta = '', dc.precio AS precioCompra, 
precioVenta = '', p.stock AS saldo FROM cabeceraCompra AS cc INNER JOIN detalleCompra AS dc ON 
cc.numeroFactura = dc.numeroFactura INNER JOIN proveedor AS pro ON cc.idProveedor = pro.idProveedor 
INNER JOIN producto AS p ON dc.codigoProdcuto = p.codigo WHERE dc.codigoProdcuto =  '015685' 

SELECT cf.fechaEmision AS fecha, tipo = 'E', proveedor = '', cli.nombre + ' ' + cli.apellido AS cliente, 
cantidadCompra = '', df.cantidad AS cantidadVenta, precioCompra = '', df.precio AS precioVenta, 
p.stock AS saldo FROM cabeceraFactura AS cf INNER JOIN detalleFactura AS df ON cf.codigoFactura = df.codigoFactura 
INNER JOIN cliente AS cli ON cf.idCliente = cli.idCliente INNER JOIN producto AS p ON df.codigoProdcuto = p.codigo 
WHERE df.codigoProdcuto = '015685'



