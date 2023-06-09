USE [master]
GO
/****** Object:  Database [DB_CARRITO]    Script Date: 5/24/2023 12:08:35 PM ******/
CREATE DATABASE [DB_CARRITO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_CARRITO', FILENAME = N'C:\MSSQL16.TIMESHEET\MSSQL\DATA\DB_CARRITO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_CARRITO_log', FILENAME = N'C:\MSSQL16.TIMESHEET\MSSQL\DATA\DB_CARRITO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_CARRITO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_CARRITO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_CARRITO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_CARRITO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_CARRITO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_CARRITO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_CARRITO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_CARRITO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_CARRITO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_CARRITO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_CARRITO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_CARRITO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_CARRITO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_CARRITO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_CARRITO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_CARRITO] SET  MULTI_USER 
GO
ALTER DATABASE [DB_CARRITO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_CARRITO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_CARRITO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_CARRITO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_CARRITO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_CARRITO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_CARRITO] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_CARRITO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_CARRITO]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[TotalProducto] [int] NULL,
	[Total] [decimal](10, 2) NULL,
	[Contacto] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](500) NULL,
	[IdDistrito] [varchar](10) NULL,
	[FechaCompra] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTAMENTO]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTAMENTO](
	[IdDepartamento] [varchar](2) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISTRITO]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISTRITO](
	[IdDistrito] [varchar](6) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdProvincia] [varchar](4) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NULL,
	[Descripcion] [varchar](500) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[IdProvincia] [varchar](4) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Contrasena] [varchar](100) NULL,
	[EsAdministrador] [bit] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT (getdate()) FOR [FechaCompra]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[COMPRA] ([IdCompra])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[MARCA] ([IdMarca])
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarRutaImagen]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_actualizarRutaImagen](
@IdProducto int,
@RutaImagen varchar(500)
)
as
begin
	update PRODUCTO set RutaImagen = @RutaImagen where IdProducto = @IdProducto
end


GO
/****** Object:  StoredProcedure [dbo].[sp_editarProducto]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_editarProducto](
@IdProducto int,
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion and IdProducto != @IdProducto)
	begin
		update PRODUCTO set 
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdMarca = @IdMarca,
		IdCategoria = @IdCategoria,
		Precio =@Precio ,
		Stock =@Stock ,
		Activo = @Activo where IdProducto = @IdProducto

		SET @Resultado =1
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCarrito]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_InsertarCarrito](
@IdUsuario int,
@IdProducto int,
@Resultado int output
)
as
begin
	set @Resultado = 0
	if not exists (select * from CARRITO where IdProducto = @IdProducto and IdUsuario = @IdUsuario)
	begin
		update PRODUCTO set Stock = Stock -1 where IdProducto = @IdProducto
		insert into CARRITO(IdUsuario,IdProducto) values ( @IdUsuario,@IdProducto)
		set @Resultado = 1
	end
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCategoria]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure [dbo].[sp_ModificarCategoria](
@IdCategoria int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end



GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarMarca]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR MARCA
create procedure [dbo].[sp_ModificarMarca](
@IdMarca int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion =@Descripcion and IdMarca != @IdMarca)
		
		update MARCA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdMarca = @IdMarca
	ELSE
		SET @Resultado = 0

end


GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCarrito]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_ObtenerCarrito](
@IdUsuario int
)
as
begin
	select c.IdCarrito, p.IdProducto,m.Descripcion,p.Nombre,p.Precio,p.RutaImagen from carrito c
	inner join PRODUCTO p on p.IdProducto = c.IdProducto
	inner join MARCA m on m.IdMarca = p.IdMarca
	where c.IdUsuario = @IdUsuario
end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerCategoria]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerCategoria]
as
begin
 select * from CATEGORIA
end



GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCompra]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_ObtenerCompra](
@IdUsuario int)
as
begin
select c.Total,convert(char(10),c.FechaCompra,103)[Fecha],

(select m.Descripcion, p.Nombre,p.RutaImagen,dc.Total,dc.Cantidad from DETALLE_COMPRA dc
inner join PRODUCTO p on p.IdProducto = dc.IdProducto
inner join MARCA m on m.IdMarca = p.IdMarca
where dc.IdCompra = c.IdCompra
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from compra c
where c.IdUsuario = @IdUsuario
FOR XML PATH('COMPRA'), ROOT('DATA') 
end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerMarca]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerMarca]
as
begin
 select * from MARCA
end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerProducto]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_obtenerProducto]
as
begin
 select p.*,m.Descripcion[DescripcionMarca],c.Descripcion[DescripcionCategoria] from PRODUCTO p
 inner join marca m on m.IdMarca = p.IdMarca
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria

end


GO
/****** Object:  StoredProcedure [dbo].[sp_obtenerUsuario]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_obtenerUsuario](
@Correo varchar(100),
@Contrasena varchar(100)
)
as
begin
	IF EXISTS (SELECT * FROM usuario WHERE correo = @Correo and contrasena = @Contrasena)
	begin
		SELECT IdUsuario,Nombres,Apellidos,Correo,Contrasena,EsAdministrador FROM usuario WHERE correo = @Correo and contrasena = @Contrasena
	end
end



GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCategoria]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC [dbo].[sp_RegistrarCategoria](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarCompra]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[sp_registrarCompra](
@IdUsuario int,
@TotalProducto int,
@Total decimal(10,2),
@Contacto varchar(100),
@Telefono varchar(100),
@Direccion varchar(100),
@IdDistrito varchar(10),
@QueryDetalleCompra nvarchar(max),
@Resultado bit output
)
as
begin
	begin try
		SET @Resultado = 0
		begin transaction
		
		declare @idcompra int = 0
		insert into COMPRA(IdUsuario,TotalProducto,Total,Contacto,Telefono,Direccion,IdDistrito) values
		(@IdUsuario,@TotalProducto,@Total,@Contacto,@Telefono,@Direccion,@IdDistrito)

		set @idcompra = scope_identity()

		set @QueryDetalleCompra = replace(@QueryDetalleCompra,'¡idcompra!',@idcompra)

		EXECUTE sp_executesql @QueryDetalleCompra

		delete from CARRITO where IdUsuario = @IdUsuario

		SET @Resultado = 1

		commit
	end try
	begin catch
		rollback
		SET @Resultado = 0
	end catch
end


GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMarca]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR MARCA
CREATE PROC [dbo].[sp_RegistrarMarca](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)

		insert into MARCA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarProducto]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_registrarProducto](
@Nombre varchar(500),
@Descripcion varchar(500),
@IdMarca int,
@IdCategoria int,
@Precio decimal(10,2),
@Stock int,
@RutaImagen varchar(500),
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Descripcion = @Descripcion)
	begin
		insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,RutaImagen) values (
		@Nombre,@Descripcion,@IdMarca,@IdCategoria,@Precio,@Stock,@RutaImagen)

		SET @Resultado = scope_identity()
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarUsuario]    Script Date: 5/24/2023 12:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_registrarUsuario](
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Contrasena varchar(100),
@EsAdministrador bit,
@Resultado int output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
	begin
		insert into USUARIO(Nombres,Apellidos,Correo,Contrasena,EsAdministrador) values
		(@Nombres,@Apellidos,@Correo,@Contrasena,@EsAdministrador)

		SET @Resultado = scope_identity()
	end
end

GO
USE [master]
GO
ALTER DATABASE [DB_CARRITO] SET  READ_WRITE 
GO
