/*
# [APPTOWER]
*/

USE [master]

GO



/****** Object:  Database [APPTOWER]    Script Date: 11/05/2023 10:06:53 p. m. ******/

CREATE DATABASE [APPTOWER]

 CONTAINMENT = NONE

 ON  PRIMARY 

( NAME = N'APPTOWER', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\APPTOWER.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )

 LOG ON 

( NAME = N'APPTOWER_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\APPTOWER_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )

 WITH CATALOG_COLLATION = DATABASE_DEFAULT

GO

ALTER DATABASE [APPTOWER] SET COMPATIBILITY_LEVEL = 150

GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))

begin

EXEC [APPTOWER].[dbo].[sp_fulltext_database] @action = 'enable'

end

GO

ALTER DATABASE [APPTOWER] SET ANSI_NULL_DEFAULT OFF 

GO

ALTER DATABASE [APPTOWER] SET ANSI_NULLS OFF 

GO

ALTER DATABASE [APPTOWER] SET ANSI_PADDING OFF 

GO

ALTER DATABASE [APPTOWER] SET ANSI_WARNINGS OFF 

GO

ALTER DATABASE [APPTOWER] SET ARITHABORT OFF 

GO

ALTER DATABASE [APPTOWER] SET AUTO_CLOSE OFF 

GO

ALTER DATABASE [APPTOWER] SET AUTO_SHRINK OFF 

GO

ALTER DATABASE [APPTOWER] SET AUTO_UPDATE_STATISTICS ON 

GO

ALTER DATABASE [APPTOWER] SET CURSOR_CLOSE_ON_COMMIT OFF 

GO

ALTER DATABASE [APPTOWER] SET CURSOR_DEFAULT  GLOBAL 

GO

ALTER DATABASE [APPTOWER] SET CONCAT_NULL_YIELDS_NULL OFF 

GO

ALTER DATABASE [APPTOWER] SET NUMERIC_ROUNDABORT OFF 

GO

ALTER DATABASE [APPTOWER] SET QUOTED_IDENTIFIER OFF 

GO

ALTER DATABASE [APPTOWER] SET RECURSIVE_TRIGGERS OFF 

GO

ALTER DATABASE [APPTOWER] SET  ENABLE_BROKER 

GO

ALTER DATABASE [APPTOWER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 

GO

ALTER DATABASE [APPTOWER] SET DATE_CORRELATION_OPTIMIZATION OFF 

GO

ALTER DATABASE [APPTOWER] SET TRUSTWORTHY OFF 

GO

ALTER DATABASE [APPTOWER] SET ALLOW_SNAPSHOT_ISOLATION OFF 

GO

ALTER DATABASE [APPTOWER] SET PARAMETERIZATION SIMPLE 

GO

ALTER DATABASE [APPTOWER] SET READ_COMMITTED_SNAPSHOT OFF 

GO

ALTER DATABASE [APPTOWER] SET HONOR_BROKER_PRIORITY OFF 

GO

ALTER DATABASE [APPTOWER] SET RECOVERY FULL 

GO

ALTER DATABASE [APPTOWER] SET  MULTI_USER 

GO

ALTER DATABASE [APPTOWER] SET PAGE_VERIFY CHECKSUM  

GO

ALTER DATABASE [APPTOWER] SET DB_CHAINING OFF 

GO

ALTER DATABASE [APPTOWER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 

GO

ALTER DATABASE [APPTOWER] SET TARGET_RECOVERY_TIME = 60 SECONDS 

GO

ALTER DATABASE [APPTOWER] SET DELAYED_DURABILITY = DISABLED 

GO

ALTER DATABASE [APPTOWER] SET ACCELERATED_DATABASE_RECOVERY = OFF  

GO

EXEC sys.sp_db_vardecimal_storage_format N'APPTOWER', N'ON'

GO

ALTER DATABASE [APPTOWER] SET QUERY_STORE = OFF

GO



/*
# [dbo].[agenda]
*/

USE [APPTOWER]

GO



/****** Object:  Table [dbo].[agenda]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[agenda](

	[Id_Agenda] [int] IDENTITY(1,1) NOT NULL,

	[Fecha_Inicio] [datetime] NOT NULL,

	[Fecha_Final] [datetime] NOT NULL,

 CONSTRAINT [PK_Agenda] PRIMARY KEY CLUSTERED 

(

	[Id_Agenda] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[cobros]
*/

/****** Object:  Table [dbo].[cobros]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[cobros](

	[id_cobro] [int] IDENTITY(1,1) NOT NULL,

	[tipo_cobro] [varchar](40) NOT NULL,

	[motivo] [varchar](40) NOT NULL,

	[descripcion] [varchar](100) NOT NULL,

	[valor] [decimal](10, 2) NOT NULL,

	[estado] [varchar](10) NOT NULL,

 CONSTRAINT [PK_id_cobro] PRIMARY KEY CLUSTERED 

(

	[id_cobro] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[cuentaCobros]
*/

/****** Object:  Table [dbo].[cuentaCobros]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[cuentaCobros](

	[id_cuentaCobro] [int] IDENTITY(1,1) NOT NULL,

	[num_cuentaCobro] [int] NOT NULL,

	[id_espacio] [int] NOT NULL,

	[id_propietario] [int] NOT NULL,

	[fecha_creacion] [date] NOT NULL,

	[fecha_limite] [date] NOT NULL,

	[subtotal] [decimal](10, 2) NOT NULL,

	[cuenta_banco] [varchar](20) NOT NULL,

	[total] [decimal](10, 2) NOT NULL,

	[estado] [varchar](9) NOT NULL,

 CONSTRAINT [PK_cuentaCobro] PRIMARY KEY CLUSTERED 

(

	[id_cuentaCobro] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[Detalles_cuentaCobros]
*/

/****** Object:  Table [dbo].[Detalles_cuentaCobros]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Detalles_cuentaCobros](

	[id_Detalle_cuentaCobro] [int] IDENTITY(1,1) NOT NULL,

	[id_cuentaCobro] [int] NOT NULL,

	[id_cobro] [int] NOT NULL,

	[cuota] [varchar](5) NOT NULL,

 CONSTRAINT [PK_id_Detalle_cuentaCobro] PRIMARY KEY CLUSTERED 

(

	[id_Detalle_cuentaCobro] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[espacios]
*/

/****** Object:  Table [dbo].[espacios]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[espacios](

	[id_espacio] [int] IDENTITY(1,1) NOT NULL,

	[nombre_espacio] [varchar](255) NULL,

	[tipo_espacio] [varchar](255) NOT NULL,

	[area] [float] NULL,

	[capacidad] [int] NULL,

	[estado] [varchar](20) NOT NULL,

 CONSTRAINT [PK_espacios] PRIMARY KEY CLUSTERED 

(

	[id_espacio] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[propietarios]
*/

/****** Object:  Table [dbo].[propietarios]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[propietarios](

	[id_propietario] [int] IDENTITY(1,1) NOT NULL,

	[tipo_documento_propietario] [varchar](20) NOT NULL,

	[numero_documento_propietario] [varchar](15) NOT NULL,

	[nombre_propietario] [varchar](255) NOT NULL,

	[apellido_propietario] [varchar](255) NOT NULL,

	[correo_propietario] [varchar](80) NOT NULL,

	[telefono_propietario] [varchar](15) NULL,

	[estado_propietario] [varchar](20) NOT NULL,

 CONSTRAINT [PK_id_propietario] PRIMARY KEY CLUSTERED 

(

	[id_propietario] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[propietarios_espacios]
*/

/****** Object:  Table [dbo].[propietarios_espacios]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[propietarios_espacios](

	[id_propietario_espacio] [int] IDENTITY(1,1) NOT NULL,

	[id_espacio] [int] NULL,

	[id_propietario] [int] NULL,

 CONSTRAINT [PK_propietario_espacio] PRIMARY KEY CLUSTERED 

(

	[id_propietario_espacio] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[reservas]
*/

/****** Object:  Table [dbo].[reservas]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[reservas](

	[Id_Reserva] [int] IDENTITY(1,1) NOT NULL,

	[Tipo_Reserva] [varchar](40) NOT NULL,

	[Fecha_Reserva] [int] NOT NULL,

	[Espacio_Reserva] [varchar](40) NOT NULL,

	[Cantidad_Personas] [int] NOT NULL,

 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 

(

	[Id_Reserva] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[reservas_vehiculo]
*/

/****** Object:  Table [dbo].[reservas_vehiculo]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[reservas_vehiculo](

	[Id_Vehiculo] [int] NOT NULL,

	[Id_Reserva] [int] NOT NULL,

 CONSTRAINT [PK_Reserva_Vehiculo] PRIMARY KEY CLUSTERED 

(

	[Id_Vehiculo] ASC,

	[Id_Reserva] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[residentes]
*/

/****** Object:  Table [dbo].[residentes]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[residentes](

	[id_residente] [int] IDENTITY(1,1) NOT NULL,

	[tipo_documento_residente] [varchar](20) NOT NULL,

	[numero_documento_residente] [varchar](15) NOT NULL,

	[nombre_residente] [varchar](255) NOT NULL,

	[apellido_residente] [varchar](255) NOT NULL,

	[correo_residente] [varchar](80) NOT NULL,

	[telefono_residente] [varchar](15) NULL,

	[edad_residente] [int] NOT NULL,

	[residencia_actual] [bit] NOT NULL,

	[id_espacio] [int] NOT NULL,

	[tipo_residente] [varchar](255) NOT NULL,

	[fecha_inicio_residencia] [datetime] NOT NULL,

	[fecha_fin_residencia] [datetime] NULL,

	[estado_residente] [varchar](20) NOT NULL,

 CONSTRAINT [PK_id_residente] PRIMARY KEY CLUSTERED 

(

	[id_residente] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[Roles]
*/

/****** Object:  Table [dbo].[Roles]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Roles](

	[Id_Rol] [int] IDENTITY(1,1) NOT NULL,

	[Nombre_Rol] [varchar](30) NULL,

	[Descripcion] [varchar](255) NULL,

	[Estado] [bit] NULL,

 CONSTRAINT [Pk_IdRol] PRIMARY KEY CLUSTERED 

(

	[Id_Rol] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[usuarios]
*/

/****** Object:  Table [dbo].[usuarios]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[usuarios](

	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,

	[Nombre] [varchar](50) NULL,

	[Apellido] [varchar](50) NULL,

	[Id_Rol] [int] NULL,

	[Tipo_documento] [varchar](20) NULL,

	[Documento] [varchar](15) NULL,

	[Correo] [varchar](80) NULL,

	[Telefono] [varchar](15) NULL,

	[Contrasena] [varchar](10) NULL,

 CONSTRAINT [Pk_IdUsuario] PRIMARY KEY CLUSTERED 

(

	[Id_Usuario] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[usuarios_residentes]
*/

/****** Object:  Table [dbo].[usuarios_residentes]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[usuarios_residentes](

	[id_usuario_residente] [int] IDENTITY(1,1) NOT NULL,

	[id_usuario] [int] NULL,

	[id_residente] [int] NULL,

 CONSTRAINT [PK_usuario_residente] PRIMARY KEY CLUSTERED 

(

	[id_usuario_residente] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[vehiculos]
*/

/****** Object:  Table [dbo].[vehiculos]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[vehiculos](

	[Id_Vehiculo] [int] IDENTITY(1,1) NOT NULL,

	[Placa] [varchar](10) NOT NULL,

	[Tipo_Usuario_Vehiculo] [int] NOT NULL,

	[Nombre_Propietario_Vehiculo] [int] NOT NULL,

 CONSTRAINT [PK_Vehiculos] PRIMARY KEY CLUSTERED 

(

	[Id_Vehiculo] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[vehiculos_residentes]
*/

/****** Object:  Table [dbo].[vehiculos_residentes]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[vehiculos_residentes](

	[id_vehiculo_residente] [int] IDENTITY(1,1) NOT NULL,

	[id_vehiculo] [int] NULL,

	[id_residente] [int] NULL,

 CONSTRAINT [PK_vehiculo_residente] PRIMARY KEY CLUSTERED 

(

	[id_vehiculo_residente] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[vehiculos_visitantes]
*/

/****** Object:  Table [dbo].[vehiculos_visitantes]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[vehiculos_visitantes](

	[id_vehiculo_visitante] [int] IDENTITY(1,1) NOT NULL,

	[id_vehiculo] [int] NULL,

	[id_visitante] [int] NULL,

 CONSTRAINT [PK_vehiculo_visitante] PRIMARY KEY CLUSTERED 

(

	[id_vehiculo_visitante] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[Vigilante]
*/

/****** Object:  Table [dbo].[Vigilante]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Vigilante](

	[Id_Vigilante] [int] IDENTITY(1,1) NOT NULL,

	[Nombre_Vigilante] [varchar](50) NULL,

	[Tipo_documento] [varchar](20) NULL,

	[Documento] [varchar](15) NULL,

	[Telefono] [varchar](15) NULL,

	[Edad] [varchar](3) NULL,

	[Estado] [bit] NULL,

 CONSTRAINT [Pk_IdVigilante] PRIMARY KEY CLUSTERED 

(

	[Id_Vigilante] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[visitantes]
*/

/****** Object:  Table [dbo].[visitantes]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[visitantes](

	[id_visitante] [int] IDENTITY(1,1) NOT NULL,

	[tipo_documento_visitante] [varchar](20) NOT NULL,

	[numero_documento_visitante] [varchar](15) NOT NULL,

	[nombre_visitante] [varchar](255) NOT NULL,

	[apellido_visitante] [varchar](255) NOT NULL,

	[correo_visitante] [varchar](80) NOT NULL,

	[telefono_visitante] [varchar](15) NULL,

	[edad_visitante] [int] NOT NULL,

	[genero_visitante] [varchar](1) NULL,

	[estado_visitante] [varchar](20) NOT NULL,

 CONSTRAINT [PK_id_visitante] PRIMARY KEY CLUSTERED 

(

	[id_visitante] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [dbo].[visitas]
*/

/****** Object:  Table [dbo].[visitas]    Script Date: 11/05/2023 10:06:54 p. m. ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[visitas](

	[id_visita] [int] IDENTITY(1,1) NOT NULL,

	[id_visitante] [int] NOT NULL,

	[id_espacio_visitar] [int] NOT NULL,

	[id_espacio_reservar] [int] NOT NULL,

	[fecha_visita] [datetime] NOT NULL,

	[fecha_salida] [datetime] NULL,

	[estado_visita] [varchar](255) NULL,

 CONSTRAINT [PK_visita] PRIMARY KEY CLUSTERED 

(

	[id_visita] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO



/*
# [UC_cuentaCobro]
*/

/****** Object:  Index [UC_cuentaCobro]    Script Date: 11/05/2023 10:07:14 p. m. ******/

ALTER TABLE [dbo].[cuentaCobros] ADD  CONSTRAINT [UC_cuentaCobro] UNIQUE NONCLUSTERED 

(

	[num_cuentaCobro] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO



/*
# [UQ__espacios__7B9A3104F0458146]
*/

SET ANSI_PADDING ON

GO

/****** Object:  Index [UQ__espacios__7B9A3104F0458146]    Script Date: 11/05/2023 10:07:14 p. m. ******/

ALTER TABLE [dbo].[espacios] ADD UNIQUE NONCLUSTERED 

(

	[nombre_espacio] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO



/*
# [UC_Placa]
*/

SET ANSI_PADDING ON

GO

/****** Object:  Index [UC_Placa]    Script Date: 11/05/2023 10:07:14 p. m. ******/

ALTER TABLE [dbo].[vehiculos] ADD  CONSTRAINT [UC_Placa] UNIQUE NONCLUSTERED 

(

	[Placa] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO



/*
# [DF__cobros__estado__7A672E12]
*/

ALTER TABLE [dbo].[cobros] ADD  DEFAULT ('activo') FOR [estado]

GO



/*
# [DF__cuentaCob__fecha__75A278F5]
*/

ALTER TABLE [dbo].[cuentaCobros] ADD  DEFAULT (getdate()) FOR [fecha_creacion]

GO



/*
# [DF__cuentaCob__estad__76969D2E]
*/

ALTER TABLE [dbo].[cuentaCobros] ADD  DEFAULT ('Pendiente') FOR [estado]

GO



/*
# [DF__espacios__area__25869641]
*/

ALTER TABLE [dbo].[espacios] ADD  DEFAULT (NULL) FOR [area]

GO



/*
# [DF__espacios__capaci__267ABA7A]
*/

ALTER TABLE [dbo].[espacios] ADD  DEFAULT (NULL) FOR [capacidad]

GO



/*
# [DF__espacios__estado__276EDEB3]
*/

ALTER TABLE [dbo].[espacios] ADD  DEFAULT ('ACTIVO') FOR [estado]

GO



/*
# [DF__propietar__estad__2E1BDC42]
*/

ALTER TABLE [dbo].[propietarios] ADD  DEFAULT ('ACTIVO') FOR [estado_propietario]

GO



/*
# [DF__residente__resid__37A5467C]
*/

ALTER TABLE [dbo].[residentes] ADD  DEFAULT ((1)) FOR [residencia_actual]

GO



/*
# [DF__residente__tipo___38996AB5]
*/

ALTER TABLE [dbo].[residentes] ADD  DEFAULT ('PROPIETARIO') FOR [tipo_residente]

GO



/*
# [DF__residente__fecha__398D8EEE]
*/

ALTER TABLE [dbo].[residentes] ADD  DEFAULT (NULL) FOR [fecha_fin_residencia]

GO



/*
# [DF__residente__estad__3A81B327]
*/

ALTER TABLE [dbo].[residentes] ADD  DEFAULT ('ACTIVO') FOR [estado_residente]

GO



/*
# [DF__visitante__gener__46E78A0C]
*/

ALTER TABLE [dbo].[visitantes] ADD  DEFAULT (NULL) FOR [genero_visitante]

GO



/*
# [DF__visitante__estad__47DBAE45]
*/

ALTER TABLE [dbo].[visitantes] ADD  DEFAULT ('ACTIVO') FOR [estado_visitante]

GO



/*
# [DF__visitas__estado___51300E55]
*/

ALTER TABLE [dbo].[visitas] ADD  DEFAULT ('PENDIENTE') FOR [estado_visita]

GO



/*
# [FK_id_cobro]
*/

ALTER TABLE [dbo].[Detalles_cuentaCobros]  WITH CHECK ADD  CONSTRAINT [FK_id_cobro] FOREIGN KEY([id_cobro])

REFERENCES [dbo].[cobros] ([id_cobro])

GO

ALTER TABLE [dbo].[Detalles_cuentaCobros] CHECK CONSTRAINT [FK_id_cobro]

GO



/*
# [FK_id_cuentaCobro]
*/

ALTER TABLE [dbo].[Detalles_cuentaCobros]  WITH CHECK ADD  CONSTRAINT [FK_id_cuentaCobro] FOREIGN KEY([id_cuentaCobro])

REFERENCES [dbo].[cuentaCobros] ([id_cuentaCobro])

GO

ALTER TABLE [dbo].[Detalles_cuentaCobros] CHECK CONSTRAINT [FK_id_cuentaCobro]

GO



/*
# [FK_espacio_propietario]
*/

ALTER TABLE [dbo].[propietarios_espacios]  WITH CHECK ADD  CONSTRAINT [FK_espacio_propietario] FOREIGN KEY([id_espacio])

REFERENCES [dbo].[espacios] ([id_espacio])

GO

ALTER TABLE [dbo].[propietarios_espacios] CHECK CONSTRAINT [FK_espacio_propietario]

GO



/*
# [FK_popietario_espacio]
*/

ALTER TABLE [dbo].[propietarios_espacios]  WITH CHECK ADD  CONSTRAINT [FK_popietario_espacio] FOREIGN KEY([id_propietario])

REFERENCES [dbo].[propietarios] ([id_propietario])

GO

ALTER TABLE [dbo].[propietarios_espacios] CHECK CONSTRAINT [FK_popietario_espacio]

GO



/*
# [FK_Reserva]
*/

ALTER TABLE [dbo].[reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reserva] FOREIGN KEY([Fecha_Reserva])

REFERENCES [dbo].[agenda] ([Id_Agenda])

GO

ALTER TABLE [dbo].[reservas] CHECK CONSTRAINT [FK_Reserva]

GO



/*
# [FK_Reserva_Vehiculo]
*/

ALTER TABLE [dbo].[reservas_vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Vehiculo] FOREIGN KEY([Id_Reserva])

REFERENCES [dbo].[reservas] ([Id_Reserva])

GO

ALTER TABLE [dbo].[reservas_vehiculo] CHECK CONSTRAINT [FK_Reserva_Vehiculo]

GO



/*
# [FK_id_espacio]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [FK_id_espacio] FOREIGN KEY([id_espacio])

REFERENCES [dbo].[espacios] ([id_espacio])

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [FK_id_espacio]

GO



/*
# [FK_IdRol]
*/

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_IdRol] FOREIGN KEY([Id_Rol])

REFERENCES [dbo].[Roles] ([Id_Rol])

GO

ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_IdRol]

GO



/*
# [FK_residente]
*/

ALTER TABLE [dbo].[usuarios_residentes]  WITH CHECK ADD  CONSTRAINT [FK_residente] FOREIGN KEY([id_residente])

REFERENCES [dbo].[residentes] ([id_residente])

GO

ALTER TABLE [dbo].[usuarios_residentes] CHECK CONSTRAINT [FK_residente]

GO



/*
# [FK_usuario]
*/

ALTER TABLE [dbo].[usuarios_residentes]  WITH CHECK ADD  CONSTRAINT [FK_usuario] FOREIGN KEY([id_usuario])

REFERENCES [dbo].[usuarios] ([Id_Usuario])

GO

ALTER TABLE [dbo].[usuarios_residentes] CHECK CONSTRAINT [FK_usuario]

GO



/*
# [FK_residente_vehiculo]
*/

ALTER TABLE [dbo].[vehiculos_residentes]  WITH CHECK ADD  CONSTRAINT [FK_residente_vehiculo] FOREIGN KEY([id_residente])

REFERENCES [dbo].[residentes] ([id_residente])

GO

ALTER TABLE [dbo].[vehiculos_residentes] CHECK CONSTRAINT [FK_residente_vehiculo]

GO



/*
# [FK_vehiculo]
*/

ALTER TABLE [dbo].[vehiculos_residentes]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo] FOREIGN KEY([id_vehiculo])

REFERENCES [dbo].[vehiculos] ([Id_Vehiculo])

GO

ALTER TABLE [dbo].[vehiculos_residentes] CHECK CONSTRAINT [FK_vehiculo]

GO



/*
# [FK_vehiculo_visitante]
*/

ALTER TABLE [dbo].[vehiculos_visitantes]  WITH CHECK ADD  CONSTRAINT [FK_vehiculo_visitante] FOREIGN KEY([id_vehiculo])

REFERENCES [dbo].[vehiculos] ([Id_Vehiculo])

GO

ALTER TABLE [dbo].[vehiculos_visitantes] CHECK CONSTRAINT [FK_vehiculo_visitante]

GO



/*
# [FK_visitante_vehiculo]
*/

ALTER TABLE [dbo].[vehiculos_visitantes]  WITH CHECK ADD  CONSTRAINT [FK_visitante_vehiculo] FOREIGN KEY([id_visitante])

REFERENCES [dbo].[visitantes] ([id_visitante])

GO

ALTER TABLE [dbo].[vehiculos_visitantes] CHECK CONSTRAINT [FK_visitante_vehiculo]

GO



/*
# [PK_espacio_reservar]
*/

ALTER TABLE [dbo].[visitas]  WITH CHECK ADD  CONSTRAINT [PK_espacio_reservar] FOREIGN KEY([id_espacio_reservar])

REFERENCES [dbo].[reservas] ([Id_Reserva])

GO

ALTER TABLE [dbo].[visitas] CHECK CONSTRAINT [PK_espacio_reservar]

GO



/*
# [PK_espacio_visitar]
*/

ALTER TABLE [dbo].[visitas]  WITH CHECK ADD  CONSTRAINT [PK_espacio_visitar] FOREIGN KEY([id_espacio_visitar])

REFERENCES [dbo].[espacios] ([id_espacio])

GO

ALTER TABLE [dbo].[visitas] CHECK CONSTRAINT [PK_espacio_visitar]

GO



/*
# [PK_visitante]
*/

ALTER TABLE [dbo].[visitas]  WITH CHECK ADD  CONSTRAINT [PK_visitante] FOREIGN KEY([id_visitante])

REFERENCES [dbo].[visitantes] ([id_visitante])

GO

ALTER TABLE [dbo].[visitas] CHECK CONSTRAINT [PK_visitante]

GO



/*
# [CHK_agenda]
*/

ALTER TABLE [dbo].[agenda]  WITH CHECK ADD  CONSTRAINT [CHK_agenda] CHECK  (([Fecha_Inicio]<[Fecha_Final]))

GO

ALTER TABLE [dbo].[agenda] CHECK CONSTRAINT [CHK_agenda]

GO



/*
# [CHK_estado]
*/

ALTER TABLE [dbo].[cobros]  WITH CHECK ADD  CONSTRAINT [CHK_estado] CHECK  (([estado] like '(activo|inactivo)'))

GO

ALTER TABLE [dbo].[cobros] CHECK CONSTRAINT [CHK_estado]

GO



/*
# [CHK_tipoCobro]
*/

ALTER TABLE [dbo].[cobros]  WITH CHECK ADD  CONSTRAINT [CHK_tipoCobro] CHECK  (([tipo_cobro] like '%[ a-zA-Z]$'))

GO

ALTER TABLE [dbo].[cobros] CHECK CONSTRAINT [CHK_tipoCobro]

GO



/*
# [CHK_cuenta_banco]
*/

ALTER TABLE [dbo].[cuentaCobros]  WITH CHECK ADD  CONSTRAINT [CHK_cuenta_banco] CHECK  (([cuenta_banco] like '%[0-9]$'))

GO

ALTER TABLE [dbo].[cuentaCobros] CHECK CONSTRAINT [CHK_cuenta_banco]

GO



/*
# [CHK_cuota]
*/

ALTER TABLE [dbo].[Detalles_cuentaCobros]  WITH CHECK ADD  CONSTRAINT [CHK_cuota] CHECK  (([cuota] like '[0-9]{1,2}[/][0-9]{1,2}'))

GO

ALTER TABLE [dbo].[Detalles_cuentaCobros] CHECK CONSTRAINT [CHK_cuota]

GO



/*
# [CK_area]
*/

ALTER TABLE [dbo].[espacios]  WITH CHECK ADD  CONSTRAINT [CK_area] CHECK  (([area]>(0)))

GO

ALTER TABLE [dbo].[espacios] CHECK CONSTRAINT [CK_area]

GO



/*
# [CK_capacidad]
*/

ALTER TABLE [dbo].[espacios]  WITH CHECK ADD  CONSTRAINT [CK_capacidad] CHECK  (([capacidad]>(0)))

GO

ALTER TABLE [dbo].[espacios] CHECK CONSTRAINT [CK_capacidad]

GO



/*
# [CK_estado]
*/

ALTER TABLE [dbo].[espacios]  WITH CHECK ADD  CONSTRAINT [CK_estado] CHECK  (([estado]='INACTIVO' OR [estado]='ACTIVO'))

GO

ALTER TABLE [dbo].[espacios] CHECK CONSTRAINT [CK_estado]

GO



/*
# [CK_nombre_espacio]
*/

ALTER TABLE [dbo].[espacios]  WITH CHECK ADD  CONSTRAINT [CK_nombre_espacio] CHECK  ((NOT [nombre_espacio] like '%[^a-zA-Z0-9]%'))

GO

ALTER TABLE [dbo].[espacios] CHECK CONSTRAINT [CK_nombre_espacio]

GO



/*
# [CK_apellido_propietario]
*/

ALTER TABLE [dbo].[propietarios]  WITH CHECK ADD  CONSTRAINT [CK_apellido_propietario] CHECK  ((NOT [apellido_propietario] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[propietarios] CHECK CONSTRAINT [CK_apellido_propietario]

GO



/*
# [CK_correo_propietario]
*/

ALTER TABLE [dbo].[propietarios]  WITH CHECK ADD  CONSTRAINT [CK_correo_propietario] CHECK  (([correo_propietario] like '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com'))

GO

ALTER TABLE [dbo].[propietarios] CHECK CONSTRAINT [CK_correo_propietario]

GO



/*
# [CK_Documento]
*/

ALTER TABLE [dbo].[propietarios]  WITH CHECK ADD  CONSTRAINT [CK_Documento] CHECK  (([numero_documento_propietario] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[propietarios] CHECK CONSTRAINT [CK_Documento]

GO



/*
# [CK_estado_propietario]
*/

ALTER TABLE [dbo].[propietarios]  WITH CHECK ADD  CONSTRAINT [CK_estado_propietario] CHECK  (([estado_propietario]='INACTIVO' OR [estado_propietario]='ACTIVO'))

GO

ALTER TABLE [dbo].[propietarios] CHECK CONSTRAINT [CK_estado_propietario]

GO



/*
# [CK_nombre_propietario]
*/

ALTER TABLE [dbo].[propietarios]  WITH CHECK ADD  CONSTRAINT [CK_nombre_propietario] CHECK  ((NOT [nombre_propietario] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[propietarios] CHECK CONSTRAINT [CK_nombre_propietario]

GO



/*
# [CK_telefono_propietario]
*/

ALTER TABLE [dbo].[propietarios]  WITH CHECK ADD  CONSTRAINT [CK_telefono_propietario] CHECK  (([telefono_propietario] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[propietarios] CHECK CONSTRAINT [CK_telefono_propietario]

GO



/*
# [CK_tipo_documento_propietario]
*/

ALTER TABLE [dbo].[propietarios]  WITH CHECK ADD  CONSTRAINT [CK_tipo_documento_propietario] CHECK  ((NOT [tipo_documento_propietario] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[propietarios] CHECK CONSTRAINT [CK_tipo_documento_propietario]

GO



/*
# [CHK_reservas]
*/

ALTER TABLE [dbo].[reservas]  WITH CHECK ADD  CONSTRAINT [CHK_reservas] CHECK  ((([Tipo_Reserva] like 'Salon Social' OR [Tipo_Reserva] like 'Zonas Humedas' OR [Tipo_Reserva] like 'Parqueador') AND ([Espacio_Reserva] like 'Salon Social' OR [Espacio_Reserva] like 'Sauna' OR [Espacio_Reserva] like 'Piscina' OR [Espacio_Reserva] like 'Parqueadero') AND [Cantidad_Personas]>(1)))

GO

ALTER TABLE [dbo].[reservas] CHECK CONSTRAINT [CHK_reservas]

GO



/*
# [CK_apellido_residente]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [CK_apellido_residente] CHECK  ((NOT [apellido_residente] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [CK_apellido_residente]

GO



/*
# [CK_correo_residente]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [CK_correo_residente] CHECK  (([correo_residente] like '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com'))

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [CK_correo_residente]

GO



/*
# [CK_edad_residente]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [CK_edad_residente] CHECK  (([edad_residente]>=(0)))

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [CK_edad_residente]

GO



/*
# [CK_estado_residente]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [CK_estado_residente] CHECK  (([estado_residente]='INACTIVO' OR [estado_residente]='ACTIVO'))

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [CK_estado_residente]

GO



/*
# [CK_nombre_residente]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [CK_nombre_residente] CHECK  ((NOT [nombre_residente] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [CK_nombre_residente]

GO



/*
# [CK_numero_documento_residente]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [CK_numero_documento_residente] CHECK  (([numero_documento_residente] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [CK_numero_documento_residente]

GO



/*
# [CK_telefono_residente]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [CK_telefono_residente] CHECK  (([telefono_residente] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [CK_telefono_residente]

GO



/*
# [CK_tipo_documento_residente]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [CK_tipo_documento_residente] CHECK  ((NOT [tipo_documento_residente] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [CK_tipo_documento_residente]

GO



/*
# [CK_tipo_residente]
*/

ALTER TABLE [dbo].[residentes]  WITH CHECK ADD  CONSTRAINT [CK_tipo_residente] CHECK  (([tipo_residente]='FAMILIAR' OR [tipo_residente]='CONPAÑERO' OR [tipo_residente]='ARRENDATARIO' OR [tipo_residente]='PROPIETARIO'))

GO

ALTER TABLE [dbo].[residentes] CHECK CONSTRAINT [CK_tipo_residente]

GO



/*
# [CHK_DescripcionRol]
*/

ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [CHK_DescripcionRol] CHECK  ((NOT [Descripcion] like '%[^A-Za-z]\s%'))

GO

ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [CHK_DescripcionRol]

GO



/*
# [CHK_NombreRol]
*/

ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [CHK_NombreRol] CHECK  ((NOT [Nombre_Rol] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [CHK_NombreRol]

GO



/*
# [CHK_Apellido]
*/

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [CHK_Apellido] CHECK  ((NOT [Apellido] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [CHK_Apellido]

GO



/*
# [CHK_Contrasena]
*/

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [CHK_Contrasena] CHECK  (([Contrasena] like '%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]%%[A-Za-z0-9]'))

GO

ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [CHK_Contrasena]

GO



/*
# [CHK_Correo]
*/

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [CHK_Correo] CHECK  (([Correo] like '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com'))

GO

ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [CHK_Correo]

GO



/*
# [CHK_Documento]
*/

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [CHK_Documento] CHECK  (([Documento] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [CHK_Documento]

GO



/*
# [CHK_Nombre]
*/

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [CHK_Nombre] CHECK  ((NOT [Nombre] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [CHK_Nombre]

GO



/*
# [CHK_Telefono]
*/

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [CHK_Telefono] CHECK  (([Telefono] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [CHK_Telefono]

GO



/*
# [CHK_Tipo]
*/

ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [CHK_Tipo] CHECK  ((NOT [Tipo_documento] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [CHK_Tipo]

GO



/*
# [CHK_vehiculo]
*/

ALTER TABLE [dbo].[vehiculos]  WITH CHECK ADD  CONSTRAINT [CHK_vehiculo] CHECK  (([Placa] like '[a-Z]{3}-[0-9]{3]' OR [Placa] like '[a-Z]{3]-[0-9]{2}[a-Z]'))

GO

ALTER TABLE [dbo].[vehiculos] CHECK CONSTRAINT [CHK_vehiculo]

GO



/*
# [CHK_Document]
*/

ALTER TABLE [dbo].[Vigilante]  WITH CHECK ADD  CONSTRAINT [CHK_Document] CHECK  (([Documento] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[Vigilante] CHECK CONSTRAINT [CHK_Document]

GO



/*
# [CHK_edad]
*/

ALTER TABLE [dbo].[Vigilante]  WITH CHECK ADD  CONSTRAINT [CHK_edad] CHECK  (([Edad] like '[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[Vigilante] CHECK CONSTRAINT [CHK_edad]

GO



/*
# [CHK_NombreVigilante]
*/

ALTER TABLE [dbo].[Vigilante]  WITH CHECK ADD  CONSTRAINT [CHK_NombreVigilante] CHECK  ((NOT [Nombre_Vigilante] like '%[^A-Za-z]\s%'))

GO

ALTER TABLE [dbo].[Vigilante] CHECK CONSTRAINT [CHK_NombreVigilante]

GO



/*
# [CHK_Telefonovig]
*/

ALTER TABLE [dbo].[Vigilante]  WITH CHECK ADD  CONSTRAINT [CHK_Telefonovig] CHECK  (([Telefono] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[Vigilante] CHECK CONSTRAINT [CHK_Telefonovig]

GO



/*
# [CHK_Tipod]
*/

ALTER TABLE [dbo].[Vigilante]  WITH CHECK ADD  CONSTRAINT [CHK_Tipod] CHECK  ((NOT [Tipo_documento] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[Vigilante] CHECK CONSTRAINT [CHK_Tipod]

GO



/*
# [CK_apellido_visitante]
*/

ALTER TABLE [dbo].[visitantes]  WITH CHECK ADD  CONSTRAINT [CK_apellido_visitante] CHECK  ((NOT [apellido_visitante] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[visitantes] CHECK CONSTRAINT [CK_apellido_visitante]

GO



/*
# [CK_correo_visitante]
*/

ALTER TABLE [dbo].[visitantes]  WITH CHECK ADD  CONSTRAINT [CK_correo_visitante] CHECK  (([correo_visitante] like '%[A-Za-z0-9]%@%[A-Za-z0-9]%.com'))

GO

ALTER TABLE [dbo].[visitantes] CHECK CONSTRAINT [CK_correo_visitante]

GO



/*
# [CK_edad_visitante]
*/

ALTER TABLE [dbo].[visitantes]  WITH CHECK ADD  CONSTRAINT [CK_edad_visitante] CHECK  (([edad_visitante]>=(0)))

GO

ALTER TABLE [dbo].[visitantes] CHECK CONSTRAINT [CK_edad_visitante]

GO



/*
# [CK_estado_visitante]
*/

ALTER TABLE [dbo].[visitantes]  WITH CHECK ADD  CONSTRAINT [CK_estado_visitante] CHECK  (([estado_visitante]='INACTIVO' OR [estado_visitante]='ACTIVO'))

GO

ALTER TABLE [dbo].[visitantes] CHECK CONSTRAINT [CK_estado_visitante]

GO



/*
# [CK_genero_visitante]
*/

ALTER TABLE [dbo].[visitantes]  WITH CHECK ADD  CONSTRAINT [CK_genero_visitante] CHECK  (([genero_visitante]='OTRO' OR [genero_visitante]='M' OR [genero_visitante]='F'))

GO

ALTER TABLE [dbo].[visitantes] CHECK CONSTRAINT [CK_genero_visitante]

GO



/*
# [CK_nombre_visitante]
*/

ALTER TABLE [dbo].[visitantes]  WITH CHECK ADD  CONSTRAINT [CK_nombre_visitante] CHECK  ((NOT [nombre_visitante] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[visitantes] CHECK CONSTRAINT [CK_nombre_visitante]

GO



/*
# [CK_numero_documento_visitante]
*/

ALTER TABLE [dbo].[visitantes]  WITH CHECK ADD  CONSTRAINT [CK_numero_documento_visitante] CHECK  (([numero_documento_visitante] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[visitantes] CHECK CONSTRAINT [CK_numero_documento_visitante]

GO



/*
# [CK_telefono_visitante]
*/

ALTER TABLE [dbo].[visitantes]  WITH CHECK ADD  CONSTRAINT [CK_telefono_visitante] CHECK  (([telefono_visitante] like '[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]%[0-9]'))

GO

ALTER TABLE [dbo].[visitantes] CHECK CONSTRAINT [CK_telefono_visitante]

GO



/*
# [CK_tipo_documento_visitante]
*/

ALTER TABLE [dbo].[visitantes]  WITH CHECK ADD  CONSTRAINT [CK_tipo_documento_visitante] CHECK  ((NOT [tipo_documento_visitante] like '%[^A-Za-z]%'))

GO

ALTER TABLE [dbo].[visitantes] CHECK CONSTRAINT [CK_tipo_documento_visitante]

GO



/*
# [CK_estado_visita]
*/

ALTER TABLE [dbo].[visitas]  WITH CHECK ADD  CONSTRAINT [CK_estado_visita] CHECK  (([estado_visita]='RESIVIDA' OR [estado_visita]='TERMINADA' OR [estado_visita]='PENDIENTE'))

GO

ALTER TABLE [dbo].[visitas] CHECK CONSTRAINT [CK_estado_visita]

GO



/*
# [APPTOWER]
*/

USE [master]

GO



ALTER DATABASE [APPTOWER] SET  READ_WRITE 

GO

