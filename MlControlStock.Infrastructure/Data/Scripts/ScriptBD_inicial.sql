IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'FundaGes')
  BEGIN
    CREATE DATABASE FundaGes
  END
USE [FundaGes]
GO
/****** Object:  Table [dbo].[actas]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actas](
	[id] [bigint] NULL,
	[usuarioCreador] [nvarchar](50) NULL,
	[numeroSerieBrucelosis] [nvarchar](50) NULL,
	[observaciones] [nvarchar](255) NULL,
	[estaPaga] [bit] NULL,
	[numeroSerie] [nvarchar](50) NULL,
	[renspa] [nvarchar](255) NULL,
	[codigo] [nvarchar](50) NOT NULL,
	[campaniaCarga] [nvarchar](50) NULL,
	[carbunclo] [bit] NULL,
	[cantidadDosis] [int] NULL,
	[cantidadBubVacunadosBrucelosis] [int] NULL,
	[dosisBrucelosis] [int] NULL,
	[requiereConfirmacion] [bit] NULL,
	[fechaCarbunclo] [datetime2](7) NULL,
	[vacuna] [nvarchar](255) NULL,
	[esActaTotal] [bit] NULL,
	[fechaConfirmacion] [datetime2](7) NULL,
	[cantidadVacunadosBrucelosis] [int] NULL,
	[vacunador] [nvarchar](255) NULL,
	[fechaVacunacion] [datetime2](7) NULL,
	[usuarioAnulacion] [nvarchar](255) NULL,
	[vacunaBrucelosis] [nvarchar](255) NULL,
	[fechaCarga] [datetime2](7) NULL,
	[anulada] [bit] NULL,
	[usuarioConfirmacion] [nvarchar](50) NULL,
	[fundacion_id] [int] NULL,
	[estado] [int] NULL,
	[Identificacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_actas] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actas_animales]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actas_animales](
	[actas_codigo] [nvarchar](50) NOT NULL,
	[animales_id] [int] NOT NULL,
	[cantidad] [int] NULL,
	[animales_nombre] [nvarchar](50) NULL,
	[animales_codigo] [nvarchar](10) NULL,
 CONSTRAINT [PK_actas_animales_1] PRIMARY KEY CLUSTERED 
(
	[actas_codigo] ASC,
	[animales_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actas_animales_ddjj]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actas_animales_ddjj](
	[actas_codigo] [nvarchar](50) NOT NULL,
	[animales_id] [int] NOT NULL,
	[cantidad] [int] NULL,
	[animales_nombre] [nvarchar](50) NULL,
	[animales_codigo] [nvarchar](10) NULL,
 CONSTRAINT [PK_actas_animales_ddjj] PRIMARY KEY CLUSTERED 
(
	[actas_codigo] ASC,
	[animales_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animales]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animales](
	[Codigo] [nvarchar](10) NOT NULL,
	[EspecieID] [int] NULL,
	[Nombre] [nvarchar](255) NULL,
	[Orden] [int] NULL,
	[UM_id] [int] NULL,
	[UM_codigo] [int] NULL,
	[UM_nombre] [nvarchar](255) NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK__Animales__06370DAD35F54004] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campañas]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campañas](
	[anio] [int] NULL,
	[codigo] [nvarchar](50) NOT NULL,
	[vacunaSoloDeRiesgo] [bit] NULL,
	[numeroCampania] [int] NULL,
	[inicio] [datetime2](7) NULL,
	[planDeVacunacion] [nvarchar](50) NULL,
	[esDeMenores] [bit] NULL,
	[fin] [datetime2](7) NULL,
 CONSTRAINT [PK_Campañas] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especies]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especies](
	[id] [int] NOT NULL,
	[Codigo] [int] NULL,
	[Nombre] [nvarchar](255) NULL,
 CONSTRAINT [PK__Especies__3213E83FC0A6BAE9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Establecimiento]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Establecimiento](
	[id] [nvarchar](50) NOT NULL,
	[titular] [nvarchar](150) NULL,
	[fundacion_id] [int] NULL,
	[nombre] [nvarchar](150) NULL,
 CONSTRAINT [PK_Establecimiento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fundaciones]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fundaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[fecha_creacion] [datetime2](7) NULL,
	[cuit] [nvarchar](50) NULL,
	[token_senasa] [nvarchar](500) NULL,
	[wsUsername] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[heladeras]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[heladeras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[fundacion_id] [int] NULL,
	[subcentro_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[miembros_fundacion]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[miembros_fundacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[fecha_creacion] [datetime2](7) NULL,
	[cuit] [nvarchar](50) NULL,
	[token_senasa] [nvarchar](500) NULL,
	[usuario_id] [int] NULL,
	[fundacion_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[renspas]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[renspas](
	[renspa] [nvarchar](50) NOT NULL,
	[establecimiento_id] [nvarchar](50) NULL,
	[superficie] [int] NULL,
	[provincia] [nvarchar](70) NULL,
	[partido] [nvarchar](150) NULL,
	[vacas] [int] NULL,
	[vaquillonas] [int] NULL,
	[novillos] [int] NULL,
	[novillitos] [int] NULL,
	[terneras] [int] NULL,
	[terneros] [int] NULL,
	[toros] [int] NULL,
	[toritos] [int] NULL,
	[bueyes] [int] NULL,
	[total_bovinos] [int] NULL,
	[latitud] [decimal](10, 8) NULL,
	[longitud] [decimal](10, 8) NULL,
	[codigo_plan] [int] NULL,
	[fundacion_id] [int] NULL,
	[titular] [nvarchar](150) NULL,
 CONSTRAINT [PK_renspas] PRIMARY KEY CLUSTERED 
(
	[renspa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subcentros]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subcentros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[fundacion_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_identificacion]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_identificacion](
	[id] [nvarchar](5) NULL,
	[value] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_usuario]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [nvarchar](255) NULL,
	[fecha_creacion] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turnos]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turnos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estado] [int] NULL,
	[fecha_turno_vacunacion] [datetime2](7) NULL,
	[hora_turno_vacunacion] [datetime2](7) NULL,
	[fecha_creacion] [datetime2](7) NULL,
	[fundacion_id] [int] NULL,
	[vacunador_id] [int] NULL,
	[cant_aftosa] [int] NULL,
	[cant_bruselosis] [int] NULL,
	[usuario_creador] [int] NULL,
	[establecimiento_id] [nvarchar](50) NULL,
	[fundacion_cuit] [nvarchar](50) NULL,
	[vacunador_cuit] [nvarchar](50) NULL,
	[vacunador_nombre] [nvarchar](255) NULL,
	[establecimiento_nombre] [nvarchar](150) NULL,
 CONSTRAINT [PK__turnos__3213E83F8CA98969] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turnos_renspas]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turnos_renspas](
	[turnos_id] [int] NOT NULL,
	[renspas_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_turnos_renspas] PRIMARY KEY CLUSTERED 
(
	[turnos_id] ASC,
	[renspas_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turnos_vacunas]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turnos_vacunas](
	[turnos_id] [int] NULL,
	[vacunas_stock_id] [int] NOT NULL,
	[cantidad_entregada] [int] NULL,
	[temperatura_salida] [decimal](18, 0) NULL,
	[fecha_devolucion] [datetime2](7) NULL,
	[cantidad_devolucion] [int] NULL,
	[temperatura_devolucion] [decimal](18, 0) NULL,
	[fundacion_id] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_entrega] [datetime2](7) NULL,
	[vacunador_cuit] [nvarchar](50) NULL,
	[vacunador_nombre] [nvarchar](255) NULL,
 CONSTRAINT [PK_turnos_vacunas_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](255) NULL,
	[pass] [nvarchar](255) NULL,
	[fecha_creacion] [datetime2](7) NULL,
	[tipo_usuario] [int] NULL,
	[fundacion_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacunadores]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacunadores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NULL,
	[fecha_creacion] [datetime2](7) NULL,
	[cuit] [nvarchar](50) NULL,
	[token_senasa] [nvarchar](500) NULL,
	[usuario_id] [int] NULL,
	[fundacion_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacunas]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacunas](
	[id] [int] NOT NULL,
	[codigo] [nvarchar](50) NULL,
	[identificador] [nvarchar](10) NULL,
	[marca] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK__tipos_va__3213E83FE4C600F9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vacunas_stock]    Script Date: 8/10/2021 21:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vacunas_stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vacunas_id] [int] NULL,
	[estado_id] [int] NULL,
	[fecha_creacion] [datetime2](7) NULL,
	[heladera_id] [int] NULL,
	[cantidad] [int] NULL,
	[partida] [int] NULL,
	[fundacion_id] [int] NULL,
	[subcentro_id] [int] NULL,
	[fecha_vencimiento] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'01.01', 51, N'Vaca', 1, 51, 1001, N'Rodeo', 7)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'01.04', 51, N'Novillito', 4, 51, 1001, N'Rodeo', 8)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'02.01', 101, N'Carnero', 1, 51, 1001, N'Rodeo', 9)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'02.02', 101, N'Oveja', 2, 51, 1001, N'Rodeo', 10)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'02.03', 101, N'Borrego/a', 3, 51, 1001, N'Rodeo', 11)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'02.04', 101, N'Capón', 4, 51, 1001, N'Rodeo', 12)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'02.05', 101, N'Cordero/a', 5, 51, 1001, N'Rodeo', 13)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'03.01', 52, N'Padrillo', 1, 51, 1001, N'Rodeo', 14)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'03.02', 52, N'Cerda', 2, 51, 1001, N'Rodeo', 15)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'03.03', 52, N'Lechon', 3, 51, 1001, N'Rodeo', 16)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'03.04', 52, N'Capón/ Hembra sin servicio', 4, 51, 1001, N'Rodeo', 17)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'03.05', 52, N'Cachorro', 5, 51, 1001, N'Rodeo', 18)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'04.01', 8, N'Chivo', 1, 51, 1001, N'Rodeo', 19)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'04.02', 8, N'Cabra', 2, 51, 1001, N'Rodeo', 20)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'04.03', 8, N'Cabrito', 3, 51, 1001, N'Rodeo', 21)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'05.01', 9, N'Padrillo', 1, 51, 1001, N'Rodeo', 22)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'05.02', 9, N'Caballo', 2, 51, 1001, N'Rodeo', 23)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'05.03', 9, N'Yegua', 3, 51, 1001, N'Rodeo', 24)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'05.04', 9, N'Potrillo/a', 4, 51, 1001, N'Rodeo', 25)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'05.05', 9, N'Mula', 5, 51, 1001, N'Rodeo', 26)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'05.06', 9, N'Burro', 6, 51, 1001, N'Rodeo', 27)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'05.07', 9, N'Asno', 7, 51, 1001, N'Rodeo', 28)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.02', 50, N'Reproductores', 2, 100, 1002, N'Grupo', 31)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.03', 50, N'Pollos Parrilleros', 3, 100, 1002, N'Grupo', 34)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.04', 50, N'Gallinas Ponedoras', 4, 100, 1002, N'Grupo', 35)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.05', 50, N'Otras Aves', 5, 100, 1002, N'Grupo', 36)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'07.01', 10, N'Colmenas', 1, 100, 1002, N'Grupo', 37)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'01.03', 51, N'Novillo', 3, 51, 1001, N'Rodeo', 50)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'01.07', 51, N'Toro', 2, 51, 1001, N'Rodeo', 100)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'01.08', 51, N'Bueyes', 8, 51, 1001, N'Rodeo', 101)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'01.02', 51, N'Vaquillona', 5, 51, 1001, N'Rodeo', 200)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'01.05', 51, N'Ternero', 7, 51, 1001, N'Rodeo', 350)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'01.06', 51, N'Ternera', 6, 51, 1001, N'Rodeo', 351)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.06', 50, N'Pollos BB Parrillero', 6, 100, 1002, N'Grupo', 352)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'09.01', 12, N'Vaca', 1, 51, 1001, N'Rodeo', 401)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'09.02', 12, N'Vaquillona', 5, 51, 1001, N'Rodeo', 402)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'09.03', 12, N'Novillo', 3, 51, 1001, N'Rodeo', 403)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'09.04', 12, N'Novillito', 4, 51, 1001, N'Rodeo', 404)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'09.05', 12, N'Ternero', 7, 51, 1001, N'Rodeo', 405)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'09.06', 12, N'Ternera', 6, 51, 1001, N'Rodeo', 406)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'09.07', 12, N'Toro', 2, 51, 1001, N'Rodeo', 407)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'09.08', 12, N'Bueyes', 8, 51, 1001, N'Rodeo', 408)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'08.01', 11, N'Conejos', 1, 50, 1000, N'Cabeza', 409)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.07', 50, N'Pollos BB Ponedora', 7, 100, 1002, N'Grupo', 410)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'14.01', 14, N'Llama Macho', 1, 50, 1000, N'Cabeza', 411)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'14.02', 14, N'Llama Hembra', 2, 50, 1000, N'Cabeza', 412)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'14.03', 14, N'Malton Hembra', 3, 50, 1000, N'Cabeza', 413)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'14.04', 14, N'Malton Macho', 4, 50, 1000, N'Cabeza', 414)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'14.05', 14, N'Teke Hembra', 5, 50, 1000, N'Cabeza', 415)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'14.06', 14, N'Teke Macho', 6, 50, 1000, N'Cabeza', 416)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'04.04', 8, N'Capón', 4, 51, 1001, N'Rodeo', 417)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'04.05', 8, N'Cabrillas/Chivitos', 5, 51, 1001, N'Rodeo', 418)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'19.01', 19, N'Ciervos', 1, 50, 1000, N'Cabeza', 419)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.11', 50, N'Reproductores Abuelos', 8, 100, 1002, N'Grupo', 420)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.12', 50, N'Reproductores BB Abuelos', 9, 100, 1002, N'Grupo', 421)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.13', 50, N'Reproductores Padres Livianos', 10, 100, 1002, N'Grupo', 422)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.14', 50, N'Reproductores BB Padres Livianos', 11, 100, 1002, N'Grupo', 423)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.15', 50, N'Reproductores Padres Pesados', 12, 100, 1002, N'Grupo', 424)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.16', 50, N'Reproductores BB Padres Pesados', 13, 100, 1002, N'Grupo', 425)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.17', 50, N'Patos', 14, 100, 1002, N'Grupo', 426)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.18', 50, N'Gansos', 15, 100, 1002, N'Grupo', 427)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.19', 50, N'Pavos', 16, 100, 1002, N'Grupo', 428)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.20', 50, N'Faisán', 17, 100, 1002, N'Grupo', 431)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.21', 50, N'Codorniz', 18, 100, 1002, N'Grupo', 432)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.22', 50, N'Ñandú', 19, 100, 1002, N'Grupo', 433)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.23', 50, N'Palomas de Deporte', 20, 100, 1002, N'Grupo', 434)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.24', 50, N'Aves Ornamentales', 21, 100, 1002, N'Grupo', 435)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.25', 50, N'Huevos Fértiles', 22, 100, 1002, N'Grupo', 436)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'03.06', 52, N'M.E.I.', 6, 50, 1000, N'Cabeza', 437)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.01', 20, N'Cueros y Pieles Brutas', 1, 2, 1004, N'Unidad/es', 438)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.02', 20, N'Estiércol', 2, 2, 1004, N'Unidad/es', 439)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.03', 20, N'Lana Sucia', 3, 2, 1004, N'Unidad/es', 440)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.04', 20, N'Lana Limpia', 4, 2, 1004, N'Unidad/es', 441)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.05', 20, N'Pelos / Cerdas', 5, 2, 1004, N'Unidad/es', 442)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.06', 20, N'Guano Aviar', 6, 2, 1004, N'Unidad/es', 443)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'07.02', 10, N'Núcleos', 2, 100, 1002, N'Grupo', 448)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'07.03', 10, N'Paquetes', 3, 100, 1002, N'Grupo', 449)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'07.04', 10, N'Reinas', 4, 100, 1002, N'Grupo', 450)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.07', 20, N'Cama de pollo', 7, 2, 1004, N'Unidad/es', 451)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.08', 20, N'Mat. Reproductivo-Semen', 8, 2, 1004, N'Unidad/es', 452)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.09', 20, N'Mat. Reproductivo-Embriones', 9, 2, 1004, N'Unidad/es', 454)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.10', 20, N'Trofeo de caza', 10, 2, 1004, N'Unidad/es', 455)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.11', 20, N'Mat. Reproductivo-Huevo Fértil', 11, 2, 1004, N'Unidad/es', 456)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.01', 53, N'Truchas y Salmones alevinos', 1, 2, 1004, N'Unidad/es', 457)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.02', 53, N'Truchas y Salmones adultos', 2, 2, 1004, N'Unidad/es', 458)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.03', 53, N'Pacú alevino', 3, 2, 1004, N'Unidad/es', 459)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.04', 53, N'Pacú adulto', 4, 2, 1004, N'Unidad/es', 460)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.05', 53, N'Gato alevino', 5, 2, 1004, N'Unidad/es', 461)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.06', 53, N'Gato adulto', 6, 2, 1004, N'Unidad/es', 462)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.07', 53, N'Surubí alevino', 7, 2, 1004, N'Unidad/es', 463)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.08', 53, N'Surubí adulto', 8, 2, 1004, N'Unidad/es', 464)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.09', 53, N'Tilapia alevina', 9, 2, 1004, N'Unidad/es', 465)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.10', 53, N'Tilapia adulta', 10, 2, 1004, N'Unidad/es', 466)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.11', 53, N'Pejerrey alevino', 11, 2, 1004, N'Unidad/es', 467)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.12', 53, N'Pejerrey adulto', 12, 2, 1004, N'Unidad/es', 468)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'01.09', 51, N'Torito/MEJ', 9, 51, 1001, N'Rodeo', 470)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'09.09', 12, N'Torito/MEJ', 9, 51, 1001, N'Rodeo', 471)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.26', 50, N'Pollos Parrilleros - Sin Lote', 23, 100, 1002, N'Grupo', 474)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'03.07', 52, N'Cachorra', 7, 50, 1000, N'Cabeza', 476)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.12', 20, N'Aves muertas', 12, 4, 1005, N'Kg', 478)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.13', 20, N'Guano Caprino', 13, 2, 1004, N'Unidad/es', 479)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.14', 20, N'Pasto fresco/Heno (Tierra del Fuego)', 14, 4, 1005, N'Kg', 481)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'14.07', 14, N'Guanaco Macho', 7, 50, 1000, N'Cabeza', 482)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'14.08', 14, N'Guanaco Hembra', 8, 50, 1000, N'Cabeza', 483)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.13', 53, N'Esturión Alevino', 13, 2, 1004, N'Unidad/es', 486)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.14', 53, N'Esturión Adulto', 14, 2, 1004, N'Unidad/es', 487)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.15', 20, N'Huesos y/o despojos de faena', 15, 4, 1005, N'Kg', 489)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.16', 20, N'Subprod.org.de planta incubación', 16, 4, 1005, N'Kg', 490)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.15', 53, N'Boga', 15, 2, 1004, N'Unidad/es', 491)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'26.16', 53, N'Sabalo', 16, 2, 1004, N'Unidad/es', 492)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.17', 53, N'Salmon de Rio', 17, 2, 1004, N'Unidad/es', 493)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'25.18', 53, N'Dorado', 18, 2, 1004, N'Unidad/es', 494)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'26.19', 53, N'Ovas', 19, 2, 1004, N'Unidad/es', 496)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'26.20', 53, N'Alevinos', 20, 2, 1004, N'Unidad/es', 497)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'26.21', 53, N'Adultos de Engorde', 21, 2, 1004, N'Unidad/es', 498)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'26.22', 53, N'Adultos de Reproducción', 22, 2, 1004, N'Unidad/es', 499)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.27', 50, N'Aves recriadas - Reproductores - Padres pesados', 27, 100, 1002, N'Grupo', 500)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.29', 50, N'Pollas BB Ponedora Blanca', 29, 100, 1002, N'Grupo', 502)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.30', 50, N'Pollas BB Ponedora Color', 30, 100, 1002, N'Grupo', 503)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.31', 50, N'Aves Recriadas - Ponedoras Blancas', 31, 100, 1002, N'Grupo', 504)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.32', 50, N'Aves Recriadas - Ponedoras Color', 32, 100, 1002, N'Grupo', 505)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.33', 50, N'Gallinas Ponedoras Blancas', 33, 100, 1002, N'Grupo', 506)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.34', 50, N'Gallinas Ponedoras Color', 34, 100, 1002, N'Grupo', 507)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.35', 50, N'Reproductores BB - Pro Huerta', 35, 2, 1004, N'Unidad/es', 508)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.36', 50, N'Pollos BB - Pro Huerta', 36, 2, 1004, N'Unidad/es', 509)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.28', 50, N'	Aves Recriadas - Reproductores Padres livianos', 28, 100, 1002, N'Grupo', 510)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'26.23', 53, N'Peces Ornamentales', 23, 2, 1004, N'Unidad/es', 511)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.37', 50, N'Gallinas', 37, 2, 1004, N'Unidad/es', 512)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'06.38', 50, N'Gallos', 38, 2, 1004, N'Unidad/es', 513)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'26.01', 22, N'Machos', 1, 51, 1001, N'Rodeo', 514)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'26.02', 22, N'Hembras', 2, 51, 1001, N'Rodeo', 515)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.17', 20, N'Mat. Reproductivo-Semen Bovino', 17, 2, 1004, N'Unidad/es', 520)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.18', 20, N'Mat. Reproductivo-Semen Ovino', 18, 2, 1004, N'Unidad/es', 521)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.19', 20, N'Mat. Reproductivo-Semen Caprino', 19, 2, 1004, N'Unidad/es', 522)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.20', 20, N'Mat. Reproductivo-Semen Equido', 20, 2, 1004, N'Unidad/es', 523)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.21', 20, N'Mat. Reproductivo-Semen Porcino', 21, 2, 1004, N'Unidad/es', 524)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.22', 20, N'Mat. Reproductivo-Embriones Bovino', 22, 2, 1004, N'Unidad/es', 525)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.23', 20, N'Mat. Reproductivo-Embriones Ovino', 23, 2, 1004, N'Unidad/es', 526)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.24', 20, N'Mat. Reproductivo-Embriones Caprino', 24, 2, 1004, N'Unidad/es', 527)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.25', 20, N'Mat. Reproductivo-Embriones Equido', 25, 2, 1004, N'Unidad/es', 528)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.26', 20, N'Mat. Reproductivo-Embriones Porcino', 26, 2, 1004, N'Unidad/es', 529)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'07.05', 10, N'Envio de Abejas reinas y Obreras acompañantes', 5, 100, 1002, N'Grupo', 530)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'24.27', 20, N'Alza melaria', 24, 2, 1004, N'Unidad/es', 531)
GO
INSERT [dbo].[Animales] ([Codigo], [EspecieID], [Nombre], [Orden], [UM_id], [UM_codigo], [UM_nombre], [id]) VALUES (N'08.02', 11, N'Liebres', 2, 50, 1000, N'Cabeza', 532)
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (8, 4, N'Caprinos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (9, 5, N'Equidos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (10, 7, N'Abejas')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (11, 8, N'Conejos y Piliferos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (12, 9, N'Bubalinos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (14, 14, N'Camelidos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (19, 19, N'Ciervos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (20, 24, N'Productos y subproductos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (22, 26, N'Caninos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (50, 6, N'Aves')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (51, 1, N'Bovinos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (52, 3, N'Porcinos')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (53, 25, N'Peces')
GO
INSERT [dbo].[Especies] ([id], [Codigo], [Nombre]) VALUES (101, 2, N'Ovinos')
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'', N'', NULL, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.005.0.00555', N'GENTILI SERGIO ALEJANDRO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.008.0.00762', N'FERTILO AGROPECUARIA SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00003', N'COSECHAS S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00004', N'MARCOS RUBEN MARCELO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00005', N'FORTE RODOLFO JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00008', N'BORELLO ANA MARIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00011', N'PAGANO GUILLERMO NICOLAS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00013', N'DALMASSO SERGIO OMAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00015', N'MIRETTI RUBEN ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00016', N'FORTE HENRY', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00020', N'EL DESMORONADO SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00025', N'MARTIN CRISTINA GRISELDA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00027', N'FORTE RAUL OSVALDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00028', N'BRUNSWICK S.A.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00029', N'CABALLERO ROBERTO FRANCISCO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00032', N'FRANCISCO TODINO SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00033', N'SCHAN RUBEN HORACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00034', N'VILLA ROBERTO Y VILLA ELISA IRASTORZA DE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00035', N'SALTO MARICEL GRACIELA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00038', N'SAGRADO DANIEL OSCAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00041', N'CERESOLE CARLOS ANGEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00044', N'VOLPINI TERESA LUCIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00045', N'CACHAU HERMANOS S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00046', N'SANCHEZ BELKIS NADINA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00047', N'FORTE ULISES UMBERTO JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00048', N'MARCOS RUBEN MARCELO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00049', N'PETISCO ANTONIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00050', N'GIRAUDO HNOS S R L', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00052', N'SUCESION DE CACHAU JORGE ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00053', N'ARREGUY EDGARDO ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00055', N'PEREZ RICARDO OMAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00056', N'INCHAURRONDO BERNARDINA Y NELLY INCHAURRONDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00058', N'LA ESMERALDA AGROPECUARIA S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00059', N'PEREZ EDGARDO FABIAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00061', N'LA BERTHA SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00062', N'LOPEZ RAUL SEVERO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00063', N'ALBIZU JOSE MANUEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00064', N'ALBIZU MARIA MERCEDES', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00066', N'PORTU CARLOS ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00067', N'INARCO S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00068', N'UGARTEMENDIA ESTER MARTA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00069', N'CALVO ALDO LEANDRO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00070', N'CUELLO & DIVAN S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00071', N'TAMARINDO S A I C F Y A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00072', N'RODRIGUEZ CARLOS EDUARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00074', N'PACHECO NESTOR Y GARCIA NIVIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00075', N'PORTA DORA MARIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00076', N'LAPEYRE SUSANA MARIA Y LAPEYRE ALICIA ANGELICA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00077', N'SALTO CESAR DOMINGO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00078', N'FORTE EVA ESTHER, FORTE LIDIA MARIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00079', N'RAMOS RUBEN OSVALDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00081', N'TORREBASSE HORACIO JORGE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00083', N'QUAGLIA DOMINGO JUAN PEDRO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00085', N'MATA HUGO TOMAS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00087', N'MANDRINI RICARDO VICTOR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00089', N'BATET RAUL JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00090', N'EL ALJIBE SOCIEDAD EN COMANDITA POR ACCIONES', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00092', N'FALKENSTEIN CARLOS JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00093', N'GRANOS DEL OESTE SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00097', N'INCIARTE ADOLFO JULIO MARIA JOSE Y MARIA ALEJANDRA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00099', N'MINETTI OSCAR CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00100', N'DALMASO VICTOR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00102', N'SALTO MARICEL GRACIELA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00103', N'CERESOLE HIPOLITO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00104', N'LEVRA ARIEL ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00105', N'LOS CORRALES S A I G', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00108', N'COSECHAS S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00109', N'ALLENDE MARIA AURELIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00110', N'ZABALA RAUL EDUARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00112', N'SANTA CANDELARIA S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00113', N'SANCHEZ LUIS OSCAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00114', N'FERNANDEZ RUBEN HORACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00115', N'ALVARADO VALENZUELA FEDERICO HERNAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00116', N'FRANCISCO TODINO SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00120', N'AYERRA RICARDO JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00124', N'DOMINGUEZ MARTIN SILVESTRE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00126', N'CHUMFLIN EDUARDO FABRIZIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00130', N'ALBIZU MARCELO RICARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00131', N'TESTA RICARDO ANTONIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00132', N'AGROPECUARIA SANTA INES S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00134', N'RODRIGUEZ HUGO ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00136', N'EL DESCANSO SH DE MALVICINO MAURICIO A. Y TORTONE GLADIS B.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00139', N'ROJAS GABRIEL DAMIAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00140', N'FERRIGNO SANTIAGO Y OBARRIO ESTELA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00143', N'FUENTES NORBERTO HERNAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00145', N'CARILOO SOCIEDAD CIVIL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00146', N'TORTI GUALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00147', N'FERRERO OSCAR RUBEN Y RICARDO SOCIEDAD DE HECHO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00148', N'CERESOLE CARLOS ANGEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00150', N'ESEVICH MARTIN ALEJANDRO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00151', N'LARRABURU ROBERTO TITO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00152', N'VANDONI ANA LUCIA PABLO MAURICIO Y ANA MARIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00153', N'ROSSETTO LILIANA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00154', N'MICHELIS DANIEL EDGARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00155', N'BARRON NORMA LILIAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00158', N'RODRIGUEZ ALBA NELLY', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00160', N'ESTEBAN SERGIO OMAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00161', N'GARCIA MINETTI NORBERTO JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00162', N'PAYERO RICARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00163', N'DE RUSCHI  CRESPO HNOS S.A.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00169', N'PICHI MARA SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00174', N'SINERGIA  AGROPECUARIA   S.A.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00175', N'BORASIO MARIA TERESA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00176', N'TORREBASSE PEDRO E IRENE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00177', N'LARTIRIGOYEN Y CIA S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00182', N'LOS 2 SOLITOS DE FRESCO SERGIO DARIO Y ALVAREZ MANUELA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00187', N'PABLO JOSE VERLINI S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00189', N'LA DORITA S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00190', N'MATA LUIS MARIA, DEL POTRO ELSA GRACIELA Y MATA LUIS IGNACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00195', N'AGRONOR S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00196', N'SANCHEZ JUAN CARLOS Y SANCHEZ MIGUEL ANGEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00197', N'LA BERTHA SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00200', N'SUCESION DE RAUL ITURRI Y OTROS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00201', N'HERNANDEZ RAUL ABEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00202', N'MIGUEL SERGIO FABIAN Y  ZABALA MARIA ANGELICA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00203', N'BOLES GUSTAVO JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00209', N'S A BME GINOCCHIO E HIJOS CIA LTDA  G I F', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00210', N'SUCESION DE ARNAUDO JOSE ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00212', N'SAGRADO ROBERTO OSCAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00213', N'BAZ ENRIQUE GONZALO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00215', N'BORTHIRY GUALTER HUGO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00218', N'SUCESION DE GONZALEZ AURORA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00219', N'ABALOS GRACIELA LUCILA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00221', N'SUCESION DE MARTINEZ ABEL OMAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00224', N'SUCESION DE SALTO CARLOS DOMINGO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00230', N'MARTINEZ ELDA Y MARTIN MARCELA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00231', N'BLANCO JORGE EVANGELINO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00232', N'L. Y O. CIVALERO SRL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00234', N'CAIROLA JORGE A., CAIROLA LISANDRO, CAIROLA LEONELA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00236', N'DON ALFONSO S R L', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00240', N'EL ATARDECER S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00241', N'BORTHIRY GUALTER HUGO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00242', N'BALARI ERNESTO Y ATILIO L', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00244', N'RODRIGUEZ GERMAN MIGUEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00246', N'PECHIN LUIS OSVALDO Y EDUARDO ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00250', N'ARIAGNO ARIEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00253', N'FELIX E MATHET E HIJOS SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00254', N'PAMPAS DE MELAIKE SRL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00255', N'SOCIEDAD ANONIMA AGRICOLA GANADERA SAN LUIS COMERCIAL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00256', N'PAGANO GUILLERMO NICOLAS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00258', N'SUCESION DE BONGIANINO ANTONIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00260', N'HERRERO RICARDO A Y HECTOR R', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00261', N'TOSCAN LUIS ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00264', N'COOPERADORA DE CIENCIAS VETERINARIAS DE LA PAMPA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00267', N'CANONERO HECTOR RUBEN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00270', N'LA DORITA S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00271', N'GANADERA CALDEN SRL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00272', N'BONGIANINO CARLOS OMAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00278', N'PELLEGRINO RICARDO JUAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00279', N'ASQUINI MARIA JIMENA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00280', N'CHICCO EDUARDO MODESTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00281', N'MARTINEZ OSVALDO JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00285', N'SERRANO HUGO CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00286', N'SANCHEZ JUAN CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00287', N'URRUSPURU HNOS SRL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00288', N'SUCESORES DE FALCO HECTOR MIGUEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00289', N'VANINI JOSE RICARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00290', N'BECHER RAUL OSCAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00291', N'SOSA JORGE HECTOR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00295', N'BRUNENGO ULISES EUGENIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00296', N'SUCESION DE MONTANARO JUAN CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00299', N'ESTEBAN MARIO VICTOR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00300', N'ESTEBAN SERGIO OMAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00302', N'LEVRA ARIEL ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00306', N'BARGEL HUGO ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00312', N'MATILLA MARIA GABRIELA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00313', N'RINAUDO EDGARDO RAUL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00314', N'DALMASSO ANGEL B.Y RICARDO A.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00315', N'PORTU CARLOS ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00316', N'VICENTE GUILLERMO JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00317', N'SUCESION DE GAGINO ALBERTO JUAN DOMINGO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00318', N'IRASTORZA MARIA ELENA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00321', N'GRUPO CARNES SANTIAGO SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00323', N'MARCOS RUBEN MARCELO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00327', N'FERRARI MARCELA VERONICA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00328', N'CORRAL ROBERTO, GENARO OFELIA Y CORRAL SERGIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00329', N'GARIALDI SANTIAGO FERNANDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00333', N'BARGEL HUGO ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00334', N'SUCESION DE CAROSIO ROGELIO JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00337', N'URRUSPURU HNOS SRL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00338', N'FARIAS MELINA RAQUEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00339', N'EPIFANIO JORGE ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00340', N'AYERRA ELBA ESTELA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00341', N'ALVAREZ LUIS ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00343', N'SUCESION DE SERRANO OMAR MANUEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00358', N'SUCESION DE LUCERO EDUARDO NICOMEDES', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00361', N'ESTEBAN NORBERTO DANIEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00364', N'BRIZUELA CARLOS MARTIN Y BRIZUELA ALEJANDRA S H', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00365', N'GENARO HECTOR FABIAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00367', N'SUCESION DE PELLEGRINO ABEL LUDOVICO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00368', N'BERANGO IRMA ELSA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00370', N'ISAPAM S R L', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00371', N'LA BERTHA SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00373', N'BORASIO MARIA TERESA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00377', N'SUCESION DE CAROSIO JUAN OSCAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00379', N'GARCIA OSVALDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00381', N'LA ENERGIA S.A.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00382', N'ARRIETA ENRIQUE EDGARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00384', N'SUCESION DE BAUTISTA OMAR ANGEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00385', N'OTERMIN JUAN CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00387', N'SUCESION DE LARANDABURU JUAN CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00388', N'LOS CALDENES AGROPECUARIA  SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00393', N'LA GERONIMA S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00394', N'AGRICOLA CUMECO SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00395', N'FERNANDEZ ATILIO EDUARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00396', N'LOPEZ CASTRO S.A.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00397', N'MAQUIEYRA CARLOS ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00398', N'HOLGADO JOSE MARIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00404', N'LA BERTHA SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00406', N'PEINADO ELADIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00407', N'LEVRA ARIEL ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00408', N'LA VAVIWAL SRL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00410', N'MAMALUMA SRL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00413', N'MORETE RUBEN ROBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00418', N'PAYERO RICARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00421', N'RODRIGUEZ ELSA CARMEN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00422', N'ARREGUY PEDRO J ARREGUY MARGARITA E Y ARREGUY MARIA M', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00423', N'BERTONE JUAN CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00425', N'LA LELA S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00426', N'FORTE HECTOR EDGARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00429', N'LA ESMERALDA AGROPECUARIA S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00435', N'LA BERTHA SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00436', N'ACEBAL LEONARDO JOSE Y JUAN ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00442', N'JACO S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00449', N'MINETTI RUBEN RICARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00451', N'PACHECO AMERICO SIMON Y GARCIA MIRTA ESTHER', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00452', N'FERNANDEZ ATILIO EDUARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00453', N'SUCESION DE IRRAZABAL MARTIN HORACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00454', N'VIOLA OSCAR JUAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00455', N'MARTIN ANTONIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00457', N'AGROPECUARIA LA ESPERANZA S.H. DE LEVRA ESTER A NELIDA N ORL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00458', N'PACHECO NESTOR Y GARCIA NIVIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00459', N'GOROSTIAGA JOSE MARIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00461', N'LOS TIOS SOCIEDAD DE RESPONSABILIDAD LIMITADA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00462', N'BLANCO MARIO ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00464', N'NAVEIRAS ANIBAL JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00467', N'MATA LUIS MARIA, DEL POTRO ELSA GRACIELA Y MATA LUIS IGNACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00473', N'DELGADIN OLGA ALEJANDRA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00479', N'FERNANDEZ ROBERTO RAUL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00480', N'MEDINA RUBEN OSCAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00483', N'CIVIT JUAN MANUEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00485', N'BROWN FELIPE JORGE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00487', N'SIERRA WALTER HARIEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00496', N'TESTA JORGE LUIS Y TESTA CARLOS HORACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00497', N'GIOBANETTONE MARCELO JAVIER', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00500', N'MATILLA CARLOS GUSTAVO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00512', N'DIEZ CESAR LUIS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00514', N'AGROPECUARIA CANGALLO SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00516', N'MEDERO ANDREA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00517', N'SAN JUAN DEL OESTE SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00518', N'HEREDIA JUAN PEDRO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00523', N'PAYERO RICARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00525', N'LARTIRIGOYEN Y CIA S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00538', N'PAMPAMIX S.A.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00541', N'LA MAHUIDA SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00542', N'LAMBERTI ROBERTO OSCAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00547', N'ALBERTO TOBAL S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00552', N'ILARREGUI NELIDA BEATRIZ', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00558', N'TAMBOS Y CABAÑAS LAS CUATRO MARIAS S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00565', N'CISMONDI OLGA MABEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00571', N'PAGANO GUILLERMO NICOLAS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00577', N'TESTA JORGE Y FERNANDEZ SILVIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00588', N'DALMASSO VICTOR HUGO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00593', N'GIRAUDO HNOS S R L', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00595', N'SANCHEZ ADOLFO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00598', N'INGUE ALBERTO OSCAR E INGUE ESTELA MARIA LEAVI DE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00604', N'SUCESION DE MARTIN EDGARDO FELICIANO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00608', N'SANTA CANDELARIA S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00610', N'LEGUIZAMON CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00611', N'MALDONADO JORGE HORACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00614', N'VAQUERO MIGUEL ANGEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00619', N'VILLA ROBERTO Y VILLA ELISA IRASTORZA DE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00631', N'ALVARADO VALENZUELA FEDERICO HERNAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00633', N'LOVIZIO S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00636', N'DON HIPOLITO S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00640', N'LAS MARIAS S.H. DE PAGANO ANA M ZORRILLA MARIA T Y ZORRILLA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00641', N'GIMENEZ ERNESTO ANIBAL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00642', N'ZABALA RAUL EDUARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00643', N'MARCO JUAN ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00644', N'IGLESIAS CELIA ESTER', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00648', N'POMA ROBERTO ENRIQUE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00649', N'YAREGUI MARGARITA LIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00652', N'FIGLIOLI SERGIO JOSE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00656', N'ENTE DE COOPERACION TECNICA Y FINANCIERA DEL SERVICIO PENITENCIARIO FEDERAL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00657', N'FERTILO AGROPECUARIA SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00659', N'MIGUEL GUSTAVO HORACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00660', N'GARCIA LEONARDO SERGIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00664', N'REYNA PABLO MARIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00665', N'SANTA CANDELARIA S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00666', N'PAYERO RICARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00671', N'ALONSO JOSE JAIME', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00674', N'TAMBO TREBOLARES S DE HECHO DE PEDRO JORGE ARREGUY Y RUBEN M', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00681', N'COSECHAS S.R.L.', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00684', N'DELU ALBERTO RAUL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00687', N'ENRIQUEZ JOSE LUIS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00692', N'ACTIS GIORGETTO RICARDO VENANCIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00693', N'FRANCISCO TODINO SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00696', N'URRUTIA JUAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00698', N'GAGLIARDONE ALBERTO ELEUTERIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00699', N'PELLEGRINO RICARDO JUAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00702', N'BAGNATO ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00703', N'AMUNDARAIN SANDRA LILIANA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00704', N'LA COSTURA SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00705', N'LA COSTURA SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00707', N'SUCESION DE RODRIGUEZ OSCAR HORACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00708', N'RODRIGUEZ MIGUEL ANGEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00715', N'PORTU CARLOS ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00716', N'ESTABLECIMIENTO SAN LORENZO S.R.L', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00719', N'SANCHEZ ENRIQUE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00721', N'O''BRIEN EDGARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00727', N'SERVICIOS AGRARIOS SAN JOSE SAS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00743', N'AGRONOR S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00761', N'RAUL SEREN Y JORGE RAUL SEREN SOCIEDAD DE HECHO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00782', N'SUCESION DE SANCHEZ HECTOR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00785', N'O BRIEN GERARDO PATRICIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00786', N'MINETTO RAUL ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00787', N'GONZALEZ SEBASTIAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00800', N'BLANCO PABLO MARTIN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00802', N'LA BERTHA SOCIEDAD ANONIMA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00804', N'AGRICOLA CUMECO SA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00805', N'RODRIGUEZ MIGUEL ANGEL', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00811', N'BROWN FELIPE JORGE', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00814', N'LEVRA ARIEL ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00817', N'DALMASSO CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00819', N'ALBERTO TOBAL S A', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.00822', N'ALONSO JOSE JAIME', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06001', N'FRIAS JAVIER RUBEN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06002', N'SUCESION DE CACHAU JORGE ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06007', N'CABODEVILLA GUSTAVO ADOLFO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06011', N'NILLES JUAN RODOLFO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06012', N'FERREYRA HUGO ALEJANDRO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06013', N'GONELLA RUBEN ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06014', N'MENICHELLI NILDA MARGARITA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06015', N'ANDREOLI HECTOR HORACIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06016', N'VASSALLO NESTOR OMAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06017', N'VASSALLO OMAR ESTEBAN', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06024', N'SOULE JUAN HECTOR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06036', N'AMUNDARAIN SANDRA LILIANA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06038', N'BECERRA JUAN CARLOS', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06039', N'GAMBOA ROQUE ALBERTO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06046', N'TOLEDO CECILIO ', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06047', N'FIGUEROA JULIO CESAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06060', N'LA JOYITA S R L', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06099', N'COOPERADORA DE CIENCIAS VETERINARIAS DE LA PAMPA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06101', N'BONGIANINO CARLOS OMAR', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06106', N'BAUDINO JOSE MARIA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06130', N'GENTILI SERGIO ALEJANDRO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.015.0.06149', N'DALMASSO OBDULIO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.017.0.00007', N'ALBIZU MARCELO RICARDO', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'10.021.0.01007', N'PICCO CRISTINA ALEJANDRA', 1, NULL)
GO
INSERT [dbo].[Establecimiento] ([id], [titular], [fundacion_id], [nombre]) VALUES (N'ID. ESTABLECIMIENTO', N'TITULAR', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[estados] ON 
GO
INSERT [dbo].[estados] ([id], [nombre]) VALUES (1, N'Pendiente')
GO
INSERT [dbo].[estados] ([id], [nombre]) VALUES (2, N'Confirmado')
GO
INSERT [dbo].[estados] ([id], [nombre]) VALUES (3, N'Anulado')
GO
INSERT [dbo].[estados] ([id], [nombre]) VALUES (4, N'Pendiente en Fundación')
GO
INSERT [dbo].[estados] ([id], [nombre]) VALUES (5, N'Confirmada')
GO
INSERT [dbo].[estados] ([id], [nombre]) VALUES (6, N'Anulada')
GO
SET IDENTITY_INSERT [dbo].[estados] OFF
GO
SET IDENTITY_INSERT [dbo].[fundaciones] ON 
GO
INSERT [dbo].[fundaciones] ([id], [nombre], [fecha_creacion], [cuit], [token_senasa], [wsUsername]) VALUES (1, N'FundaGes', CAST(N'2018-01-01T00:00:00.0000000' AS DateTime2), N'33-64402022-9', N'61137e75-f1f5-4cbe-9848-888217dee22f', N'33-64402022-9')

SET IDENTITY_INSERT [dbo].[fundaciones] OFF
GO

SET IDENTITY_INSERT [dbo].[miembros_fundacion] ON 
GO
INSERT [dbo].[miembros_fundacion] ([id], [nombre], [fecha_creacion], [cuit], [token_senasa], [usuario_id], [fundacion_id]) VALUES (1, N'Usuario Fundacion', CAST(N'2021-08-31T16:06:10.4624198' AS DateTime2), N'20-202020-7', N'adasfo2h389nrfs', 29, 6)
GO
INSERT [dbo].[miembros_fundacion] ([id], [nombre], [fecha_creacion], [cuit], [token_senasa], [usuario_id], [fundacion_id]) VALUES (3, N'FundaGes', CAST(N'2021-08-31T16:06:10.4624198' AS DateTime2), N'30-1111111-1', N'$SDFSDG#%6345sdF"!#$56!"RDy3&2TGSDgQasd1"$&', 2, 1)

SET IDENTITY_INSERT [dbo].[miembros_fundacion] OFF 

GO
SET IDENTITY_INSERT [dbo].[miembros_fundacion] OFF
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.005.0.00555/00', N'10.005.0.00555', 100, N'LA PAMPA', N'CONHELO', 101, 0, 0, 0, 26, 8, 0, 0, 0, 135, CAST(-35.83755112 AS Decimal(10, 8)), CAST(-63.94158936 AS Decimal(10, 8)), 206, 1, N'GENTILI SERGIO ALEJANDRO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.008.0.00762/00', N'10.008.0.00762', 500, N'LA PAMPA', N'CHAPALEUFU', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.45069885 AS Decimal(10, 8)), CAST(-63.64844894 AS Decimal(10, 8)), 206, 1, N'FERTILO AGROPECUARIA SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00003/04', N'10.015.0.00003', 448, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.75941849 AS Decimal(10, 8)), CAST(-63.77341080 AS Decimal(10, 8)), 206, 1, N'COSECHAS S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00004/00', N'10.015.0.00004', 300, N'LA PAMPA', N'MARACO', 119, 126, 6, 281, 252, 240, 4, 10, 0, 1038, CAST(-35.58214188 AS Decimal(10, 8)), CAST(-63.44068909 AS Decimal(10, 8)), 206, 1, N'MARCOS RUBEN MARCELO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00005/00', N'10.015.0.00005', 313, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.71335983 AS Decimal(10, 8)), CAST(-63.60625839 AS Decimal(10, 8)), 206, 1, N'FORTE RODOLFO JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00008/00', N'10.015.0.00008', 99, N'LA PAMPA', N'MARACO', 48, 0, 0, 0, 0, 0, 0, 0, 0, 48, CAST(-35.57995987 AS Decimal(10, 8)), CAST(-63.77510071 AS Decimal(10, 8)), 206, 1, N'BORELLO ANA MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00011/01', N'10.015.0.00011', 299, N'LA PAMPA', N'MARACO', 105, 6, 0, 6, 0, 0, 3, 0, 0, 120, CAST(-35.74296951 AS Decimal(10, 8)), CAST(-63.82841873 AS Decimal(10, 8)), 206, 1, N'PAGANO GUILLERMO NICOLAS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00011/02', N'10.015.0.00011', 299, N'LA PAMPA', N'MARACO', 105, 0, 0, 0, 0, 0, 4, 0, 0, 109, CAST(-35.74296951 AS Decimal(10, 8)), CAST(-63.82841873 AS Decimal(10, 8)), 206, 1, N'LAMBERTI ROBERTO OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00013/04', N'10.015.0.00013', 323, N'LA PAMPA', N'MARACO', 0, 0, 10, 55, 0, 57, 0, 0, 0, 122, CAST(-35.82767105 AS Decimal(10, 8)), CAST(-63.88447952 AS Decimal(10, 8)), 206, 1, N'DALMASSO SERGIO OMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00015/00', N'10.015.0.00015', 100, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.77001190 AS Decimal(10, 8)), CAST(-63.92646027 AS Decimal(10, 8)), 206, 1, N'MIRETTI RUBEN ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00015/01', N'10.015.0.00015', 100, N'LA PAMPA', N'MARACO', 0, 0, 15, 39, 0, 252, 0, 0, 0, 306, CAST(-35.77001190 AS Decimal(10, 8)), CAST(-63.92646027 AS Decimal(10, 8)), 206, 1, N'MIRETTI MAURO HERNAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00015/03', N'10.015.0.00015', 100, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 25, 0, 0, 0, 25, CAST(-35.77001190 AS Decimal(10, 8)), CAST(-63.92646027 AS Decimal(10, 8)), 206, 1, N'MIRETTI MARCOS GABRIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00016/02', N'10.015.0.00016', 206, N'LA PAMPA', N'MARACO', 77, 22, 27, 33, 28, 34, 2, 0, 0, 223, CAST(-35.72423172 AS Decimal(10, 8)), CAST(-63.57246017 AS Decimal(10, 8)), 206, 1, N'FORTE HENRY')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00020/01', N'10.015.0.00020', 568, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.75521851 AS Decimal(10, 8)), CAST(-63.38613510 AS Decimal(10, 8)), 206, 1, N'EL DESMORONADO SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00020/03', N'10.015.0.00020', 568, N'LA PAMPA', N'MARACO', 0, 4, 0, 0, 421, 106, 0, 0, 0, 531, CAST(-35.75521851 AS Decimal(10, 8)), CAST(-63.38613510 AS Decimal(10, 8)), 206, 1, N'ALBERTO TOBAL S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00025/07', N'10.015.0.00025', 274, N'LA PAMPA', N'MARACO', 175, 42, 0, 30, 30, 4, 4, 0, 0, 285, CAST(-35.60023117 AS Decimal(10, 8)), CAST(-63.66225052 AS Decimal(10, 8)), 206, 1, N'MARTIN CRISTINA GRISELDA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00027/00', N'10.015.0.00027', 247, N'LA PAMPA', N'MARACO', 26, 6, 9, 13, 2, 2, 1, 0, 0, 59, CAST(-35.88190079 AS Decimal(10, 8)), CAST(-63.82942963 AS Decimal(10, 8)), 206, 1, N'FORTE RAUL OSVALDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00027/03', N'10.015.0.00027', 247, N'LA PAMPA', N'MARACO', 0, 0, 29, 0, 0, 0, 0, 0, 0, 29, CAST(-35.88190079 AS Decimal(10, 8)), CAST(-63.82942963 AS Decimal(10, 8)), 206, 1, N'MASCARO MIGUEL ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00028/00', N'10.015.0.00028', 200, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.62868881 AS Decimal(10, 8)), CAST(-63.87858963 AS Decimal(10, 8)), 206, 1, N'BRUNSWICK S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00029/00', N'10.015.0.00029', 20, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67898178 AS Decimal(10, 8)), CAST(-63.80168533 AS Decimal(10, 8)), 206, 1, N'CABALLERO ROBERTO FRANCISCO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00032/00', N'10.015.0.00032', 879, N'LA PAMPA', N'MARACO', 186, 96, 151, 33, 53, 49, 7, 0, 0, 575, CAST(-35.72409058 AS Decimal(10, 8)), CAST(-63.86425018 AS Decimal(10, 8)), 206, 1, N'FRANCISCO TODINO SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00033/01', N'10.015.0.00033', 173, N'LA PAMPA', N'MARACO', 53, 15, 0, 0, 32, 2, 3, 0, 0, 105, CAST(-35.87403107 AS Decimal(10, 8)), CAST(-63.93450928 AS Decimal(10, 8)), 206, 1, N'SCHAN RUBEN HORACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00033/04', N'10.015.0.00033', 173, N'LA PAMPA', N'MARACO', 0, 0, 79, 61, 0, 518, 0, 0, 0, 658, CAST(-35.87403107 AS Decimal(10, 8)), CAST(-63.93450928 AS Decimal(10, 8)), 206, 1, N'COLTURE II SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00034/00', N'10.015.0.00034', 195, N'LA PAMPA', N'MARACO', 90, 80, 24, 15, 30, 55, 5, 0, 0, 299, CAST(-35.59247971 AS Decimal(10, 8)), CAST(-63.84640884 AS Decimal(10, 8)), 206, 1, N'VILLA ROBERTO Y VILLA ELISA IRASTORZA DE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00035/00', N'10.015.0.00035', 100, N'LA PAMPA', N'MARACO', 58, 27, 50, 23, 0, 13, 3, 0, 0, 174, CAST(-35.69736099 AS Decimal(10, 8)), CAST(-63.90983963 AS Decimal(10, 8)), 206, 1, N'SALTO MARICEL GRACIELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00038/01', N'10.015.0.00038', 374, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.60837936 AS Decimal(10, 8)), CAST(-63.88394165 AS Decimal(10, 8)), 206, 1, N'SAGRADO DANIEL OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00041/00', N'10.015.0.00041', 300, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.49803925 AS Decimal(10, 8)), CAST(-63.88909912 AS Decimal(10, 8)), 206, 1, N'CERESOLE CARLOS ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00044/00', N'10.015.0.00044', 309, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.59494019 AS Decimal(10, 8)), CAST(-63.71697998 AS Decimal(10, 8)), 206, 1, N'VOLPINI TERESA LUCIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00044/06', N'10.015.0.00044', 309, N'LA PAMPA', N'MARACO', 150, 0, 0, 0, 29, 27, 3, 0, 0, 209, CAST(-35.59494019 AS Decimal(10, 8)), CAST(-63.71697998 AS Decimal(10, 8)), 206, 1, N'CASADO VOLPINI ATILIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00045/00', N'10.015.0.00045', 640, N'LA PAMPA', N'MARACO', 668, 155, 0, 1, 0, 0, 16, 17, 0, 857, CAST(-35.81600189 AS Decimal(10, 8)), CAST(-63.62741089 AS Decimal(10, 8)), 206, 1, N'CACHAU HERMANOS S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00046/00', N'10.015.0.00046', 12, N'LA PAMPA', N'MARACO', 5, 0, 1, 2, 0, 0, 0, 0, 0, 8, CAST(-35.68854904 AS Decimal(10, 8)), CAST(-63.79235077 AS Decimal(10, 8)), 206, 1, N'SANCHEZ BELKIS NADINA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00047/00', N'10.015.0.00047', 207, N'LA PAMPA', N'MARACO', 62, 288, 0, 141, 537, 179, 3, 0, 0, 1210, CAST(-35.72345734 AS Decimal(10, 8)), CAST(-63.56023407 AS Decimal(10, 8)), 206, 1, N'FORTE ULISES UMBERTO JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00048/01', N'10.015.0.00048', 185, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54397964 AS Decimal(10, 8)), CAST(-63.57192993 AS Decimal(10, 8)), 206, 1, N'MARCOS RUBEN MARCELO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00049/01', N'10.015.0.00049', 100, N'LA PAMPA', N'MARACO', 20, 3, 0, 0, 9, 9, 1, 0, 0, 42, CAST(-35.71649933 AS Decimal(10, 8)), CAST(-63.81882095 AS Decimal(10, 8)), 206, 1, N'PETISCO ANTONIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00049/02', N'10.015.0.00049', 100, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.71649933 AS Decimal(10, 8)), CAST(-63.81882095 AS Decimal(10, 8)), 206, 1, N'SALINAS ROSARIO FILANOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00050/00', N'10.015.0.00050', 400, N'LA PAMPA', N'MARACO', 158, 0, 1, 0, 71, 2, 5, 0, 0, 237, CAST(-35.87712097 AS Decimal(10, 8)), CAST(-63.91260147 AS Decimal(10, 8)), 206, 1, N'GIRAUDO HNOS S R L')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00052/00', N'10.015.0.00052', 355, N'LA PAMPA', N'MARACO', 220, 34, 0, 0, 0, 139, 6, 4, 0, 403, CAST(-35.57567978 AS Decimal(10, 8)), CAST(-63.61046982 AS Decimal(10, 8)), 206, 1, N'SUCESION DE CACHAU JORGE ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00053/04', N'10.015.0.00053', 66, N'LA PAMPA', N'MARACO', 77, 0, 0, 0, 8, 3, 2, 0, 0, 90, CAST(-35.56010056 AS Decimal(10, 8)), CAST(-63.42020035 AS Decimal(10, 8)), 206, 1, N'ARREGUY EDGARDO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00055/00', N'10.015.0.00055', 50, N'LA PAMPA', N'MARACO', 36, 0, 2, 32, 28, 35, 1, 1, 0, 135, CAST(-35.57944870 AS Decimal(10, 8)), CAST(-63.80624008 AS Decimal(10, 8)), 206, 1, N'PEREZ RICARDO OMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00055/04', N'10.015.0.00055', 50, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.57944870 AS Decimal(10, 8)), CAST(-63.80624008 AS Decimal(10, 8)), 206, 1, N'BERTOZZI ANA MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00056/00', N'10.015.0.00056', 185, N'LA PAMPA', N'MARACO', 74, 0, 0, 0, 23, 4, 2, 0, 0, 103, CAST(-35.55036163 AS Decimal(10, 8)), CAST(-63.69118118 AS Decimal(10, 8)), 206, 1, N'INCHAURRONDO BERNARDINA Y NELLY INCHAURRONDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00056/03', N'10.015.0.00056', 185, N'LA PAMPA', N'MARACO', 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, CAST(-35.55036163 AS Decimal(10, 8)), CAST(-63.69118118 AS Decimal(10, 8)), 206, 1, N'MONTELAUQUEN AGROPECUARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00056/04', N'10.015.0.00056', 185, N'LA PAMPA', N'MARACO', 2, 0, 0, 0, 3, 0, 3, 0, 0, 8, CAST(-35.55036163 AS Decimal(10, 8)), CAST(-63.69118118 AS Decimal(10, 8)), 206, 1, N'CARNES DE PIGÜE S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00058/00', N'10.015.0.00058', 17, N'LA PAMPA', N'MARACO', 0, 28, 55, 540, 0, 0, 0, 0, 0, 623, CAST(-35.62556076 AS Decimal(10, 8)), CAST(-63.39727020 AS Decimal(10, 8)), 206, 1, N'LA ESMERALDA AGROPECUARIA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00059/00', N'10.015.0.00059', 245, N'LA PAMPA', N'MARACO', 200, 10, 0, 0, 89, 25, 10, 0, 0, 334, CAST(-35.51609039 AS Decimal(10, 8)), CAST(-63.88275146 AS Decimal(10, 8)), 206, 1, N'PEREZ EDGARDO FABIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00061/00', N'10.015.0.00061', 312, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72420120 AS Decimal(10, 8)), CAST(-63.51699829 AS Decimal(10, 8)), 206, 1, N'LA BERTHA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00061/01', N'10.015.0.00061', 312, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72420120 AS Decimal(10, 8)), CAST(-63.51699829 AS Decimal(10, 8)), 206, 1, N'BUSTINGORRI HNOS SRL AGRICOLA GANADERA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00062/01', N'10.015.0.00062', 292, N'LA PAMPA', N'MARACO', 47, 5, 0, 1, 9, 13, 2, 0, 0, 77, CAST(-35.80023956 AS Decimal(10, 8)), CAST(-63.87680817 AS Decimal(10, 8)), 206, 1, N'LOPEZ RAUL SEVERO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00062/02', N'10.015.0.00062', 292, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.80023956 AS Decimal(10, 8)), CAST(-63.87680817 AS Decimal(10, 8)), 206, 1, N'BARGEL HUGO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00063/00', N'10.015.0.00063', 950, N'LA PAMPA', N'MARACO', 1274, 192, 228, 202, 443, 106, 43, 6, 0, 2494, CAST(-35.85911942 AS Decimal(10, 8)), CAST(-63.68177032 AS Decimal(10, 8)), 206, 1, N'ALBIZU JOSE MANUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00064/00', N'10.015.0.00064', 1150, N'LA PAMPA', N'MARACO', 609, 0, 0, 0, 276, 626, 25, 0, 0, 1536, CAST(-35.85911179 AS Decimal(10, 8)), CAST(-63.68178177 AS Decimal(10, 8)), 206, 1, N'ALBIZU MARIA MERCEDES')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00066/01', N'10.015.0.00066', 306, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72317886 AS Decimal(10, 8)), CAST(-63.47689056 AS Decimal(10, 8)), 206, 1, N'PORTU CARLOS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00066/04', N'10.015.0.00066', 306, N'LA PAMPA', N'MARACO', 5, 0, 0, 0, 13, 9, 0, 0, 0, 27, CAST(-35.72317886 AS Decimal(10, 8)), CAST(-63.47689056 AS Decimal(10, 8)), 206, 1, N'LUCERO LUIS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00066/05', N'10.015.0.00066', 306, N'LA PAMPA', N'MARACO', 198, 41, 0, 0, 6, 0, 10, 0, 0, 255, CAST(-35.72317886 AS Decimal(10, 8)), CAST(-63.47689056 AS Decimal(10, 8)), 206, 1, N'BAZ ENRIQUE GONZALO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00066/07', N'10.015.0.00066', 306, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72317886 AS Decimal(10, 8)), CAST(-63.47689056 AS Decimal(10, 8)), 206, 1, N'BAGNATO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00066/08', N'10.015.0.00066', 306, N'LA PAMPA', N'MARACO', 81, 2, 0, 0, 41, 35, 2, 0, 0, 161, CAST(-35.72317886 AS Decimal(10, 8)), CAST(-63.47689056 AS Decimal(10, 8)), 206, 1, N'VANDONI HUGO SANTIAGO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00067/01', N'10.015.0.00067', 286, N'LA PAMPA', N'MARACO', 0, 0, 146, 0, 0, 0, 0, 0, 0, 146, CAST(-35.73910904 AS Decimal(10, 8)), CAST(-63.82767868 AS Decimal(10, 8)), 206, 1, N'INARCO S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00068/00', N'10.015.0.00068', 200, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.82760620 AS Decimal(10, 8)), CAST(-63.88438034 AS Decimal(10, 8)), 206, 1, N'UGARTEMENDIA ESTER MARTA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00069/03', N'10.015.0.00069', 676, N'LA PAMPA', N'MARACO', 14, 0, 251, 7, 3, 6, 0, 0, 0, 281, CAST(-35.83855057 AS Decimal(10, 8)), CAST(-63.61027908 AS Decimal(10, 8)), 206, 1, N'CALVO ALDO LEANDRO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00070/00', N'10.015.0.00070', 1200, N'LA PAMPA', N'MARACO', 286, 0, 0, 0, 28, 41, 3, 0, 0, 358, CAST(-35.46346664 AS Decimal(10, 8)), CAST(-63.61907959 AS Decimal(10, 8)), 206, 1, N'CUELLO & DIVAN S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00071/01', N'10.015.0.00071', 3902, N'LA PAMPA', N'MARACO', 394, 429, 14, 0, 1, 1852, 15, 0, 0, 2705, CAST(-35.85467148 AS Decimal(10, 8)), CAST(-63.53633881 AS Decimal(10, 8)), 206, 1, N'TAMARINDO S A I C F Y A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00071/07', N'10.015.0.00071', 3902, N'LA PAMPA', N'MARACO', 0, 0, 68, 0, 0, 0, 0, 0, 0, 68, CAST(-35.85467148 AS Decimal(10, 8)), CAST(-63.53633881 AS Decimal(10, 8)), 206, 1, N'LAS TRES CRUCES S A AGROP IND COM FIN E INMOB')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00072/08', N'10.015.0.00072', 98, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67987061 AS Decimal(10, 8)), CAST(-63.92287827 AS Decimal(10, 8)), 206, 1, N'RODRIGUEZ CARLOS EDUARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00074/00', N'10.015.0.00074', 3, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72468948 AS Decimal(10, 8)), CAST(-63.42498016 AS Decimal(10, 8)), 206, 1, N'PACHECO NESTOR Y GARCIA NIVIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00075/01', N'10.015.0.00075', 197, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.61928940 AS Decimal(10, 8)), CAST(-63.84653091 AS Decimal(10, 8)), 206, 1, N'PORTA DORA MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00075/06', N'10.015.0.00075', 197, N'LA PAMPA', N'MARACO', 105, 44, 13, 0, 205, 205, 4, 0, 0, 576, CAST(-35.61928940 AS Decimal(10, 8)), CAST(-63.84653091 AS Decimal(10, 8)), 206, 1, N'ANTAR S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00076/00', N'10.015.0.00076', 670, N'LA PAMPA', N'MARACO', 200, 1, 28, 89, 92, 230, 7, 0, 0, 647, CAST(-35.57036972 AS Decimal(10, 8)), CAST(-63.75651932 AS Decimal(10, 8)), 206, 1, N'LAPEYRE SUSANA MARIA Y LAPEYRE ALICIA ANGELICA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00077/01', N'10.015.0.00077', 339, N'LA PAMPA', N'MARACO', 114, 52, 0, 13, 23, 30, 2, 2, 0, 236, CAST(-35.57933044 AS Decimal(10, 8)), CAST(-63.88280106 AS Decimal(10, 8)), 206, 1, N'SALTO CESAR DOMINGO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00078/00', N'10.015.0.00078', 250, N'LA PAMPA', N'MARACO', 106, 74, 55, 45, 35, 49, 7, 0, 0, 371, CAST(-35.87160110 AS Decimal(10, 8)), CAST(-63.82461929 AS Decimal(10, 8)), 206, 1, N'FORTE EVA ESTHER, FORTE LIDIA MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00079/01', N'10.015.0.00079', 125, N'LA PAMPA', N'MARACO', 35, 6, 0, 3, 12, 12, 1, 0, 0, 69, CAST(-35.74163055 AS Decimal(10, 8)), CAST(-63.71072006 AS Decimal(10, 8)), 206, 1, N'RAMOS RUBEN OSVALDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00081/00', N'10.015.0.00081', 75, N'LA PAMPA', N'MARACO', 112, 75, 55, 45, 32, 63, 4, 0, 0, 386, CAST(-35.67971039 AS Decimal(10, 8)), CAST(-63.90034103 AS Decimal(10, 8)), 206, 1, N'TORREBASSE HORACIO JORGE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00083/00', N'10.015.0.00083', 180, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.82975006 AS Decimal(10, 8)), CAST(-63.85124969 AS Decimal(10, 8)), 206, 1, N'QUAGLIA DOMINGO JUAN PEDRO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00083/01', N'10.015.0.00083', 180, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.82975006 AS Decimal(10, 8)), CAST(-63.85124969 AS Decimal(10, 8)), 206, 1, N'GENARO HECTOR FABIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00083/04', N'10.015.0.00083', 180, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.82975006 AS Decimal(10, 8)), CAST(-63.85124969 AS Decimal(10, 8)), 206, 1, N'SANTA CANDELARIA S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00085/00', N'10.015.0.00085', 203, N'LA PAMPA', N'MARACO', 182, 0, 59, 0, 56, 49, 4, 0, 0, 350, CAST(-35.66564941 AS Decimal(10, 8)), CAST(-63.91553879 AS Decimal(10, 8)), 206, 1, N'MATA HUGO TOMAS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00087/00', N'10.015.0.00087', 1090, N'LA PAMPA', N'MARACO', 137, 0, 145, 317, 0, 173, 7, 0, 0, 779, CAST(-35.82770920 AS Decimal(10, 8)), CAST(-63.82891083 AS Decimal(10, 8)), 206, 1, N'MANDRINI RICARDO VICTOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00089/00', N'10.015.0.00089', 313, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.74153900 AS Decimal(10, 8)), CAST(-63.70391083 AS Decimal(10, 8)), 206, 1, N'BATET RAUL JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00090/00', N'10.015.0.00090', 1581, N'LA PAMPA', N'MARACO', 47, 39, 0, 0, 188, 189, 2, 78, 0, 543, CAST(-35.54478836 AS Decimal(10, 8)), CAST(-63.63267899 AS Decimal(10, 8)), 206, 1, N'EL ALJIBE SOCIEDAD EN COMANDITA POR ACCIONES')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00090/09', N'10.015.0.00090', 1581, N'LA PAMPA', N'MARACO', 27, 0, 0, 0, 182, 190, 0, 33, 0, 432, CAST(-35.54478836 AS Decimal(10, 8)), CAST(-63.63267899 AS Decimal(10, 8)), 206, 1, N'COYOTE CO AGROPECUARIA S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00090/13', N'10.015.0.00090', 1581, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54478836 AS Decimal(10, 8)), CAST(-63.63267899 AS Decimal(10, 8)), 206, 1, N'LOBOCO SOCIEDAD ANONIM')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00090/14', N'10.015.0.00090', 1581, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54478836 AS Decimal(10, 8)), CAST(-63.63267899 AS Decimal(10, 8)), 206, 1, N'CISMONDI ROBERTO LUIS Y SUSANA MABEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00092/00', N'10.015.0.00092', 298, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.79129028 AS Decimal(10, 8)), CAST(-63.82863617 AS Decimal(10, 8)), 206, 1, N'FALKENSTEIN CARLOS JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00092/01', N'10.015.0.00092', 298, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.79129028 AS Decimal(10, 8)), CAST(-63.82863617 AS Decimal(10, 8)), 206, 1, N'AGUADAS ALVEAR SOCIEDAD DE HECHO DE DANIEL ALEJANDRO FALKENS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00093/00', N'10.015.0.00093', 10, N'LA PAMPA', N'MARACO', 303, 204, 378, 789, 53, 521, 14, 0, 0, 2262, CAST(-35.87738037 AS Decimal(10, 8)), CAST(-63.86911011 AS Decimal(10, 8)), 206, 1, N'GRANOS DEL OESTE SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00097/00', N'10.015.0.00097', 596, N'LA PAMPA', N'MARACO', 385, 2, 0, 1, 0, 61, 7, 6, 0, 462, CAST(-35.81542969 AS Decimal(10, 8)), CAST(-63.66252899 AS Decimal(10, 8)), 206, 1, N'INCIARTE ADOLFO JULIO MARIA JOSE Y MARIA ALEJANDRA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00099/00', N'10.015.0.00099', 125, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.49813461 AS Decimal(10, 8)), CAST(-63.88247299 AS Decimal(10, 8)), 206, 1, N'MINETTI OSCAR CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00099/01', N'10.015.0.00099', 125, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.49813461 AS Decimal(10, 8)), CAST(-63.88247299 AS Decimal(10, 8)), 206, 1, N'MINETTI DARIO JAVIER')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00100/00', N'10.015.0.00100', 160, N'LA PAMPA', N'MARACO', 48, 21, 0, 0, 6, 10, 0, 0, 0, 85, CAST(-35.74584961 AS Decimal(10, 8)), CAST(-63.87805939 AS Decimal(10, 8)), 206, 1, N'DALMASO VICTOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00100/01', N'10.015.0.00100', 160, N'LA PAMPA', N'MARACO', 55, 34, 0, 0, 18, 24, 1, 0, 0, 132, CAST(-35.74584961 AS Decimal(10, 8)), CAST(-63.87805939 AS Decimal(10, 8)), 206, 1, N'DALMASSO NESTOR OMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00100/02', N'10.015.0.00100', 160, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.74584961 AS Decimal(10, 8)), CAST(-63.87805939 AS Decimal(10, 8)), 206, 1, N'DALMASSO GUIDO EMANUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00102/01', N'10.015.0.00102', 669, N'LA PAMPA', N'MARACO', 132, 74, 51, 137, 82, 59, 4, 0, 0, 539, CAST(-35.57453156 AS Decimal(10, 8)), CAST(-63.83020020 AS Decimal(10, 8)), 206, 1, N'SALTO MARICEL GRACIELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00102/02', N'10.015.0.00102', 669, N'LA PAMPA', N'MARACO', 0, 2, 10, 4, 0, 0, 0, 0, 0, 16, CAST(-35.57453156 AS Decimal(10, 8)), CAST(-63.83020020 AS Decimal(10, 8)), 206, 1, N'PORTA VICTOR HUGO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00102/03', N'10.015.0.00102', 669, N'LA PAMPA', N'MARACO', 22, 0, 0, 7, 14, 6, 1, 0, 0, 50, CAST(-35.57453156 AS Decimal(10, 8)), CAST(-63.83020020 AS Decimal(10, 8)), 206, 1, N'BLANCO MARIO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00103/00', N'10.015.0.00103', 573, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.88607025 AS Decimal(10, 8)), CAST(-63.79861832 AS Decimal(10, 8)), 206, 1, N'CERESOLE HIPOLITO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00103/01', N'10.015.0.00103', 573, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.88607025 AS Decimal(10, 8)), CAST(-63.79861832 AS Decimal(10, 8)), 206, 1, N'GALLERATTO RAUL H.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00103/02', N'10.015.0.00103', 573, N'LA PAMPA', N'MARACO', 204, 87, 0, 20, 45, 73, 10, 0, 0, 439, CAST(-35.88607025 AS Decimal(10, 8)), CAST(-63.79861832 AS Decimal(10, 8)), 206, 1, N'DON HIPOLITO S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00104/00', N'10.015.0.00104', 151, N'LA PAMPA', N'MARACO', 129, 0, 0, 0, 29, 40, 12, 0, 0, 210, CAST(-35.58838654 AS Decimal(10, 8)), CAST(-63.88807297 AS Decimal(10, 8)), 206, 1, N'LEVRA ARIEL ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00105/00', N'10.015.0.00105', 1331, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67935944 AS Decimal(10, 8)), CAST(-63.61991119 AS Decimal(10, 8)), 206, 1, N'LOS CORRALES S A I G')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00108/00', N'10.015.0.00108', 150, N'LA PAMPA', N'MARACO', 0, 52, 399, 127, 0, 676, 0, 0, 0, 1254, CAST(-35.78735352 AS Decimal(10, 8)), CAST(-63.68484116 AS Decimal(10, 8)), 206, 1, N'COSECHAS S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00109/00', N'10.015.0.00109', 9673, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.47660828 AS Decimal(10, 8)), CAST(-63.60363007 AS Decimal(10, 8)), 206, 1, N'ALLENDE MARIA AURELIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00109/04', N'10.015.0.00109', 9673, N'LA PAMPA', N'MARACO', 2521, 984, 924, 0, 468, 161, 280, 0, 0, 5338, CAST(-35.47660828 AS Decimal(10, 8)), CAST(-63.60363007 AS Decimal(10, 8)), 206, 1, N'ALLENDE GINOCCHIO AGRO S.A.U.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00110/01', N'10.015.0.00110', 463, N'LA PAMPA', N'MARACO', 225, 180, 175, 50, 46, 79, 10, 0, 0, 765, CAST(-35.49821091 AS Decimal(10, 8)), CAST(-63.86138153 AS Decimal(10, 8)), 206, 1, N'ZABALA RAUL EDUARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00112/00', N'10.015.0.00112', 54, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63528824 AS Decimal(10, 8)), CAST(-63.80990982 AS Decimal(10, 8)), 206, 1, N'SANTA CANDELARIA S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00113/01', N'10.015.0.00113', 202, N'LA PAMPA', N'MARACO', 78, 60, 0, 0, 3, 0, 2, 0, 0, 143, CAST(-35.90459061 AS Decimal(10, 8)), CAST(-63.93146133 AS Decimal(10, 8)), 206, 1, N'SANCHEZ LUIS OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00114/00', N'10.015.0.00114', 8, N'LA PAMPA', N'MARACO', 8, 0, 0, 0, 3, 4, 1, 0, 0, 16, CAST(-35.78517914 AS Decimal(10, 8)), CAST(-63.71475983 AS Decimal(10, 8)), 206, 1, N'FERNANDEZ RUBEN HORACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00115/00', N'10.015.0.00115', 390, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.74755859 AS Decimal(10, 8)), CAST(-63.73300171 AS Decimal(10, 8)), 206, 1, N'ALVARADO VALENZUELA FEDERICO HERNAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00116/00', N'10.015.0.00116', 625, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54367065 AS Decimal(10, 8)), CAST(-63.78588867 AS Decimal(10, 8)), 206, 1, N'FRANCISCO TODINO SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00120/00', N'10.015.0.00120', 783, N'LA PAMPA', N'MARACO', 173, 48, 0, 84, 40, 0, 2, 2, 0, 349, CAST(-35.57402039 AS Decimal(10, 8)), CAST(-63.54272842 AS Decimal(10, 8)), 206, 1, N'AYERRA RICARDO JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00124/01', N'10.015.0.00124', 1559, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.76271057 AS Decimal(10, 8)), CAST(-63.61534119 AS Decimal(10, 8)), 206, 1, N'DOMINGUEZ MARTIN SILVESTRE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00124/06', N'10.015.0.00124', 1559, N'LA PAMPA', N'MARACO', 618, 148, 1537, 880, 591, 1067, 26, 0, 0, 4867, CAST(-35.76271057 AS Decimal(10, 8)), CAST(-63.61534119 AS Decimal(10, 8)), 206, 1, N'BARRANCAS DEL SUR S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00124/08', N'10.015.0.00124', 1559, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.76271057 AS Decimal(10, 8)), CAST(-63.61534119 AS Decimal(10, 8)), 206, 1, N'LA FAMILIA S H  DE OSVALDO ANIBAL PASCUAL Y MARIANO JOSE PAS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00126/01', N'10.015.0.00126', 300, N'LA PAMPA', N'MARACO', 192, 0, 0, 0, 6, 29, 6, 0, 0, 233, CAST(-35.85301971 AS Decimal(10, 8)), CAST(-63.87382889 AS Decimal(10, 8)), 206, 1, N'CHUMFLIN EDUARDO FABRIZIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00130/02', N'10.015.0.00130', 414, N'LA PAMPA', N'MARACO', 1313, 165, 3, 53, 409, 321, 46, 0, 0, 2310, CAST(-35.87807846 AS Decimal(10, 8)), CAST(-63.66204071 AS Decimal(10, 8)), 206, 1, N'ALBIZU MARCELO RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00130/11', N'10.015.0.00130', 414, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.87807846 AS Decimal(10, 8)), CAST(-63.66204071 AS Decimal(10, 8)), 206, 1, N'CASTIÑEIRA CARINA ANDREA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00130/12', N'10.015.0.00130', 414, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.87807846 AS Decimal(10, 8)), CAST(-63.66204071 AS Decimal(10, 8)), 206, 1, N'CASTIÑEIRA JORGE RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00131/00', N'10.015.0.00131', 132, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.76845169 AS Decimal(10, 8)), CAST(-63.84848022 AS Decimal(10, 8)), 206, 1, N'TESTA RICARDO ANTONIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/02', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 0, 133, 22, 0, 0, 0, 0, 0, 0, 155, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'AGROPECUARIA SANTA INES S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/07', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 147, 160, 209, 0, 558, 586, 9, 0, 0, 1669, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'LOS BOULLON AGROPECUARIA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/12', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'GILARDENGHI GUILLERMO RUBEN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/20', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'DOS MAS DOS S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/21', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'CASTIÑEIRA CARINA ANDREA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/22', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'CASTIÑEIRA JORGE RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/23', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'INVEMAR SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/24', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'JUMANA HNOS SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/25', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'AGROPECUARIA UNICA SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/27', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'LOS CHAÑARES SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00132/28', N'10.015.0.00132', 2550, N'LA PAMPA', N'MARACO', 60, 0, 0, 0, 34, 3, 0, 0, 0, 97, CAST(-35.48897171 AS Decimal(10, 8)), CAST(-63.77225876 AS Decimal(10, 8)), 206, 1, N'MONTERO SILVIO OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00134/00', N'10.015.0.00134', 314, N'LA PAMPA', N'MARACO', 181, 92, 51, 84, 70, 7, 13, 0, 0, 498, CAST(-35.49367142 AS Decimal(10, 8)), CAST(-63.83255005 AS Decimal(10, 8)), 206, 1, N'RODRIGUEZ HUGO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00136/06', N'10.015.0.00136', 182, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.73898697 AS Decimal(10, 8)), CAST(-63.82915115 AS Decimal(10, 8)), 206, 1, N'EL DESCANSO SH DE MALVICINO MAURICIO A. Y TORTONE GLADIS B.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00139/02', N'10.015.0.00139', 7, N'LA PAMPA', N'MARACO', 25, 4, 0, 0, 6, 7, 1, 0, 0, 43, CAST(-35.64661026 AS Decimal(10, 8)), CAST(-63.71910095 AS Decimal(10, 8)), 206, 1, N'ROJAS GABRIEL DAMIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00140/00', N'10.015.0.00140', 704, N'LA PAMPA', N'MARACO', 424, 0, 0, 43, 77, 1, 16, 0, 0, 561, CAST(-35.83202744 AS Decimal(10, 8)), CAST(-63.92392731 AS Decimal(10, 8)), 206, 1, N'FERRIGNO SANTIAGO Y OBARRIO ESTELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00143/00', N'10.015.0.00143', 130, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.58412933 AS Decimal(10, 8)), CAST(-63.80028152 AS Decimal(10, 8)), 206, 1, N'FUENTES NORBERTO HERNAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00145/00', N'10.015.0.00145', 1728, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.89989853 AS Decimal(10, 8)), CAST(-63.51324844 AS Decimal(10, 8)), 206, 1, N'CARILOO SOCIEDAD CIVIL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00145/09', N'10.015.0.00145', 1728, N'LA PAMPA', N'MARACO', 310, 0, 0, 0, 0, 0, 20, 0, 0, 330, CAST(-35.89989853 AS Decimal(10, 8)), CAST(-63.51324844 AS Decimal(10, 8)), 206, 1, N'LA ESTELITA SOCIEDAD ANONIMA AGROPECUARIA Y COMERCIAL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00146/01', N'10.015.0.00146', 380, N'LA PAMPA', N'MARACO', 39, 10, 0, 0, 2, 7, 1, 0, 0, 59, CAST(-35.67758942 AS Decimal(10, 8)), CAST(-63.89899063 AS Decimal(10, 8)), 206, 1, N'TORTI GUALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00146/02', N'10.015.0.00146', 380, N'LA PAMPA', N'MARACO', 38, 7, 0, 0, 1, 7, 2, 0, 0, 55, CAST(-35.67758942 AS Decimal(10, 8)), CAST(-63.89899063 AS Decimal(10, 8)), 206, 1, N'TORTI SILVIA ANGELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00147/00', N'10.015.0.00147', 1170, N'LA PAMPA', N'MARACO', 75, 1, 301, 544, 24, 91, 2, 0, 0, 1038, CAST(-35.79990005 AS Decimal(10, 8)), CAST(-63.90628052 AS Decimal(10, 8)), 206, 1, N'FERRERO OSCAR RUBEN Y RICARDO SOCIEDAD DE HECHO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00147/01', N'10.015.0.00147', 1170, N'LA PAMPA', N'MARACO', 0, 0, 0, 19, 0, 0, 0, 0, 0, 19, CAST(-35.79990005 AS Decimal(10, 8)), CAST(-63.90628052 AS Decimal(10, 8)), 206, 1, N'FERRERO ARIEL GERMAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00148/02', N'10.015.0.00148', 62, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54763031 AS Decimal(10, 8)), CAST(-63.91873932 AS Decimal(10, 8)), 206, 1, N'CERESOLE CARLOS ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00150/01', N'10.015.0.00150', 389, N'LA PAMPA', N'MARACO', 194, 52, 0, 45, 32, 28, 8, 0, 0, 359, CAST(-35.63367081 AS Decimal(10, 8)), CAST(-63.92686081 AS Decimal(10, 8)), 206, 1, N'ESEVICH MARTIN ALEJANDRO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00150/03', N'10.015.0.00150', 389, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63367081 AS Decimal(10, 8)), CAST(-63.92686081 AS Decimal(10, 8)), 206, 1, N'ROSSETTO LILIANA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00150/08', N'10.015.0.00150', 389, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63367081 AS Decimal(10, 8)), CAST(-63.92686081 AS Decimal(10, 8)), 206, 1, N'ESEVICH VICTOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00150/10', N'10.015.0.00150', 389, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63367081 AS Decimal(10, 8)), CAST(-63.92686081 AS Decimal(10, 8)), 206, 1, N'BOERIS LEONARDO LUIS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00151/00', N'10.015.0.00151', 94, N'LA PAMPA', N'MARACO', 28, 10, 0, 0, 19, 10, 1, 1, 0, 69, CAST(-35.63808060 AS Decimal(10, 8)), CAST(-63.82787704 AS Decimal(10, 8)), 206, 1, N'LARRABURU ROBERTO TITO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00152/00', N'10.015.0.00152', 100, N'LA PAMPA', N'MARACO', 120, 0, 0, 0, 49, 60, 2, 0, 0, 231, CAST(-35.67456055 AS Decimal(10, 8)), CAST(-63.72518921 AS Decimal(10, 8)), 206, 1, N'VANDONI ANA LUCIA PABLO MAURICIO Y ANA MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00153/01', N'10.015.0.00153', 100, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63402939 AS Decimal(10, 8)), CAST(-63.93371964 AS Decimal(10, 8)), 206, 1, N'ROSSETTO LILIANA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00153/02', N'10.015.0.00153', 100, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63402939 AS Decimal(10, 8)), CAST(-63.93371964 AS Decimal(10, 8)), 206, 1, N'ESEVICH MARTIN ALEJANDRO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00154/02', N'10.015.0.00154', 160, N'LA PAMPA', N'MARACO', 195, 34, 0, 6, 60, 63, 8, 0, 0, 366, CAST(-35.71892166 AS Decimal(10, 8)), CAST(-63.79108047 AS Decimal(10, 8)), 206, 1, N'MICHELIS DANIEL EDGARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00155/04', N'10.015.0.00155', 313, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72819138 AS Decimal(10, 8)), CAST(-63.44136810 AS Decimal(10, 8)), 206, 1, N'BARRON NORMA LILIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00158/00', N'10.015.0.00158', 536, N'LA PAMPA', N'MARACO', 30, 268, 162, 144, 14, 25, 0, 0, 0, 643, CAST(-35.86404037 AS Decimal(10, 8)), CAST(-63.64009857 AS Decimal(10, 8)), 206, 1, N'RODRIGUEZ ALBA NELLY')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00158/01', N'10.015.0.00158', 536, N'LA PAMPA', N'MARACO', 8, 106, 63, 11, 64, 48, 0, 0, 0, 300, CAST(-35.86404037 AS Decimal(10, 8)), CAST(-63.64009857 AS Decimal(10, 8)), 206, 1, N'GUARIDO JOSE GUSTAVO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00158/02', N'10.015.0.00158', 536, N'LA PAMPA', N'MARACO', 0, 17, 0, 4, 0, 0, 0, 0, 0, 21, CAST(-35.86404037 AS Decimal(10, 8)), CAST(-63.64009857 AS Decimal(10, 8)), 206, 1, N'EL TATA S.A.S.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00160/01', N'10.015.0.00160', 530, N'LA PAMPA', N'MARACO', 264, 54, 0, 0, 159, 165, 0, 0, 0, 642, CAST(-35.72498322 AS Decimal(10, 8)), CAST(-63.62079620 AS Decimal(10, 8)), 206, 1, N'ESTEBAN SERGIO OMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00161/07', N'10.015.0.00161', 184, N'LA PAMPA', N'MARACO', 7, 0, 0, 5, 0, 0, 0, 0, 0, 12, CAST(-35.65690231 AS Decimal(10, 8)), CAST(-63.70962524 AS Decimal(10, 8)), 206, 1, N'GARCIA MINETTI NORBERTO JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00162/01', N'10.015.0.00162', 59, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.64789963 AS Decimal(10, 8)), CAST(-63.78615189 AS Decimal(10, 8)), 206, 1, N'PAYERO RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00162/02', N'10.015.0.00162', 59, N'LA PAMPA', N'MARACO', 9, 0, 0, 0, 0, 0, 1, 0, 0, 10, CAST(-35.64789963 AS Decimal(10, 8)), CAST(-63.78615189 AS Decimal(10, 8)), 206, 1, N'HERRERA MARIO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00163/00', N'10.015.0.00163', 627, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63462067 AS Decimal(10, 8)), CAST(-63.58787918 AS Decimal(10, 8)), 206, 1, N'DE RUSCHI  CRESPO HNOS S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00163/01', N'10.015.0.00163', 627, N'LA PAMPA', N'MARACO', 0, 1314, 0, 0, 0, 0, 0, 0, 0, 1314, CAST(-35.63462067 AS Decimal(10, 8)), CAST(-63.58787918 AS Decimal(10, 8)), 206, 1, N'AGROPECUARIA FIORITO SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00163/02', N'10.015.0.00163', 627, N'LA PAMPA', N'MARACO', 4, 0, 0, 0, 0, 0, 0, 0, 0, 4, CAST(-35.63462067 AS Decimal(10, 8)), CAST(-63.58787918 AS Decimal(10, 8)), 206, 1, N'AGROPECUARIA CANGALLO SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00169/00', N'10.015.0.00169', 197, N'LA PAMPA', N'MARACO', 16, 1, 0, 0, 5, 1, 1, 0, 0, 24, CAST(-35.71517944 AS Decimal(10, 8)), CAST(-63.74657822 AS Decimal(10, 8)), 206, 1, N'PICHI MARA SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00169/06', N'10.015.0.00169', 197, N'LA PAMPA', N'MARACO', 3, 2, 0, 0, 0, 0, 1, 0, 0, 6, CAST(-35.71517944 AS Decimal(10, 8)), CAST(-63.74657822 AS Decimal(10, 8)), 206, 1, N'LUNA EDUARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00174/15', N'10.015.0.00174', 2350, N'LA PAMPA', N'MARACO', 52, 0, 4, 0, 14, 16, 2, 0, 0, 88, CAST(-35.78504944 AS Decimal(10, 8)), CAST(-63.60715103 AS Decimal(10, 8)), 206, 1, N'SINERGIA  AGROPECUARIA   S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00175/00', N'10.015.0.00175', 195, N'LA PAMPA', N'MARACO', 47, 10, 0, 0, 2, 0, 0, 0, 0, 59, CAST(-35.54362488 AS Decimal(10, 8)), CAST(-63.76977539 AS Decimal(10, 8)), 206, 1, N'BORASIO MARIA TERESA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00176/02', N'10.015.0.00176', 88, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.68814087 AS Decimal(10, 8)), CAST(-63.89300919 AS Decimal(10, 8)), 206, 1, N'TORREBASSE PEDRO E IRENE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00177/05', N'10.015.0.00177', 1850, N'LA PAMPA', N'MARACO', 90, 0, 0, 0, 0, 0, 6, 0, 0, 96, CAST(-35.85250092 AS Decimal(10, 8)), CAST(-63.72294998 AS Decimal(10, 8)), 206, 1, N'LARTIRIGOYEN Y CIA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00177/06', N'10.015.0.00177', 1850, N'LA PAMPA', N'MARACO', 174, 0, 0, 0, 0, 0, 0, 0, 0, 174, CAST(-35.85250092 AS Decimal(10, 8)), CAST(-63.72294998 AS Decimal(10, 8)), 206, 1, N'CASTAÑO SEBASTIAN JAVIER')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00177/07', N'10.015.0.00177', 1850, N'LA PAMPA', N'MARACO', 136, 0, 0, 0, 0, 0, 0, 0, 0, 136, CAST(-35.85250092 AS Decimal(10, 8)), CAST(-63.72294998 AS Decimal(10, 8)), 206, 1, N'BILKURA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00182/02', N'10.015.0.00182', 240, N'LA PAMPA', N'MARACO', 93, 14, 1, 0, 16, 8, 4, 0, 0, 136, CAST(-35.62200165 AS Decimal(10, 8)), CAST(-63.89796066 AS Decimal(10, 8)), 206, 1, N'LOS 2 SOLITOS DE FRESCO SERGIO DARIO Y ALVAREZ MANUELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00187/00', N'10.015.0.00187', 650, N'LA PAMPA', N'MARACO', 2, 0, 9, 217, 0, 66, 0, 0, 0, 294, CAST(-35.60622025 AS Decimal(10, 8)), CAST(-63.78488541 AS Decimal(10, 8)), 206, 1, N'PABLO JOSE VERLINI S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00189/00', N'10.015.0.00189', 283, N'LA PAMPA', N'MARACO', 146, 306, 0, 169, 70, 164, 34, 0, 0, 889, CAST(-35.73682785 AS Decimal(10, 8)), CAST(-63.74035645 AS Decimal(10, 8)), 206, 1, N'LA DORITA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00189/01', N'10.015.0.00189', 283, N'LA PAMPA', N'MARACO', 40, 5, 0, 8, 18, 43, 0, 0, 0, 114, CAST(-35.73682785 AS Decimal(10, 8)), CAST(-63.74035645 AS Decimal(10, 8)), 206, 1, N'HERRERO MARIELA A HERRERO ANDREA M Y HERRERO MARIA L S.H.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00189/03', N'10.015.0.00189', 283, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.73682785 AS Decimal(10, 8)), CAST(-63.74035645 AS Decimal(10, 8)), 206, 1, N'ROSIERE RAUL EDUARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00190/00', N'10.015.0.00190', 625, N'LA PAMPA', N'MARACO', 0, 0, 204, 423, 0, 0, 0, 0, 0, 627, CAST(-35.67987061 AS Decimal(10, 8)), CAST(-63.50830841 AS Decimal(10, 8)), 206, 1, N'MATA LUIS MARIA, DEL POTRO ELSA GRACIELA Y MATA LUIS IGNACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00195/03', N'10.015.0.00195', 208, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.50841904 AS Decimal(10, 8)), CAST(-63.60826111 AS Decimal(10, 8)), 206, 1, N'AGRONOR S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00195/07', N'10.015.0.00195', 208, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.50841904 AS Decimal(10, 8)), CAST(-63.60826111 AS Decimal(10, 8)), 206, 1, N'DOMINGUEZ MARTIN SILVESTRE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00195/11', N'10.015.0.00195', 208, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.50841904 AS Decimal(10, 8)), CAST(-63.60826111 AS Decimal(10, 8)), 206, 1, N'BARRANCAS DEL SUR S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00195/13', N'10.015.0.00195', 208, N'LA PAMPA', N'MARACO', 732, 49, 0, 184, 395, 370, 30, 0, 0, 1760, CAST(-35.50841904 AS Decimal(10, 8)), CAST(-63.60826111 AS Decimal(10, 8)), 206, 1, N'SAN JUAN DEL OESTE SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00195/15', N'10.015.0.00195', 208, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.50841904 AS Decimal(10, 8)), CAST(-63.60826111 AS Decimal(10, 8)), 206, 1, N'LA MORENA S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00196/00', N'10.015.0.00196', 83, N'LA PAMPA', N'MARACO', 10, 0, 0, 0, 0, 5, 0, 0, 0, 15, CAST(-35.54356766 AS Decimal(10, 8)), CAST(-63.70570374 AS Decimal(10, 8)), 206, 1, N'SANCHEZ JUAN CARLOS Y SANCHEZ MIGUEL ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00196/01', N'10.015.0.00196', 83, N'LA PAMPA', N'MARACO', 91, 25, 51, 32, 29, 36, 5, 0, 0, 269, CAST(-35.54356766 AS Decimal(10, 8)), CAST(-63.70570374 AS Decimal(10, 8)), 206, 1, N'GALLO HECTOR JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00197/05', N'10.015.0.00197', 470, N'LA PAMPA', N'MARACO', 0, 11, 241, 0, 0, 0, 16, 8, 0, 276, CAST(-35.72515869 AS Decimal(10, 8)), CAST(-63.54228973 AS Decimal(10, 8)), 206, 1, N'LA BERTHA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00200/00', N'10.015.0.00200', 670, N'LA PAMPA', N'MARACO', 172, 40, 0, 38, 40, 40, 4, 0, 0, 334, CAST(-35.51863098 AS Decimal(10, 8)), CAST(-63.71686935 AS Decimal(10, 8)), 206, 1, N'SUCESION DE RAUL ITURRI Y OTROS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00201/02', N'10.015.0.00201', 350, N'LA PAMPA', N'MARACO', 66, 26, 0, 0, 5, 0, 0, 1, 0, 98, CAST(-35.46675110 AS Decimal(10, 8)), CAST(-63.77182007 AS Decimal(10, 8)), 206, 1, N'HERNANDEZ RAUL ABEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00202/00', N'10.015.0.00202', NULL, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54668427 AS Decimal(10, 8)), CAST(-63.71726990 AS Decimal(10, 8)), 206, 1, N'MIGUEL SERGIO FABIAN Y  ZABALA MARIA ANGELICA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00202/01', N'10.015.0.00202', NULL, N'LA PAMPA', N'MARACO', 23, 19, 0, 0, 16, 0, 12, 13, 0, 83, CAST(-35.54668427 AS Decimal(10, 8)), CAST(-63.71726990 AS Decimal(10, 8)), 206, 1, N'GILARDENGHI GUILLERMO RUBEN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00202/02', N'10.015.0.00202', NULL, N'LA PAMPA', N'MARACO', 24, 0, 0, 0, 0, 0, 0, 0, 0, 24, CAST(-35.54668427 AS Decimal(10, 8)), CAST(-63.71726990 AS Decimal(10, 8)), 206, 1, N'MIGUEL SERGIO FABIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00203/04', N'10.015.0.00203', 508, N'LA PAMPA', N'MARACO', 103, 73, 78, 45, 31, 49, 5, 0, 0, 384, CAST(-35.48807144 AS Decimal(10, 8)), CAST(-63.68920135 AS Decimal(10, 8)), 206, 1, N'BOLES GUSTAVO JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00209/15', N'10.015.0.00209', 3975, N'LA PAMPA', N'MARACO', 1393, 716, 63, 45, 545, 660, 79, 0, 0, 3501, CAST(-35.54312134 AS Decimal(10, 8)), CAST(-63.49599838 AS Decimal(10, 8)), 206, 1, N'S A BME GINOCCHIO E HIJOS CIA LTDA  G I F')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00210/00', N'10.015.0.00210', 159, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.64184952 AS Decimal(10, 8)), CAST(-63.73122025 AS Decimal(10, 8)), 206, 1, N'SUCESION DE ARNAUDO JOSE ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00212/00', N'10.015.0.00212', 860, N'LA PAMPA', N'MARACO', 221, 24, 8, 147, 82, 174, 3, 0, 0, 659, CAST(-35.63367844 AS Decimal(10, 8)), CAST(-63.87908173 AS Decimal(10, 8)), 206, 1, N'SAGRADO ROBERTO OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00212/01', N'10.015.0.00212', 860, N'LA PAMPA', N'MARACO', 130, 119, 28, 30, 28, 28, 3, 0, 0, 366, CAST(-35.63367844 AS Decimal(10, 8)), CAST(-63.87908173 AS Decimal(10, 8)), 206, 1, N'SAGRADO DANIEL OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00213/02', N'10.015.0.00213', 309, N'LA PAMPA', N'MARACO', 10, 217, 134, 102, 71, 88, 0, 10, 0, 632, CAST(-35.71488190 AS Decimal(10, 8)), CAST(-63.44115067 AS Decimal(10, 8)), 206, 1, N'BAZ ENRIQUE GONZALO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00213/03', N'10.015.0.00213', 309, N'LA PAMPA', N'MARACO', 0, 11, 5, 4, 0, 0, 0, 0, 0, 20, CAST(-35.71488190 AS Decimal(10, 8)), CAST(-63.44115067 AS Decimal(10, 8)), 206, 1, N'LUCERO LUIS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00213/04', N'10.015.0.00213', 309, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.71488190 AS Decimal(10, 8)), CAST(-63.44115067 AS Decimal(10, 8)), 206, 1, N'MORENO MANUEL ROBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00213/07', N'10.015.0.00213', 309, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.71488190 AS Decimal(10, 8)), CAST(-63.44115067 AS Decimal(10, 8)), 206, 1, N'FRITZ HUGO DANIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00213/10', N'10.015.0.00213', 309, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.71488190 AS Decimal(10, 8)), CAST(-63.44115067 AS Decimal(10, 8)), 206, 1, N'TRANSAGRO DON MANUEL S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00213/11', N'10.015.0.00213', 309, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.71488190 AS Decimal(10, 8)), CAST(-63.44115067 AS Decimal(10, 8)), 206, 1, N'LARANDABURU NORA LILIANA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00213/12', N'10.015.0.00213', 309, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.71488190 AS Decimal(10, 8)), CAST(-63.44115067 AS Decimal(10, 8)), 206, 1, N'KRESS STELLA MARIS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00215/01', N'10.015.0.00215', 120, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.46165848 AS Decimal(10, 8)), CAST(-63.93463898 AS Decimal(10, 8)), 206, 1, N'BORTHIRY GUALTER HUGO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00218/00', N'10.015.0.00218', 164, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.57442093 AS Decimal(10, 8)), CAST(-63.40388107 AS Decimal(10, 8)), 206, 1, N'SUCESION DE GONZALEZ AURORA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00218/01', N'10.015.0.00218', 164, N'LA PAMPA', N'MARACO', 29, 0, 0, 0, 7, 2, 1, 0, 0, 39, CAST(-35.57442093 AS Decimal(10, 8)), CAST(-63.40388107 AS Decimal(10, 8)), 206, 1, N'ORTIZ SANDRA MARCELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00218/02', N'10.015.0.00218', 164, N'LA PAMPA', N'MARACO', 27, 0, 0, 0, 10, 4, 0, 0, 0, 41, CAST(-35.57442093 AS Decimal(10, 8)), CAST(-63.40388107 AS Decimal(10, 8)), 206, 1, N'BENGOCHEA CARLOS MARIANO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00219/00', N'10.015.0.00219', 671, N'LA PAMPA', N'MARACO', 211, 0, 20, 36, 12, 87, 7, 0, 0, 373, CAST(-35.63389587 AS Decimal(10, 8)), CAST(-63.72932816 AS Decimal(10, 8)), 206, 1, N'ABALOS GRACIELA LUCILA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00219/03', N'10.015.0.00219', 671, N'LA PAMPA', N'MARACO', 0, 0, 0, 50, 0, 0, 0, 0, 0, 50, CAST(-35.63389587 AS Decimal(10, 8)), CAST(-63.72932816 AS Decimal(10, 8)), 206, 1, N'BECHER MARIO ALFREDO Y BESCOS JOSE MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00221/00', N'10.015.0.00221', 186, N'LA PAMPA', N'MARACO', 86, 0, 0, 0, 0, 0, 3, 0, 0, 89, CAST(-35.55509949 AS Decimal(10, 8)), CAST(-63.68936920 AS Decimal(10, 8)), 206, 1, N'SUCESION DE MARTINEZ ABEL OMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00221/04', N'10.015.0.00221', 186, N'LA PAMPA', N'MARACO', 94, 14, 0, 0, 36, 14, 4, 0, 0, 162, CAST(-35.55509949 AS Decimal(10, 8)), CAST(-63.68936920 AS Decimal(10, 8)), 206, 1, N'BUTRON JUAN CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00221/06', N'10.015.0.00221', 186, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.55509949 AS Decimal(10, 8)), CAST(-63.68936920 AS Decimal(10, 8)), 206, 1, N'CHIMINELLI RUBEN OSMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00224/00', N'10.015.0.00224', 286, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.50288010 AS Decimal(10, 8)), CAST(-63.74087143 AS Decimal(10, 8)), 206, 1, N'SUCESION DE SALTO CARLOS DOMINGO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00224/07', N'10.015.0.00224', 286, N'LA PAMPA', N'MARACO', 21, 0, 0, 1, 1, 0, 0, 0, 0, 23, CAST(-35.50288010 AS Decimal(10, 8)), CAST(-63.74087143 AS Decimal(10, 8)), 206, 1, N'OLSINA MARIA CRISTINA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00230/03', N'10.015.0.00230', 193, N'LA PAMPA', N'MARACO', 26, 0, 0, 0, 4, 7, 1, 0, 0, 38, CAST(-35.67942047 AS Decimal(10, 8)), CAST(-63.87073135 AS Decimal(10, 8)), 206, 1, N'MARTINEZ ELDA Y MARTIN MARCELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00231/01', N'10.015.0.00231', 99, N'LA PAMPA', N'MARACO', 99, 8, 0, 4, 21, 11, 4, 0, 0, 147, CAST(-35.58789825 AS Decimal(10, 8)), CAST(-63.86920166 AS Decimal(10, 8)), 206, 1, N'BLANCO JORGE EVANGELINO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00232/00', N'10.015.0.00232', 1070, N'LA PAMPA', N'MARACO', 514, 252, 71, 0, 64, 0, 22, 0, 0, 923, CAST(-35.82059097 AS Decimal(10, 8)), CAST(-63.73492050 AS Decimal(10, 8)), 206, 1, N'L. Y O. CIVALERO SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00232/04', N'10.015.0.00232', 1070, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.82059097 AS Decimal(10, 8)), CAST(-63.73492050 AS Decimal(10, 8)), 206, 1, N'LEDEZMA JOSE LUIS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00234/02', N'10.015.0.00234', 615, N'LA PAMPA', N'MARACO', 0, 0, 228, 69, 0, 0, 0, 0, 0, 297, CAST(-35.70463181 AS Decimal(10, 8)), CAST(-63.68997955 AS Decimal(10, 8)), 206, 1, N'CAIROLA JORGE A., CAIROLA LISANDRO, CAIROLA LEONELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00236/00', N'10.015.0.00236', 312, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.52098083 AS Decimal(10, 8)), CAST(-63.77254868 AS Decimal(10, 8)), 206, 1, N'DON ALFONSO S R L')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00236/03', N'10.015.0.00236', 312, N'LA PAMPA', N'MARACO', 66, 2, 1, 1, 122, 7, 20, 13, 0, 232, CAST(-35.52098083 AS Decimal(10, 8)), CAST(-63.77254868 AS Decimal(10, 8)), 206, 1, N'MEDANOS MOROS SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00240/01', N'10.015.0.00240', 870, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.78110123 AS Decimal(10, 8)), CAST(-63.49277115 AS Decimal(10, 8)), 206, 1, N'EL ATARDECER S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00240/26', N'10.015.0.00240', 870, N'LA PAMPA', N'MARACO', 19, 0, 2, 10, 7, 0, 2, 0, 0, 40, CAST(-35.78110123 AS Decimal(10, 8)), CAST(-63.49277115 AS Decimal(10, 8)), 206, 1, N'GENARO DARIO GABRIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00241/01', N'10.015.0.00241', 360, N'LA PAMPA', N'MARACO', 284, 0, 100, 173, 100, 155, 4, 0, 0, 816, CAST(-35.52857971 AS Decimal(10, 8)), CAST(-63.71694183 AS Decimal(10, 8)), 206, 1, N'BORTHIRY GUALTER HUGO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00241/02', N'10.015.0.00241', 360, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.52857971 AS Decimal(10, 8)), CAST(-63.71694183 AS Decimal(10, 8)), 206, 1, N'BORTHIRY HORACIO LUIS Y BORTHIRY GUALTER HUGO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00242/04', N'10.015.0.00242', 525, N'LA PAMPA', N'MARACO', 86, 38, 11, 5, 24, 14, 3, 0, 0, 181, CAST(-35.54238129 AS Decimal(10, 8)), CAST(-63.91172409 AS Decimal(10, 8)), 206, 1, N'BALARI ERNESTO Y ATILIO L')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00244/01', N'10.015.0.00244', NULL, N'LA PAMPA', N'MARACO', 120, 0, 0, 0, 30, 36, 3, 0, 0, 189, CAST(-35.77651978 AS Decimal(10, 8)), CAST(-63.92700958 AS Decimal(10, 8)), 206, 1, N'RODRIGUEZ GERMAN MIGUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00246/01', N'10.015.0.00246', 889, N'LA PAMPA', N'MARACO', 162, 11, 291, 164, 69, 175, 7, 0, 0, 879, CAST(-35.80839157 AS Decimal(10, 8)), CAST(-63.93075943 AS Decimal(10, 8)), 206, 1, N'PECHIN LUIS OSVALDO Y EDUARDO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00246/02', N'10.015.0.00246', 889, N'LA PAMPA', N'MARACO', 0, 145, 0, 0, 0, 0, 0, 0, 0, 145, CAST(-35.80839157 AS Decimal(10, 8)), CAST(-63.93075943 AS Decimal(10, 8)), 206, 1, N'PECHIN GERMAN OSVALDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00250/00', N'10.015.0.00250', 640, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.80699921 AS Decimal(10, 8)), CAST(-63.82820129 AS Decimal(10, 8)), 206, 1, N'ARIAGNO ARIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00253/00', N'10.015.0.00253', 1644, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.81627655 AS Decimal(10, 8)), CAST(-63.44228363 AS Decimal(10, 8)), 206, 1, N'FELIX E MATHET E HIJOS SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00254/00', N'10.015.0.00254', 695, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.68967056 AS Decimal(10, 8)), CAST(-63.42559814 AS Decimal(10, 8)), 206, 1, N'PAMPAS DE MELAIKE SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00254/01', N'10.015.0.00254', 695, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.68967056 AS Decimal(10, 8)), CAST(-63.42559814 AS Decimal(10, 8)), 206, 1, N'SANTA CECILIA AGROPECUARIA SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00254/02', N'10.015.0.00254', 695, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.68967056 AS Decimal(10, 8)), CAST(-63.42559814 AS Decimal(10, 8)), 206, 1, N'LOS ABRILES SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00255/00', N'10.015.0.00255', 3000, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.77006912 AS Decimal(10, 8)), CAST(-63.45272064 AS Decimal(10, 8)), 206, 1, N'SOCIEDAD ANONIMA AGRICOLA GANADERA SAN LUIS COMERCIAL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00255/01', N'10.015.0.00255', 3000, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.77006912 AS Decimal(10, 8)), CAST(-63.45272064 AS Decimal(10, 8)), 206, 1, N'BLANCO ROSALIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00255/11', N'10.015.0.00255', 3000, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.77006912 AS Decimal(10, 8)), CAST(-63.45272064 AS Decimal(10, 8)), 206, 1, N'OTHEGUY HAYDEE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00256/01', N'10.015.0.00256', 200, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.57440948 AS Decimal(10, 8)), CAST(-63.79093170 AS Decimal(10, 8)), 206, 1, N'PAGANO GUILLERMO NICOLAS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00258/00', N'10.015.0.00258', 153, N'LA PAMPA', N'MARACO', 28, 15, 0, 12, 18, 6, 2, 0, 0, 81, CAST(-35.78448105 AS Decimal(10, 8)), CAST(-63.81539917 AS Decimal(10, 8)), 206, 1, N'SUCESION DE BONGIANINO ANTONIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00258/01', N'10.015.0.00258', 153, N'LA PAMPA', N'MARACO', 6, 4, 0, 0, 2, 3, 0, 0, 0, 15, CAST(-35.78448105 AS Decimal(10, 8)), CAST(-63.81539917 AS Decimal(10, 8)), 206, 1, N'SUCESION DE PRIETO OMAR ANGEL ')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00258/02', N'10.015.0.00258', 153, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.78448105 AS Decimal(10, 8)), CAST(-63.81539917 AS Decimal(10, 8)), 206, 1, N'MINETTI RUBEN RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00258/04', N'10.015.0.00258', 153, N'LA PAMPA', N'MARACO', 14, 3, 0, 2, 3, 2, 0, 0, 0, 24, CAST(-35.78448105 AS Decimal(10, 8)), CAST(-63.81539917 AS Decimal(10, 8)), 206, 1, N'TRAVELLA JULIO JESUS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00260/00', N'10.015.0.00260', 448, N'LA PAMPA', N'MARACO', 0, 0, 151, 100, 0, 105, 0, 0, 0, 356, CAST(-35.77539063 AS Decimal(10, 8)), CAST(-63.77336884 AS Decimal(10, 8)), 206, 1, N'HERRERO RICARDO A Y HECTOR R')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00260/02', N'10.015.0.00260', 448, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.77539063 AS Decimal(10, 8)), CAST(-63.77336884 AS Decimal(10, 8)), 206, 1, N'GARCIA JUAN CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00261/01', N'10.015.0.00261', 135, N'LA PAMPA', N'MARACO', 38, 15, 0, 0, 1, 1, 2, 0, 0, 57, CAST(-35.68030167 AS Decimal(10, 8)), CAST(-63.83559036 AS Decimal(10, 8)), 206, 1, N'TOSCAN LUIS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00264/03', N'10.015.0.00264', NULL, N'LA PAMPA', N'MARACO', 33, 93, 0, 44, 17, 0, 1, 0, 0, 188, CAST(-35.63243103 AS Decimal(10, 8)), CAST(-63.74312592 AS Decimal(10, 8)), 206, 1, N'COOPERADORA DE CIENCIAS VETERINARIAS DE LA PAMPA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00267/04', N'10.015.0.00267', 253, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.56361008 AS Decimal(10, 8)), CAST(-63.82727814 AS Decimal(10, 8)), 206, 1, N'CANONERO HECTOR RUBEN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00270/10', N'10.015.0.00270', 10, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65389633 AS Decimal(10, 8)), CAST(-63.73763275 AS Decimal(10, 8)), 206, 1, N'LA DORITA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00270/11', N'10.015.0.00270', 10, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65389633 AS Decimal(10, 8)), CAST(-63.73763275 AS Decimal(10, 8)), 206, 1, N'ROSIERE RAUL EDUARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00270/12', N'10.015.0.00270', 10, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65389633 AS Decimal(10, 8)), CAST(-63.73763275 AS Decimal(10, 8)), 206, 1, N'LAUKUNA SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00270/13', N'10.015.0.00270', 10, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65389633 AS Decimal(10, 8)), CAST(-63.73763275 AS Decimal(10, 8)), 206, 1, N'GONZALEZ ANDRES ENRIQUE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00271/00', N'10.015.0.00271', 17, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.47531509 AS Decimal(10, 8)), CAST(-63.93727493 AS Decimal(10, 8)), 206, 1, N'GANADERA CALDEN SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00271/01', N'10.015.0.00271', 17, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.47531509 AS Decimal(10, 8)), CAST(-63.93727493 AS Decimal(10, 8)), 206, 1, N'RAICES AGROPECUARIAS SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00271/02', N'10.015.0.00271', 17, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.47531509 AS Decimal(10, 8)), CAST(-63.93727493 AS Decimal(10, 8)), 206, 1, N'SALINAS ROSARIO FILANOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00272/00', N'10.015.0.00272', 30, N'LA PAMPA', N'MARACO', 54, 0, 0, 0, 4, 9, 2, 0, 0, 69, CAST(-35.78732300 AS Decimal(10, 8)), CAST(-63.71370697 AS Decimal(10, 8)), 206, 1, N'BONGIANINO CARLOS OMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00278/00', N'10.015.0.00278', 450, N'LA PAMPA', N'MARACO', 156, 121, 40, 93, 15, 14, 3, 0, 0, 442, CAST(-35.53256989 AS Decimal(10, 8)), CAST(-63.71694183 AS Decimal(10, 8)), 206, 1, N'PELLEGRINO RICARDO JUAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00279/00', N'10.015.0.00279', NULL, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67829895 AS Decimal(10, 8)), CAST(-63.73634720 AS Decimal(10, 8)), 206, 1, N'ASQUINI MARIA JIMENA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00280/01', N'10.015.0.00280', 60, N'LA PAMPA', N'MARACO', 48, 13, 0, 24, 0, 0, 1, 0, 0, 86, CAST(-35.66236877 AS Decimal(10, 8)), CAST(-63.72383881 AS Decimal(10, 8)), 206, 1, N'CHICCO EDUARDO MODESTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00281/03', N'10.015.0.00281', 530, N'LA PAMPA', N'MARACO', 202, 36, 0, 27, 17, 25, 7, 0, 0, 314, CAST(-35.81513977 AS Decimal(10, 8)), CAST(-63.53173065 AS Decimal(10, 8)), 206, 1, N'MARTINEZ OSVALDO JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00281/04', N'10.015.0.00281', 530, N'LA PAMPA', N'MARACO', 92, 42, 107, 161, 20, 33, 3, 0, 0, 458, CAST(-35.81513977 AS Decimal(10, 8)), CAST(-63.53173065 AS Decimal(10, 8)), 206, 1, N'MARTINEZ CARLOS DANIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00285/00', N'10.015.0.00285', 455, N'LA PAMPA', N'MARACO', 0, 0, 6, 133, 0, 240, 0, 0, 0, 379, CAST(-35.54412842 AS Decimal(10, 8)), CAST(-63.39907074 AS Decimal(10, 8)), 206, 1, N'SERRANO HUGO CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00285/02', N'10.015.0.00285', 455, N'LA PAMPA', N'MARACO', 0, 0, 164, 40, 0, 20, 0, 2, 0, 226, CAST(-35.54412842 AS Decimal(10, 8)), CAST(-63.39907074 AS Decimal(10, 8)), 206, 1, N'SERRANO ALEJANDRO CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00286/00', N'10.015.0.00286', NULL, N'LA PAMPA', N'MARACO', 110, 5, 0, 0, 17, 8, 4, 0, 0, 144, CAST(-35.55682755 AS Decimal(10, 8)), CAST(-63.80851746 AS Decimal(10, 8)), 206, 1, N'SANCHEZ JUAN CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00287/01', N'10.015.0.00287', 749, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67924118 AS Decimal(10, 8)), CAST(-63.81964874 AS Decimal(10, 8)), 206, 1, N'URRUSPURU HNOS SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00288/00', N'10.015.0.00288', 90, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54460144 AS Decimal(10, 8)), CAST(-63.45674133 AS Decimal(10, 8)), 206, 1, N'SUCESORES DE FALCO HECTOR MIGUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00288/01', N'10.015.0.00288', 90, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54460144 AS Decimal(10, 8)), CAST(-63.45674133 AS Decimal(10, 8)), 206, 1, N'GOROSTIAGA JOSE MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00289/00', N'10.015.0.00289', 34, N'LA PAMPA', N'MARACO', 46, 4, 0, 3, 20, 6, 2, 0, 0, 81, CAST(-35.78676987 AS Decimal(10, 8)), CAST(-63.40475082 AS Decimal(10, 8)), 206, 1, N'VANINI JOSE RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00290/00', N'10.015.0.00290', 90, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.55997849 AS Decimal(10, 8)), CAST(-63.56367874 AS Decimal(10, 8)), 206, 1, N'BECHER RAUL OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00291/00', N'10.015.0.00291', NULL, N'LA PAMPA', N'MARACO', 42, 18, 15, 3, 2, 1, 2, 0, 0, 83, CAST(-35.47786713 AS Decimal(10, 8)), CAST(-63.93167496 AS Decimal(10, 8)), 206, 1, N'SOSA JORGE HECTOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00295/00', N'10.015.0.00295', 272, N'LA PAMPA', N'MARACO', 146, 2, 0, 0, 45, 44, 2, 2, 0, 241, CAST(-35.60150909 AS Decimal(10, 8)), CAST(-63.84609985 AS Decimal(10, 8)), 206, 1, N'BRUNENGO ULISES EUGENIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00296/00', N'10.015.0.00296', 381, N'LA PAMPA', N'MARACO', 21, 21, 10, 8, 10, 4, 0, 0, 0, 74, CAST(-35.74044037 AS Decimal(10, 8)), CAST(-63.92597961 AS Decimal(10, 8)), 206, 1, N'SUCESION DE MONTANARO JUAN CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00296/02', N'10.015.0.00296', 381, N'LA PAMPA', N'MARACO', 16, 37, 5, 10, 29, 64, 0, 0, 0, 161, CAST(-35.74044037 AS Decimal(10, 8)), CAST(-63.92597961 AS Decimal(10, 8)), 206, 1, N'TRUCCO HORACIO RENE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00296/04', N'10.015.0.00296', 381, N'LA PAMPA', N'MARACO', 73, 0, 19, 0, 20, 26, 1, 0, 0, 139, CAST(-35.74044037 AS Decimal(10, 8)), CAST(-63.92597961 AS Decimal(10, 8)), 206, 1, N'VIÑUELA MARTIN MANUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00296/05', N'10.015.0.00296', 381, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.74044037 AS Decimal(10, 8)), CAST(-63.92597961 AS Decimal(10, 8)), 206, 1, N'CIVIT JUAN MANUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00299/00', N'10.015.0.00299', 312, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.78544235 AS Decimal(10, 8)), CAST(-63.49653625 AS Decimal(10, 8)), 206, 1, N'ESTEBAN MARIO VICTOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00300/00', N'10.015.0.00300', 697, N'LA PAMPA', N'MARACO', 880, 399, 58, 901, 803, 503, 51, 0, 0, 3595, CAST(-35.76976013 AS Decimal(10, 8)), CAST(-63.46603012 AS Decimal(10, 8)), 206, 1, N'ESTEBAN SERGIO OMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00300/02', N'10.015.0.00300', 697, N'LA PAMPA', N'MARACO', 5, 1, 0, 0, 3, 2, 0, 0, 0, 11, CAST(-35.76976013 AS Decimal(10, 8)), CAST(-63.46603012 AS Decimal(10, 8)), 206, 1, N'COSTILLA STELLA MARIS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00302/01', N'10.015.0.00302', 210, N'LA PAMPA', N'MARACO', 48, 0, 0, 0, 13, 13, 3, 0, 0, 77, CAST(-35.54333878 AS Decimal(10, 8)), CAST(-63.89788055 AS Decimal(10, 8)), 206, 1, N'LEVRA ARIEL ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00306/01', N'10.015.0.00306', 181, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.79766846 AS Decimal(10, 8)), CAST(-63.73028183 AS Decimal(10, 8)), 206, 1, N'BARGEL HUGO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00312/02', N'10.015.0.00312', 500, N'LA PAMPA', N'MARACO', 2, 11, 0, 7, 0, 0, 0, 0, 0, 20, CAST(-35.79460144 AS Decimal(10, 8)), CAST(-63.42441940 AS Decimal(10, 8)), 206, 1, N'MATILLA MARIA GABRIELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00312/04', N'10.015.0.00312', 500, N'LA PAMPA', N'MARACO', 161, 259, 80, 190, 1185, 446, 0, 0, 0, 2321, CAST(-35.79460144 AS Decimal(10, 8)), CAST(-63.42441940 AS Decimal(10, 8)), 206, 1, N'MATILLA CARLOS GUSTAVO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00312/19', N'10.015.0.00312', 500, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.79460144 AS Decimal(10, 8)), CAST(-63.42441940 AS Decimal(10, 8)), 206, 1, N'SUCESION DE LAVIGNE HECTOR DANIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00313/01', N'10.015.0.00313', 150, N'LA PAMPA', N'MARACO', 30, 0, 0, 0, 15, 10, 1, 0, 0, 56, CAST(-35.46308136 AS Decimal(10, 8)), CAST(-63.90953064 AS Decimal(10, 8)), 206, 1, N'RINAUDO EDGARDO RAUL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00314/00', N'10.015.0.00314', 164, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.84571838 AS Decimal(10, 8)), CAST(-63.93442154 AS Decimal(10, 8)), 206, 1, N'DALMASSO ANGEL B.Y RICARDO A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00314/01', N'10.015.0.00314', 164, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.84571838 AS Decimal(10, 8)), CAST(-63.93442154 AS Decimal(10, 8)), 206, 1, N'DALMASSO RICARDO ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00314/06', N'10.015.0.00314', 164, N'LA PAMPA', N'MARACO', 60, 9, 55, 0, 0, 0, 0, 1, 0, 125, CAST(-35.84571838 AS Decimal(10, 8)), CAST(-63.93442154 AS Decimal(10, 8)), 206, 1, N'ABT RAIMUNDO MIGUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00315/00', N'10.015.0.00315', 185, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.59402084 AS Decimal(10, 8)), CAST(-63.68906021 AS Decimal(10, 8)), 206, 1, N'PORTU CARLOS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00316/01', N'10.015.0.00316', 31, N'LA PAMPA', N'MARACO', 20, 11, 0, 1, 0, 7, 2, 0, 0, 41, CAST(-35.78741074 AS Decimal(10, 8)), CAST(-63.66822052 AS Decimal(10, 8)), 206, 1, N'VICENTE GUILLERMO JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00317/00', N'10.015.0.00317', 209, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.61151886 AS Decimal(10, 8)), CAST(-63.84650040 AS Decimal(10, 8)), 206, 1, N'SUCESION DE GAGINO ALBERTO JUAN DOMINGO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00317/03', N'10.015.0.00317', 209, N'LA PAMPA', N'MARACO', 65, 27, 19, 13, 0, 35, 0, 0, 0, 159, CAST(-35.61151886 AS Decimal(10, 8)), CAST(-63.84650040 AS Decimal(10, 8)), 206, 1, N'IRASTORZA MARIA ELENA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00317/12', N'10.015.0.00317', 209, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.61151886 AS Decimal(10, 8)), CAST(-63.84650040 AS Decimal(10, 8)), 206, 1, N'GAGINO IGNACIO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00317/14', N'10.015.0.00317', 209, N'LA PAMPA', N'MARACO', 71, 0, 0, 5, 0, 0, 2, 0, 0, 78, CAST(-35.61151886 AS Decimal(10, 8)), CAST(-63.84650040 AS Decimal(10, 8)), 206, 1, N'GAGINO JUAN ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00318/02', N'10.015.0.00318', 108, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63869858 AS Decimal(10, 8)), CAST(-63.82777023 AS Decimal(10, 8)), 206, 1, N'IRASTORZA MARIA ELENA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00321/01', N'10.015.0.00321', 935, N'LA PAMPA', N'MARACO', 859, 127, 1, 0, 3, 20, 22, 0, 0, 1032, CAST(-35.82607651 AS Decimal(10, 8)), CAST(-63.77051163 AS Decimal(10, 8)), 206, 1, N'GRUPO CARNES SANTIAGO SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00323/08', N'10.015.0.00323', 680, N'LA PAMPA', N'MARACO', 652, 56, 0, 0, 5, 39, 18, 0, 0, 770, CAST(-35.67966843 AS Decimal(10, 8)), CAST(-63.48334885 AS Decimal(10, 8)), 206, 1, N'MARCOS RUBEN MARCELO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00327/03', N'10.015.0.00327', 183, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.66228104 AS Decimal(10, 8)), CAST(-63.79608154 AS Decimal(10, 8)), 206, 1, N'FERRARI MARCELA VERONICA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00327/04', N'10.015.0.00327', 183, N'LA PAMPA', N'MARACO', 41, 31, 0, 0, 25, 23, 1, 0, 0, 121, CAST(-35.66228104 AS Decimal(10, 8)), CAST(-63.79608154 AS Decimal(10, 8)), 206, 1, N'PAYERO RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00327/05', N'10.015.0.00327', 183, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.66228104 AS Decimal(10, 8)), CAST(-63.79608154 AS Decimal(10, 8)), 206, 1, N'TAMBO TREBOLARES S DE HECHO DE PEDRO JORGE ARREGUY Y RUBEN M')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00328/00', N'10.015.0.00328', 200, N'LA PAMPA', N'MARACO', 0, 74, 5, 0, 35, 6, 0, 0, 0, 120, CAST(-35.86167908 AS Decimal(10, 8)), CAST(-63.66283035 AS Decimal(10, 8)), 206, 1, N'CORRAL ROBERTO, GENARO OFELIA Y CORRAL SERGIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00328/07', N'10.015.0.00328', 200, N'LA PAMPA', N'MARACO', 0, 23, 1, 0, 0, 0, 0, 0, 0, 24, CAST(-35.86167908 AS Decimal(10, 8)), CAST(-63.66283035 AS Decimal(10, 8)), 206, 1, N'EBERLE FRANCISCO BERNARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00328/09', N'10.015.0.00328', 200, N'LA PAMPA', N'MARACO', 0, 86, 0, 0, 0, 0, 0, 0, 0, 86, CAST(-35.86167908 AS Decimal(10, 8)), CAST(-63.66283035 AS Decimal(10, 8)), 206, 1, N'SUCESION DE FERNANDEZ JOSE MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00329/00', N'10.015.0.00329', 33, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67919159 AS Decimal(10, 8)), CAST(-63.81983948 AS Decimal(10, 8)), 206, 1, N'GARIALDI SANTIAGO FERNANDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00329/01', N'10.015.0.00329', 33, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67919159 AS Decimal(10, 8)), CAST(-63.81983948 AS Decimal(10, 8)), 206, 1, N'SALINAS ROSARIO FILANOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00333/02', N'10.015.0.00333', 200, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.80556870 AS Decimal(10, 8)), CAST(-63.72280884 AS Decimal(10, 8)), 206, 1, N'BARGEL HUGO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00334/00', N'10.015.0.00334', 150, N'LA PAMPA', N'MARACO', 23, 2, 48, 1, 7, 5, 0, 0, 0, 86, CAST(-35.57881165 AS Decimal(10, 8)), CAST(-63.73069000 AS Decimal(10, 8)), 206, 1, N'SUCESION DE CAROSIO ROGELIO JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00334/02', N'10.015.0.00334', 150, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.57881165 AS Decimal(10, 8)), CAST(-63.73069000 AS Decimal(10, 8)), 206, 1, N'BARBERA JORGE FABIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00337/00', N'10.015.0.00337', 1250, N'LA PAMPA', N'MARACO', 0, 293, 0, 0, 179, 180, 0, 0, 0, 652, CAST(-35.73823166 AS Decimal(10, 8)), CAST(-63.68994141 AS Decimal(10, 8)), 206, 1, N'URRUSPURU HNOS SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00338/00', N'10.015.0.00338', NULL, N'LA PAMPA', N'MARACO', 21, 14, 0, 4, 5, 0, 1, 0, 0, 45, CAST(-35.55802917 AS Decimal(10, 8)), CAST(-63.82185364 AS Decimal(10, 8)), 206, 1, N'FARIAS MELINA RAQUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00339/00', N'10.015.0.00339', NULL, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.64177704 AS Decimal(10, 8)), CAST(-63.74924088 AS Decimal(10, 8)), 206, 1, N'EPIFANIO JORGE ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00340/00', N'10.015.0.00340', 929, N'LA PAMPA', N'MARACO', 304, 39, 0, 0, 9, 53, 6, 0, 0, 411, CAST(-35.54305267 AS Decimal(10, 8)), CAST(-63.85502625 AS Decimal(10, 8)), 206, 1, N'AYERRA ELBA ESTELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00340/08', N'10.015.0.00340', 929, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54305267 AS Decimal(10, 8)), CAST(-63.85502625 AS Decimal(10, 8)), 206, 1, N'GAGINO JUAN ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00340/10', N'10.015.0.00340', 929, N'LA PAMPA', N'MARACO', 23, 0, 0, 0, 3, 3, 1, 0, 0, 30, CAST(-35.54305267 AS Decimal(10, 8)), CAST(-63.85502625 AS Decimal(10, 8)), 206, 1, N'DIEZ CESAR LUIS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00341/02', N'10.015.0.00341', 212, N'LA PAMPA', N'MARACO', 103, 0, 0, 0, 36, 37, 3, 0, 0, 179, CAST(-35.57889938 AS Decimal(10, 8)), CAST(-63.68944168 AS Decimal(10, 8)), 206, 1, N'ALVAREZ LUIS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00343/06', N'10.015.0.00343', 473, N'LA PAMPA', N'MARACO', 0, 0, 2, 11, 0, 323, 0, 0, 0, 336, CAST(-35.52180099 AS Decimal(10, 8)), CAST(-63.38656998 AS Decimal(10, 8)), 206, 1, N'SUCESION DE SERRANO OMAR MANUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00343/09', N'10.015.0.00343', 473, N'LA PAMPA', N'MARACO', 0, 0, 20, 206, 0, 59, 0, 0, 0, 285, CAST(-35.52180099 AS Decimal(10, 8)), CAST(-63.38656998 AS Decimal(10, 8)), 206, 1, N'SERRANO BARRON JAVIER')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00343/12', N'10.015.0.00343', 473, N'LA PAMPA', N'MARACO', 0, 0, 113, 344, 0, 230, 0, 0, 0, 687, CAST(-35.52180099 AS Decimal(10, 8)), CAST(-63.38656998 AS Decimal(10, 8)), 206, 1, N'BARRON NORMA LILIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00358/00', N'10.015.0.00358', 103, N'LA PAMPA', N'MARACO', 65, 0, 2, 0, 12, 21, 1, 0, 0, 101, CAST(-35.46252060 AS Decimal(10, 8)), CAST(-63.88272095 AS Decimal(10, 8)), 206, 1, N'SUCESION DE LUCERO EDUARDO NICOMEDES')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00361/03', N'10.015.0.00361', 680, N'LA PAMPA', N'MARACO', 286, 501, 11, 272, 452, 299, 8, 0, 0, 1829, CAST(-35.76110077 AS Decimal(10, 8)), CAST(-63.45447922 AS Decimal(10, 8)), 206, 1, N'ESTEBAN NORBERTO DANIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00361/04', N'10.015.0.00361', 680, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.76110077 AS Decimal(10, 8)), CAST(-63.45447922 AS Decimal(10, 8)), 206, 1, N'C MENENDEZ Y CIA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00361/05', N'10.015.0.00361', 680, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.76110077 AS Decimal(10, 8)), CAST(-63.45447922 AS Decimal(10, 8)), 206, 1, N'CUADRELLI REMO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00364/02', N'10.015.0.00364', 1042, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.74251938 AS Decimal(10, 8)), CAST(-63.42724991 AS Decimal(10, 8)), 206, 1, N'BRIZUELA CARLOS MARTIN Y BRIZUELA ALEJANDRA S H')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00364/03', N'10.015.0.00364', 1042, N'LA PAMPA', N'MARACO', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(-35.74251938 AS Decimal(10, 8)), CAST(-63.42724991 AS Decimal(10, 8)), 206, 1, N'ESTEBAN MARIO VICTOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00364/04', N'10.015.0.00364', 1042, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.74251938 AS Decimal(10, 8)), CAST(-63.42724991 AS Decimal(10, 8)), 206, 1, N'C MENENDEZ Y CIA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00365/02', N'10.015.0.00365', 50, N'LA PAMPA', N'MARACO', 43, 0, 0, 0, 10, 0, 1, 0, 0, 54, CAST(-35.78546143 AS Decimal(10, 8)), CAST(-63.71073151 AS Decimal(10, 8)), 206, 1, N'GENARO HECTOR FABIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00365/03', N'10.015.0.00365', 50, N'LA PAMPA', N'MARACO', 28, 0, 0, 0, 5, 0, 1, 0, 0, 34, CAST(-35.78546143 AS Decimal(10, 8)), CAST(-63.71073151 AS Decimal(10, 8)), 206, 1, N'SUCESION DE FERNANDEZ JOSE MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00367/00', N'10.015.0.00367', 318, N'LA PAMPA', N'MARACO', 74, 4, 1, 4, 4, 3, 1, 0, 0, 91, CAST(-35.52788162 AS Decimal(10, 8)), CAST(-63.88251114 AS Decimal(10, 8)), 206, 1, N'SUCESION DE PELLEGRINO ABEL LUDOVICO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00368/00', N'10.015.0.00368', 1717, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.58581924 AS Decimal(10, 8)), CAST(-63.57952881 AS Decimal(10, 8)), 206, 1, N'BERANGO IRMA ELSA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00368/03', N'10.015.0.00368', 1717, N'LA PAMPA', N'MARACO', 121, 0, 0, 0, 0, 0, 8, 0, 0, 129, CAST(-35.58581924 AS Decimal(10, 8)), CAST(-63.57952881 AS Decimal(10, 8)), 206, 1, N'CID HERMANOS SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00368/13', N'10.015.0.00368', 1717, N'LA PAMPA', N'MARACO', 175, 0, 0, 0, 1, 0, 0, 0, 0, 176, CAST(-35.58581924 AS Decimal(10, 8)), CAST(-63.57952881 AS Decimal(10, 8)), 206, 1, N'CID EDUARDO ALFONSO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00370/07', N'10.015.0.00370', 1052, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.80524063 AS Decimal(10, 8)), CAST(-63.74060059 AS Decimal(10, 8)), 206, 1, N'ISAPAM S R L')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00370/10', N'10.015.0.00370', 1052, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.80524063 AS Decimal(10, 8)), CAST(-63.74060059 AS Decimal(10, 8)), 206, 1, N'MANERA ELOY')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00371/00', N'10.015.0.00371', 612, N'LA PAMPA', N'MARACO', 300, 399, 85, 6, 251, 0, 0, 0, 0, 1041, CAST(-35.74324036 AS Decimal(10, 8)), CAST(-63.55437851 AS Decimal(10, 8)), 206, 1, N'LA BERTHA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00371/04', N'10.015.0.00371', 612, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.74324036 AS Decimal(10, 8)), CAST(-63.55437851 AS Decimal(10, 8)), 206, 1, N'SUCESION DE SANCHEZ HECTOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00371/05', N'10.015.0.00371', 612, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.74324036 AS Decimal(10, 8)), CAST(-63.55437851 AS Decimal(10, 8)), 206, 1, N'C MENENDEZ Y CIA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00373/00', N'10.015.0.00373', 187, N'LA PAMPA', N'MARACO', 24, 35, 152, 93, 26, 101, 5, 0, 0, 436, CAST(-35.54270935 AS Decimal(10, 8)), CAST(-63.75667953 AS Decimal(10, 8)), 206, 1, N'BORASIO MARIA TERESA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00377/00', N'10.015.0.00377', 150, N'LA PAMPA', N'MARACO', 123, 0, 0, 0, 19, 36, 4, 5, 0, 187, CAST(-35.56185150 AS Decimal(10, 8)), CAST(-63.68952179 AS Decimal(10, 8)), 206, 1, N'SUCESION DE CAROSIO JUAN OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00377/01', N'10.015.0.00377', 150, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.56185150 AS Decimal(10, 8)), CAST(-63.68952179 AS Decimal(10, 8)), 206, 1, N'PAGELLA JORGE ARMANDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00379/00', N'10.015.0.00379', 322, N'LA PAMPA', N'MARACO', 0, 0, 6, 260, 0, 0, 0, 0, 0, 266, CAST(-35.58790970 AS Decimal(10, 8)), CAST(-63.86827087 AS Decimal(10, 8)), 206, 1, N'GARCIA OSVALDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00381/01', N'10.015.0.00381', 654, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.59157944 AS Decimal(10, 8)), CAST(-63.73902893 AS Decimal(10, 8)), 206, 1, N'LA ENERGIA S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00381/13', N'10.015.0.00381', 654, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.59157944 AS Decimal(10, 8)), CAST(-63.73902893 AS Decimal(10, 8)), 206, 1, N'SUCESION DE VERNA OSCAR RAUL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00381/14', N'10.015.0.00381', 654, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.59157944 AS Decimal(10, 8)), CAST(-63.73902893 AS Decimal(10, 8)), 206, 1, N'RUCANAHUEL SCA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00382/06', N'10.015.0.00382', 280, N'LA PAMPA', N'MARACO', 0, 21, 0, 8, 0, 0, 0, 0, 0, 29, CAST(-35.73937988 AS Decimal(10, 8)), CAST(-63.62826920 AS Decimal(10, 8)), 206, 1, N'ARRIETA ENRIQUE EDGARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00384/00', N'10.015.0.00384', 186, N'LA PAMPA', N'MARACO', 137, 0, 0, 0, 31, 22, 4, 1, 0, 195, CAST(-35.56409073 AS Decimal(10, 8)), CAST(-63.71704102 AS Decimal(10, 8)), 206, 1, N'SUCESION DE BAUTISTA OMAR ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00385/01', N'10.015.0.00385', 780, N'LA PAMPA', N'MARACO', 0, 0, 33, 167, 31, 212, 0, 0, 0, 443, CAST(-35.63417053 AS Decimal(10, 8)), CAST(-63.55821991 AS Decimal(10, 8)), 206, 1, N'OTERMIN JUAN CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00385/03', N'10.015.0.00385', 780, N'LA PAMPA', N'MARACO', 3, 0, 35, 47, 0, 0, 0, 0, 0, 85, CAST(-35.63417053 AS Decimal(10, 8)), CAST(-63.55821991 AS Decimal(10, 8)), 206, 1, N'OTERMIN JUAN FERNANDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00385/04', N'10.015.0.00385', 780, N'LA PAMPA', N'MARACO', 0, 0, 5, 0, 0, 0, 0, 0, 0, 5, CAST(-35.63417053 AS Decimal(10, 8)), CAST(-63.55821991 AS Decimal(10, 8)), 206, 1, N'OTERMIN FEDERICO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00387/00', N'10.015.0.00387', 1060, N'LA PAMPA', N'MARACO', 61, 21, 0, 0, 24, 3, 3, 0, 0, 112, CAST(-35.47333145 AS Decimal(10, 8)), CAST(-63.92115021 AS Decimal(10, 8)), 206, 1, N'SUCESION DE LARANDABURU JUAN CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00387/01', N'10.015.0.00387', 1060, N'LA PAMPA', N'MARACO', 714, 0, 0, 0, 22, 1, 31, 0, 0, 768, CAST(-35.47333145 AS Decimal(10, 8)), CAST(-63.92115021 AS Decimal(10, 8)), 206, 1, N'PORTU CARLOS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00387/03', N'10.015.0.00387', 1060, N'LA PAMPA', N'MARACO', 58, 0, 0, 0, 25, 31, 0, 0, 0, 114, CAST(-35.47333145 AS Decimal(10, 8)), CAST(-63.92115021 AS Decimal(10, 8)), 206, 1, N'PORTU CARLOS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00387/04', N'10.015.0.00387', 1060, N'LA PAMPA', N'MARACO', 29, 0, 0, 0, 16, 0, 0, 0, 0, 45, CAST(-35.47333145 AS Decimal(10, 8)), CAST(-63.92115021 AS Decimal(10, 8)), 206, 1, N'CARRIZO RAUL ANTONIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00388/00', N'10.015.0.00388', 1135, N'LA PAMPA', N'MARACO', 1040, 211, 5, 29, 301, 384, 54, 20, 0, 2044, CAST(-35.72483063 AS Decimal(10, 8)), CAST(-63.51855087 AS Decimal(10, 8)), 206, 1, N'LOS CALDENES AGROPECUARIA  SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00393/00', N'10.015.0.00393', 1145, N'LA PAMPA', N'MARACO', 0, 0, 461, 300, 0, 290, 0, 0, 0, 1051, CAST(-35.72895813 AS Decimal(10, 8)), CAST(-63.88451004 AS Decimal(10, 8)), 206, 1, N'LA GERONIMA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00394/00', N'10.015.0.00394', 304, N'LA PAMPA', N'MARACO', 171, 22, 1, 0, 21, 34, 7, 0, 0, 256, CAST(-35.54365921 AS Decimal(10, 8)), CAST(-63.81232834 AS Decimal(10, 8)), 206, 1, N'AGRICOLA CUMECO SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00394/07', N'10.015.0.00394', 304, N'LA PAMPA', N'MARACO', 43, 12, 0, 0, 8, 15, 0, 0, 0, 78, CAST(-35.54365921 AS Decimal(10, 8)), CAST(-63.81232834 AS Decimal(10, 8)), 206, 1, N'CERUTTI DANTE ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00394/11', N'10.015.0.00394', 304, N'LA PAMPA', N'MARACO', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, CAST(-35.54365921 AS Decimal(10, 8)), CAST(-63.81232834 AS Decimal(10, 8)), 206, 1, N'GOMEZ INES MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00395/00', N'10.015.0.00395', 1, N'LA PAMPA', N'MARACO', 2, 0, 0, 1, 2, 1, 0, 0, 0, 6, CAST(-35.68460846 AS Decimal(10, 8)), CAST(-63.77426910 AS Decimal(10, 8)), 206, 1, N'FERNANDEZ ATILIO EDUARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00396/00', N'10.015.0.00396', 942, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67736816 AS Decimal(10, 8)), CAST(-63.56681061 AS Decimal(10, 8)), 206, 1, N'LOPEZ CASTRO S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00396/02', N'10.015.0.00396', 942, N'LA PAMPA', N'MARACO', 227, 0, 0, 0, 0, 19, 0, 0, 0, 246, CAST(-35.67736816 AS Decimal(10, 8)), CAST(-63.56681061 AS Decimal(10, 8)), 206, 1, N'LARIGUET LEOPOLDO ADOLFO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00397/06', N'10.015.0.00397', 879, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.48311234 AS Decimal(10, 8)), CAST(-63.73826218 AS Decimal(10, 8)), 206, 1, N'MAQUIEYRA CARLOS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00397/10', N'10.015.0.00397', 879, N'LA PAMPA', N'MARACO', 0, 0, 207, 96, 0, 658, 0, 0, 0, 961, CAST(-35.48311234 AS Decimal(10, 8)), CAST(-63.73826218 AS Decimal(10, 8)), 206, 1, N'GRANOS DEL OESTE SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00398/00', N'10.015.0.00398', 625, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67993927 AS Decimal(10, 8)), CAST(-63.55467987 AS Decimal(10, 8)), 206, 1, N'HOLGADO JOSE MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00398/13', N'10.015.0.00398', 625, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67993927 AS Decimal(10, 8)), CAST(-63.55467987 AS Decimal(10, 8)), 206, 1, N'ARREGUY PEDRO JORGE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00398/14', N'10.015.0.00398', 625, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67993927 AS Decimal(10, 8)), CAST(-63.55467987 AS Decimal(10, 8)), 206, 1, N'ARREGUY PEDRO J ARREGUY MARGARITA E Y ARREGUY MARIA M')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00404/00', N'10.015.0.00404', 168, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.81864929 AS Decimal(10, 8)), CAST(-63.83786011 AS Decimal(10, 8)), 206, 1, N'LA BERTHA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00406/00', N'10.015.0.00406', 411, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72283936 AS Decimal(10, 8)), CAST(-63.82614136 AS Decimal(10, 8)), 206, 1, N'PEINADO ELADIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00407/00', N'10.015.0.00407', 300, N'LA PAMPA', N'MARACO', 136, 0, 0, 0, 3, 0, 8, 0, 0, 147, CAST(-35.48551559 AS Decimal(10, 8)), CAST(-63.88258743 AS Decimal(10, 8)), 206, 1, N'LEVRA ARIEL ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00408/05', N'10.015.0.00408', 186, N'LA PAMPA', N'MARACO', 27, 13, 10, 9, 9, 7, 1, 0, 0, 76, CAST(-35.63407898 AS Decimal(10, 8)), CAST(-63.70220947 AS Decimal(10, 8)), 206, 1, N'LA VAVIWAL SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00410/02', N'10.015.0.00410', 733, N'LA PAMPA', N'MARACO', 0, 0, 167, 39, 0, 771, 0, 0, 0, 977, CAST(-35.81489944 AS Decimal(10, 8)), CAST(-63.68980026 AS Decimal(10, 8)), 206, 1, N'MAMALUMA SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00413/00', N'10.015.0.00413', 257, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.75574112 AS Decimal(10, 8)), CAST(-63.86162949 AS Decimal(10, 8)), 206, 1, N'MORETE RUBEN ROBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00418/07', N'10.015.0.00418', 330, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.81338882 AS Decimal(10, 8)), CAST(-63.85086823 AS Decimal(10, 8)), 206, 1, N'PAYERO RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00418/10', N'10.015.0.00418', 330, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.81338882 AS Decimal(10, 8)), CAST(-63.85086823 AS Decimal(10, 8)), 206, 1, N'FALKENSTEIN DANIEL ALEJANDRO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00421/00', N'10.015.0.00421', 262, N'LA PAMPA', N'MARACO', 99, 68, 40, 24, 59, 66, 5, 0, 0, 361, CAST(-35.71681976 AS Decimal(10, 8)), CAST(-63.76457977 AS Decimal(10, 8)), 206, 1, N'RODRIGUEZ ELSA CARMEN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00422/00', N'10.015.0.00422', 150, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.58074951 AS Decimal(10, 8)), CAST(-63.60593033 AS Decimal(10, 8)), 206, 1, N'ARREGUY PEDRO J ARREGUY MARGARITA E Y ARREGUY MARIA M')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00423/00', N'10.015.0.00423', 268, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.84891129 AS Decimal(10, 8)), CAST(-63.82595825 AS Decimal(10, 8)), 206, 1, N'BERTONE JUAN CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00423/01', N'10.015.0.00423', 268, N'LA PAMPA', N'MARACO', 65, 148, 0, 0, 20, 39, 2, 0, 0, 274, CAST(-35.84891129 AS Decimal(10, 8)), CAST(-63.82595825 AS Decimal(10, 8)), 206, 1, N'BERTONE MARCOS GABRIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00425/01', N'10.015.0.00425', 520, N'LA PAMPA', N'MARACO', 43, 38, 1, 9, 59, 0, 1, 0, 0, 151, CAST(-35.83528137 AS Decimal(10, 8)), CAST(-63.83832932 AS Decimal(10, 8)), 206, 1, N'LA LELA S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00426/01', N'10.015.0.00426', 277, N'LA PAMPA', N'MARACO', 114, 38, 42, 229, 41, 134, 3, 0, 0, 601, CAST(-35.64722824 AS Decimal(10, 8)), CAST(-63.66173172 AS Decimal(10, 8)), 206, 1, N'FORTE HECTOR EDGARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00426/02', N'10.015.0.00426', 277, N'LA PAMPA', N'MARACO', 0, 0, 26, 42, 0, 0, 0, 0, 0, 68, CAST(-35.64722824 AS Decimal(10, 8)), CAST(-63.66173172 AS Decimal(10, 8)), 206, 1, N'FORTE MARCELO ANDRES')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00429/00', N'10.015.0.00429', 6300, N'LA PAMPA', N'MARACO', 698, 169, 0, 98, 1882, 2388, 22, 0, 0, 5257, CAST(-35.60657501 AS Decimal(10, 8)), CAST(-63.38785934 AS Decimal(10, 8)), 206, 1, N'LA ESMERALDA AGROPECUARIA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00429/04', N'10.015.0.00429', 6300, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.60657501 AS Decimal(10, 8)), CAST(-63.38785934 AS Decimal(10, 8)), 206, 1, N'GURENA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00435/05', N'10.015.0.00435', 230, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.69581985 AS Decimal(10, 8)), CAST(-63.59344101 AS Decimal(10, 8)), 206, 1, N'LA BERTHA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00436/00', N'10.015.0.00436', 644, N'LA PAMPA', N'MARACO', 182, 51, 152, 0, 40, 46, 4, 0, 0, 475, CAST(-35.67942047 AS Decimal(10, 8)), CAST(-63.85263062 AS Decimal(10, 8)), 206, 1, N'ACEBAL LEONARDO JOSE Y JUAN ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00442/02', N'10.015.0.00442', 313, N'LA PAMPA', N'MARACO', 278, 88, 2, 0, 101, 93, 10, 2, 0, 574, CAST(-35.67945099 AS Decimal(10, 8)), CAST(-63.84852982 AS Decimal(10, 8)), 206, 1, N'JACO S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00449/00', N'10.015.0.00449', 270, N'LA PAMPA', N'MARACO', 139, 63, 1, 51, 34, 36, 2, 1, 0, 327, CAST(-35.55654907 AS Decimal(10, 8)), CAST(-63.93775177 AS Decimal(10, 8)), 206, 1, N'MINETTI RUBEN RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00449/02', N'10.015.0.00449', 270, N'LA PAMPA', N'MARACO', 60, 5, 0, 11, 0, 9, 0, 0, 0, 85, CAST(-35.55654907 AS Decimal(10, 8)), CAST(-63.93775177 AS Decimal(10, 8)), 206, 1, N'MINETTI EZEQUIEL HERNAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00451/00', N'10.015.0.00451', 308, N'LA PAMPA', N'MARACO', 136, 38, 2, 24, 71, 21, 3, 0, 0, 295, CAST(-35.69443893 AS Decimal(10, 8)), CAST(-63.44110870 AS Decimal(10, 8)), 206, 1, N'PACHECO AMERICO SIMON Y GARCIA MIRTA ESTHER')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00452/00', N'10.015.0.00452', 75, N'LA PAMPA', N'MARACO', 15, 15, 110, 0, 0, 3, 0, 0, 0, 143, CAST(-35.56198883 AS Decimal(10, 8)), CAST(-63.73335266 AS Decimal(10, 8)), 206, 1, N'FERNANDEZ ATILIO EDUARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00453/00', N'10.015.0.00453', 312, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.71696854 AS Decimal(10, 8)), CAST(-63.39282990 AS Decimal(10, 8)), 206, 1, N'SUCESION DE IRRAZABAL MARTIN HORACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00454/00', N'10.015.0.00454', 365, N'LA PAMPA', N'MARACO', 106, 0, 50, 106, 25, 40, 2, 0, 0, 329, CAST(-35.78438950 AS Decimal(10, 8)), CAST(-63.80654144 AS Decimal(10, 8)), 206, 1, N'VIOLA OSCAR JUAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00455/00', N'10.015.0.00455', 25, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.57442093 AS Decimal(10, 8)), CAST(-63.38914108 AS Decimal(10, 8)), 206, 1, N'MARTIN ANTONIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00455/02', N'10.015.0.00455', 25, N'LA PAMPA', N'MARACO', 23, 3, 0, 0, 0, 3, 1, 0, 0, 30, CAST(-35.57442093 AS Decimal(10, 8)), CAST(-63.38914108 AS Decimal(10, 8)), 206, 1, N'WESNER OMAR HORACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00457/11', N'10.015.0.00457', 1218, N'LA PAMPA', N'MARACO', 129, 32, 0, 0, 0, 0, 8, 0, 0, 169, CAST(-35.47576904 AS Decimal(10, 8)), CAST(-63.86138153 AS Decimal(10, 8)), 206, 1, N'AGROPECUARIA LA ESPERANZA S.H. DE LEVRA ESTER A NELIDA N ORL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00458/00', N'10.015.0.00458', NULL, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.71009827 AS Decimal(10, 8)), CAST(-63.42602158 AS Decimal(10, 8)), 206, 1, N'PACHECO NESTOR Y GARCIA NIVIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00458/15', N'10.015.0.00458', NULL, N'LA PAMPA', N'MARACO', 114, 34, 0, 0, 46, 0, 3, 0, 0, 197, CAST(-35.71009827 AS Decimal(10, 8)), CAST(-63.42602158 AS Decimal(10, 8)), 206, 1, N'LOS PACHE SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00459/01', N'10.015.0.00459', 205, N'LA PAMPA', N'MARACO', 118, 45, 81, 0, 38, 53, 2, 0, 0, 337, CAST(-35.54481125 AS Decimal(10, 8)), CAST(-63.43386841 AS Decimal(10, 8)), 206, 1, N'GOROSTIAGA JOSE MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00461/03', N'10.015.0.00461', 147, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.62290955 AS Decimal(10, 8)), CAST(-63.70272064 AS Decimal(10, 8)), 206, 1, N'LOS TIOS SOCIEDAD DE RESPONSABILIDAD LIMITADA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00461/04', N'10.015.0.00461', 147, N'LA PAMPA', N'MARACO', 16, 8, 8, 0, 5, 5, 1, 0, 0, 43, CAST(-35.62290955 AS Decimal(10, 8)), CAST(-63.70272064 AS Decimal(10, 8)), 206, 1, N'VIÑUELA MARTIN MANUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00462/00', N'10.015.0.00462', 8, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.55072403 AS Decimal(10, 8)), CAST(-63.81273651 AS Decimal(10, 8)), 206, 1, N'BLANCO MARIO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00464/00', N'10.015.0.00464', 300, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.50770950 AS Decimal(10, 8)), CAST(-63.84645081 AS Decimal(10, 8)), 206, 1, N'NAVEIRAS ANIBAL JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00467/00', N'10.015.0.00467', 799, N'LA PAMPA', N'MARACO', 0, 0, 272, 403, 0, 80, 0, 0, 0, 755, CAST(-35.81029129 AS Decimal(10, 8)), CAST(-63.78871155 AS Decimal(10, 8)), 206, 1, N'MATA LUIS MARIA, DEL POTRO ELSA GRACIELA Y MATA LUIS IGNACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00473/00', N'10.015.0.00473', 15, N'LA PAMPA', N'MARACO', 0, 12, 0, 3, 4, 20, 0, 0, 0, 39, CAST(-35.56096649 AS Decimal(10, 8)), CAST(-63.82298660 AS Decimal(10, 8)), 206, 1, N'DELGADIN OLGA ALEJANDRA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00479/00', N'10.015.0.00479', 298, N'LA PAMPA', N'MARACO', 1, 0, 0, 0, 152, 9, 1, 0, 0, 163, CAST(-35.77859116 AS Decimal(10, 8)), CAST(-63.82860947 AS Decimal(10, 8)), 206, 1, N'FERNANDEZ ROBERTO RAUL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00479/02', N'10.015.0.00479', 298, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.77859116 AS Decimal(10, 8)), CAST(-63.82860947 AS Decimal(10, 8)), 206, 1, N'LARIGUET ANDRES Y AIZPEOLEA NELSON ADOLFO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00480/00', N'10.015.0.00480', 1, N'LA PAMPA', N'MARACO', 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, CAST(-35.68759155 AS Decimal(10, 8)), CAST(-63.77455902 AS Decimal(10, 8)), 206, 1, N'MEDINA RUBEN OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00483/02', N'10.015.0.00483', 455, N'LA PAMPA', N'MARACO', 75, 0, 10, 3, 21, 24, 2, 0, 0, 135, CAST(-35.74246979 AS Decimal(10, 8)), CAST(-63.91511154 AS Decimal(10, 8)), 206, 1, N'CIVIT JUAN MANUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00485/01', N'10.015.0.00485', 115, N'LA PAMPA', N'MARACO', 290, 8, 0, 0, 0, 0, 0, 0, 0, 298, CAST(-35.76979828 AS Decimal(10, 8)), CAST(-63.40018082 AS Decimal(10, 8)), 206, 1, N'BROWN FELIPE JORGE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00487/00', N'10.015.0.00487', 297, N'LA PAMPA', N'MARACO', 188, 4, 0, 0, 0, 0, 3, 0, 0, 195, CAST(-35.83776093 AS Decimal(10, 8)), CAST(-63.86978149 AS Decimal(10, 8)), 206, 1, N'SIERRA WALTER HARIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00487/05', N'10.015.0.00487', 297, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.83776093 AS Decimal(10, 8)), CAST(-63.86978149 AS Decimal(10, 8)), 206, 1, N'DIAZ OSVALDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00487/07', N'10.015.0.00487', 297, N'LA PAMPA', N'MARACO', 0, 89, 0, 19, 84, 77, 0, 0, 0, 269, CAST(-35.83776093 AS Decimal(10, 8)), CAST(-63.86978149 AS Decimal(10, 8)), 206, 1, N'QUAGLIA SERGIO ARIEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00496/00', N'10.015.0.00496', 250, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54151917 AS Decimal(10, 8)), CAST(-63.68962860 AS Decimal(10, 8)), 206, 1, N'TESTA JORGE LUIS Y TESTA CARLOS HORACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00497/00', N'10.015.0.00497', 7, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.78065109 AS Decimal(10, 8)), CAST(-63.93547821 AS Decimal(10, 8)), 206, 1, N'GIOBANETTONE MARCELO JAVIER')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00497/01', N'10.015.0.00497', 7, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.78065109 AS Decimal(10, 8)), CAST(-63.93547821 AS Decimal(10, 8)), 206, 1, N'OLGUIN ARGENTINA SOLEDAD')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00500/00', N'10.015.0.00500', 505, N'LA PAMPA', N'MARACO', 27, 4, 0, 0, 0, 0, 1, 0, 0, 32, CAST(-35.90406036 AS Decimal(10, 8)), CAST(-63.45185089 AS Decimal(10, 8)), 206, 1, N'MATILLA CARLOS GUSTAVO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00512/00', N'10.015.0.00512', 10, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54423523 AS Decimal(10, 8)), CAST(-63.80774689 AS Decimal(10, 8)), 206, 1, N'DIEZ CESAR LUIS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00512/01', N'10.015.0.00512', 10, N'LA PAMPA', N'MARACO', 27, 4, 0, 0, 7, 3, 1, 0, 0, 42, CAST(-35.54423523 AS Decimal(10, 8)), CAST(-63.80774689 AS Decimal(10, 8)), 206, 1, N'BALENT SEBASTIAN HUMBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00514/00', N'10.015.0.00514', 622, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65650177 AS Decimal(10, 8)), CAST(-63.60564041 AS Decimal(10, 8)), 206, 1, N'AGROPECUARIA CANGALLO SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00516/00', N'10.015.0.00516', 9, N'LA PAMPA', N'MARACO', 2, 0, 0, 0, 0, 4, 0, 0, 0, 6, CAST(-35.68951035 AS Decimal(10, 8)), CAST(-63.78062057 AS Decimal(10, 8)), 206, 1, N'MEDERO ANDREA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00517/08', N'10.015.0.00517', 555, N'LA PAMPA', N'MARACO', 0, 10, 0, 0, 0, 0, 0, 0, 0, 10, CAST(-35.52859116 AS Decimal(10, 8)), CAST(-63.61135101 AS Decimal(10, 8)), 206, 1, N'SAN JUAN DEL OESTE SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00518/00', N'10.015.0.00518', 110, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.56013107 AS Decimal(10, 8)), CAST(-63.40940094 AS Decimal(10, 8)), 206, 1, N'HEREDIA JUAN PEDRO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00523/00', N'10.015.0.00523', 45, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63882065 AS Decimal(10, 8)), CAST(-63.77010345 AS Decimal(10, 8)), 206, 1, N'PAYERO RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00525/00', N'10.015.0.00525', 97, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.78738022 AS Decimal(10, 8)), CAST(-63.68999100 AS Decimal(10, 8)), 206, 1, N'LARTIRIGOYEN Y CIA S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00538/00', N'10.015.0.00538', 286, N'LA PAMPA', N'MARACO', 0, 0, 0, 129, 0, 75, 0, 0, 0, 204, CAST(-35.73921967 AS Decimal(10, 8)), CAST(-63.80960846 AS Decimal(10, 8)), 206, 1, N'PAMPAMIX S.A.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00541/02', N'10.015.0.00541', 1626, N'LA PAMPA', N'MARACO', 0, 0, 505, 660, 0, 0, 0, 0, 0, 1165, CAST(-35.52090073 AS Decimal(10, 8)), CAST(-63.67013931 AS Decimal(10, 8)), 206, 1, N'LA MAHUIDA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00541/05', N'10.015.0.00541', 1626, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.52090073 AS Decimal(10, 8)), CAST(-63.67013931 AS Decimal(10, 8)), 206, 1, N'BECHER MARIO ALFREDO Y BESCOS JOSE MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00541/07', N'10.015.0.00541', 1626, N'LA PAMPA', N'MARACO', 0, 0, 109, 200, 0, 220, 0, 0, 0, 529, CAST(-35.52090073 AS Decimal(10, 8)), CAST(-63.67013931 AS Decimal(10, 8)), 206, 1, N'L '' ESTRANGE WALLACE FEDERICO Y ENRIQUE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00541/13', N'10.015.0.00541', 1626, N'LA PAMPA', N'MARACO', 0, 0, 0, 150, 0, 0, 0, 0, 0, 150, CAST(-35.52090073 AS Decimal(10, 8)), CAST(-63.67013931 AS Decimal(10, 8)), 206, 1, N'CISMONDI ROBERTO LUIS Y SUSANA MABEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00542/00', N'10.015.0.00542', 518, N'LA PAMPA', N'MARACO', 0, 10, 60, 614, 15, 141, 0, 0, 0, 840, CAST(-35.78258896 AS Decimal(10, 8)), CAST(-63.62353897 AS Decimal(10, 8)), 206, 1, N'LAMBERTI ROBERTO OSCAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00542/06', N'10.015.0.00542', 518, N'LA PAMPA', N'MARACO', 0, 0, 0, 14, 0, 0, 0, 0, 0, 14, CAST(-35.78258896 AS Decimal(10, 8)), CAST(-63.62353897 AS Decimal(10, 8)), 206, 1, N'LAMBERTI SEBASTIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00547/01', N'10.015.0.00547', 245, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67901993 AS Decimal(10, 8)), CAST(-63.67816162 AS Decimal(10, 8)), 206, 1, N'ALBERTO TOBAL S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00552/00', N'10.015.0.00552', 73, N'LA PAMPA', N'MARACO', 43, 12, 17, 0, 18, 22, 3, 0, 0, 115, CAST(-35.67922974 AS Decimal(10, 8)), CAST(-63.66648865 AS Decimal(10, 8)), 206, 1, N'ILARREGUI NELIDA BEATRIZ')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00558/00', N'10.015.0.00558', 2000, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65436935 AS Decimal(10, 8)), CAST(-63.43051147 AS Decimal(10, 8)), 206, 1, N'TAMBOS Y CABAÑAS LAS CUATRO MARIAS S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00558/11', N'10.015.0.00558', 2000, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65436935 AS Decimal(10, 8)), CAST(-63.43051147 AS Decimal(10, 8)), 206, 1, N'SCHPETTER JOSE MIGUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00558/23', N'10.015.0.00558', 2000, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65436935 AS Decimal(10, 8)), CAST(-63.43051147 AS Decimal(10, 8)), 206, 1, N'C MENENDEZ Y CIA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00565/00', N'10.015.0.00565', 258, N'LA PAMPA', N'MARACO', 248, 122, 94, 149, 221, 268, 0, 6, 0, 1108, CAST(-35.54381180 AS Decimal(10, 8)), CAST(-63.40674973 AS Decimal(10, 8)), 206, 1, N'CISMONDI OLGA MABEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00571/00', N'10.015.0.00571', 400, N'LA PAMPA', N'MARACO', 9, 13, 314, 443, 29, 259, 0, 0, 0, 1067, CAST(-35.56166840 AS Decimal(10, 8)), CAST(-63.74955368 AS Decimal(10, 8)), 206, 1, N'PAGANO GUILLERMO NICOLAS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00577/03', N'10.015.0.00577', 312, N'LA PAMPA', N'MARACO', 0, 0, 0, 363, 0, 127, 0, 0, 0, 490, CAST(-35.50428009 AS Decimal(10, 8)), CAST(-63.77428818 AS Decimal(10, 8)), 206, 1, N'TESTA JORGE Y FERNANDEZ SILVIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00588/00', N'10.015.0.00588', 15, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.68556976 AS Decimal(10, 8)), CAST(-63.74901962 AS Decimal(10, 8)), 206, 1, N'DALMASSO VICTOR HUGO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00593/00', N'10.015.0.00593', 300, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.85932922 AS Decimal(10, 8)), CAST(-63.84693909 AS Decimal(10, 8)), 206, 1, N'GIRAUDO HNOS S R L')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00595/00', N'10.015.0.00595', 500, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.85932922 AS Decimal(10, 8)), CAST(-63.87385941 AS Decimal(10, 8)), 206, 1, N'SANCHEZ ADOLFO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00595/03', N'10.015.0.00595', 500, N'LA PAMPA', N'MARACO', 0, 0, 79, 85, 0, 0, 0, 0, 0, 164, CAST(-35.85932922 AS Decimal(10, 8)), CAST(-63.87385941 AS Decimal(10, 8)), 206, 1, N'SANCHEZ JOSE LUIS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00595/04', N'10.015.0.00595', 500, N'LA PAMPA', N'MARACO', 0, 0, 716, 442, 0, 0, 0, 0, 0, 1158, CAST(-35.85932922 AS Decimal(10, 8)), CAST(-63.87385941 AS Decimal(10, 8)), 206, 1, N'LAS PARCELAS S.A.S.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00598/00', N'10.015.0.00598', 393, N'LA PAMPA', N'MARACO', 278, 31, 0, 0, 48, 22, 6, 0, 0, 385, CAST(-35.90317154 AS Decimal(10, 8)), CAST(-63.92258072 AS Decimal(10, 8)), 206, 1, N'INGUE ALBERTO OSCAR E INGUE ESTELA MARIA LEAVI DE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00604/00', N'10.015.0.00604', 310, N'LA PAMPA', N'MARACO', 160, 15, 0, 0, 21, 1, 6, 2, 0, 205, CAST(-35.60857010 AS Decimal(10, 8)), CAST(-63.68957901 AS Decimal(10, 8)), 206, 1, N'SUCESION DE MARTIN EDGARDO FELICIANO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00608/01', N'10.015.0.00608', 84, N'LA PAMPA', N'MARACO', 4, 6, 0, 0, 0, 0, 0, 0, 0, 10, CAST(-35.65642929 AS Decimal(10, 8)), CAST(-63.82778168 AS Decimal(10, 8)), 206, 1, N'SANTA CANDELARIA S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00608/02', N'10.015.0.00608', 84, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65642929 AS Decimal(10, 8)), CAST(-63.82778168 AS Decimal(10, 8)), 206, 1, N'EL PEGUAL S.R.L')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00610/00', N'10.015.0.00610', 15, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67932129 AS Decimal(10, 8)), CAST(-63.68843842 AS Decimal(10, 8)), 206, 1, N'LEGUIZAMON CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00611/00', N'10.015.0.00611', 1, N'LA PAMPA', N'MARACO', 4, 0, 2, 0, 0, 4, 0, 0, 0, 10, CAST(-35.67993164 AS Decimal(10, 8)), CAST(-63.66608047 AS Decimal(10, 8)), 206, 1, N'MALDONADO JORGE HORACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00614/00', N'10.015.0.00614', NULL, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.68957901 AS Decimal(10, 8)), CAST(-63.77828979 AS Decimal(10, 8)), 206, 1, N'VAQUERO MIGUEL ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00619/00', N'10.015.0.00619', 112, N'LA PAMPA', N'MARACO', 80, 0, 60, 61, 45, 40, 6, 0, 0, 292, CAST(-35.51589584 AS Decimal(10, 8)), CAST(-63.83900070 AS Decimal(10, 8)), 206, 1, N'VILLA ROBERTO Y VILLA ELISA IRASTORZA DE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00631/00', N'10.015.0.00631', 880, N'LA PAMPA', N'MARACO', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, CAST(-35.74739075 AS Decimal(10, 8)), CAST(-63.73416901 AS Decimal(10, 8)), 206, 1, N'ALVARADO VALENZUELA FEDERICO HERNAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00633/00', N'10.015.0.00633', 1140, N'LA PAMPA', N'MARACO', 50, 456, 801, 137, 28, 341, 0, 0, 0, 1813, CAST(-35.63383865 AS Decimal(10, 8)), CAST(-63.81951904 AS Decimal(10, 8)), 206, 1, N'LOVIZIO S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00636/01', N'10.015.0.00636', 30, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63668060 AS Decimal(10, 8)), CAST(-63.72335815 AS Decimal(10, 8)), 206, 1, N'DON HIPOLITO S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00640/02', N'10.015.0.00640', 147, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54378128 AS Decimal(10, 8)), CAST(-63.75152969 AS Decimal(10, 8)), 206, 1, N'LAS MARIAS S.H. DE PAGANO ANA M ZORRILLA MARIA T Y ZORRILLA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00641/01', N'10.015.0.00641', 247, N'LA PAMPA', N'MARACO', 60, 6, 15, 0, 18, 18, 0, 0, 0, 117, CAST(-35.50202179 AS Decimal(10, 8)), CAST(-63.38753891 AS Decimal(10, 8)), 206, 1, N'GIMENEZ ERNESTO ANIBAL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00642/02', N'10.015.0.00642', 568, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.76110077 AS Decimal(10, 8)), CAST(-63.82815933 AS Decimal(10, 8)), 206, 1, N'ZABALA RAUL EDUARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00643/10', N'10.015.0.00643', 200, N'LA PAMPA', N'MARACO', 165, 32, 0, 0, 1, 3, 3, 0, 0, 204, CAST(-35.86913681 AS Decimal(10, 8)), CAST(-63.78280258 AS Decimal(10, 8)), 206, 1, N'MARCO JUAN ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00644/01', N'10.015.0.00644', 774, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.46974945 AS Decimal(10, 8)), CAST(-63.88261032 AS Decimal(10, 8)), 206, 1, N'IGLESIAS CELIA ESTER')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00644/07', N'10.015.0.00644', 774, N'LA PAMPA', N'MARACO', 102, 50, 1, 0, 44, 59, 4, 0, 0, 260, CAST(-35.46974945 AS Decimal(10, 8)), CAST(-63.88261032 AS Decimal(10, 8)), 206, 1, N'AMIGONE HECTOR JAVIER')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00644/09', N'10.015.0.00644', 774, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.46974945 AS Decimal(10, 8)), CAST(-63.88261032 AS Decimal(10, 8)), 206, 1, N'SALVARO GASTON')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00648/01', N'10.015.0.00648', 380, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.49794006 AS Decimal(10, 8)), CAST(-63.90193176 AS Decimal(10, 8)), 206, 1, N'POMA ROBERTO ENRIQUE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00649/04', N'10.015.0.00649', 720, N'LA PAMPA', N'MARACO', 322, 160, 120, 140, 101, 127, 16, 0, 0, 986, CAST(-35.60720825 AS Decimal(10, 8)), CAST(-63.77603912 AS Decimal(10, 8)), 206, 1, N'YAREGUI MARGARITA LIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00652/05', N'10.015.0.00652', 86, N'LA PAMPA', N'MARACO', 92, 7, 0, 0, 23, 10, 2, 1, 0, 135, CAST(-35.65233994 AS Decimal(10, 8)), CAST(-63.84244919 AS Decimal(10, 8)), 206, 1, N'FIGLIOLI SERGIO JOSE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00652/06', N'10.015.0.00652', 86, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65233994 AS Decimal(10, 8)), CAST(-63.84244919 AS Decimal(10, 8)), 206, 1, N'SALOMON ANA LILIANA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00652/07', N'10.015.0.00652', 86, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65233994 AS Decimal(10, 8)), CAST(-63.84244919 AS Decimal(10, 8)), 206, 1, N'SANTA SILVINA S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00652/11', N'10.015.0.00652', 86, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65233994 AS Decimal(10, 8)), CAST(-63.84244919 AS Decimal(10, 8)), 206, 1, N'BRUVERA ALDO CHRISTIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00656/00', N'10.015.0.00656', 22, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.66043091 AS Decimal(10, 8)), CAST(-63.78438950 AS Decimal(10, 8)), 206, 1, N'ENTE DE COOPERACION TECNICA Y FINANCIERA DEL SERVICIO PENITENCIARIO FEDERAL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00657/00', N'10.015.0.00657', 2408, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63011169 AS Decimal(10, 8)), CAST(-63.58256149 AS Decimal(10, 8)), 206, 1, N'FERTILO AGROPECUARIA SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00659/06', N'10.015.0.00659', 164, N'LA PAMPA', N'MARACO', 96, 0, 0, 0, 40, 50, 4, 0, 0, 190, CAST(-35.68819046 AS Decimal(10, 8)), CAST(-63.68968964 AS Decimal(10, 8)), 206, 1, N'MIGUEL GUSTAVO HORACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00660/01', N'10.015.0.00660', 170, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.70138931 AS Decimal(10, 8)), CAST(-63.82857895 AS Decimal(10, 8)), 206, 1, N'GARCIA LEONARDO SERGIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00664/01', N'10.015.0.00664', 550, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.90034866 AS Decimal(10, 8)), CAST(-63.77528000 AS Decimal(10, 8)), 206, 1, N'REYNA PABLO MARIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00665/01', N'10.015.0.00665', 167, N'LA PAMPA', N'MARACO', 203, 79, 0, 19, 16, 13, 3, 0, 0, 333, CAST(-35.67438126 AS Decimal(10, 8)), CAST(-63.82791138 AS Decimal(10, 8)), 206, 1, N'SANTA CANDELARIA S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00666/00', N'10.015.0.00666', 16, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 10, 0, 0, 0, 0, 10, CAST(-35.65922165 AS Decimal(10, 8)), CAST(-63.80352020 AS Decimal(10, 8)), 206, 1, N'PAYERO RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00671/00', N'10.015.0.00671', 80, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.62300110 AS Decimal(10, 8)), CAST(-63.70259857 AS Decimal(10, 8)), 206, 1, N'ALONSO JOSE JAIME')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00674/00', N'10.015.0.00674', 200, N'LA PAMPA', N'MARACO', 49, 10, 11, 4, 9, 12, 1, 0, 0, 96, CAST(-35.58303070 AS Decimal(10, 8)), CAST(-63.57876968 AS Decimal(10, 8)), 206, 1, N'TAMBO TREBOLARES S DE HECHO DE PEDRO JORGE ARREGUY Y RUBEN M')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00681/02', N'10.015.0.00681', 136, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.57500839 AS Decimal(10, 8)), CAST(-63.77239990 AS Decimal(10, 8)), 206, 1, N'COSECHAS S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00684/00', N'10.015.0.00684', 196, N'LA PAMPA', N'MARACO', 109, 7, 0, 0, 46, 5, 5, 0, 0, 172, CAST(-35.60615158 AS Decimal(10, 8)), CAST(-63.91606140 AS Decimal(10, 8)), 206, 1, N'DELU ALBERTO RAUL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00687/00', N'10.015.0.00687', 297, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.81924820 AS Decimal(10, 8)), CAST(-63.88188934 AS Decimal(10, 8)), 206, 1, N'ENRIQUEZ JOSE LUIS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00692/03', N'10.015.0.00692', 105, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72006989 AS Decimal(10, 8)), CAST(-63.81977081 AS Decimal(10, 8)), 206, 1, N'ACTIS GIORGETTO RICARDO VENANCIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00693/02', N'10.015.0.00693', 300, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.76110840 AS Decimal(10, 8)), CAST(-63.92742920 AS Decimal(10, 8)), 206, 1, N'FRANCISCO TODINO SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00696/00', N'10.015.0.00696', 180, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.76298904 AS Decimal(10, 8)), CAST(-63.49636078 AS Decimal(10, 8)), 206, 1, N'URRUTIA JUAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00698/00', N'10.015.0.00698', 32, N'LA PAMPA', N'MARACO', 0, 0, 52, 0, 0, 0, 0, 0, 0, 52, CAST(-35.76490021 AS Decimal(10, 8)), CAST(-63.93724823 AS Decimal(10, 8)), 206, 1, N'GAGLIARDONE ALBERTO ELEUTERIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00699/00', N'10.015.0.00699', 200, N'LA PAMPA', N'MARACO', 80, 0, 0, 13, 24, 21, 1, 0, 0, 139, CAST(-35.52679443 AS Decimal(10, 8)), CAST(-63.93730164 AS Decimal(10, 8)), 206, 1, N'PELLEGRINO RICARDO JUAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00702/06', N'10.015.0.00702', 752, N'LA PAMPA', N'MARACO', 16, 3, 0, 0, 2, 2, 1, 1, 0, 25, CAST(-35.56874084 AS Decimal(10, 8)), CAST(-63.52270889 AS Decimal(10, 8)), 206, 1, N'BAGNATO ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00703/08', N'10.015.0.00703', 138, N'LA PAMPA', N'MARACO', 10, 0, 0, 0, 6, 4, 0, 0, 0, 20, CAST(-35.76326752 AS Decimal(10, 8)), CAST(-63.48734283 AS Decimal(10, 8)), 206, 1, N'AMUNDARAIN SANDRA LILIANA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00704/00', N'10.015.0.00704', 10, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63084030 AS Decimal(10, 8)), CAST(-63.49135971 AS Decimal(10, 8)), 206, 1, N'LA COSTURA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00705/00', N'10.015.0.00705', 4630, N'LA PAMPA', N'MARACO', 129, 0, 1361, 0, 350, 3645, 0, 0, 0, 5485, CAST(-35.63056946 AS Decimal(10, 8)), CAST(-63.50690842 AS Decimal(10, 8)), 206, 1, N'LA COSTURA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00707/00', N'10.015.0.00707', 625, N'LA PAMPA', N'MARACO', 101, 60, 0, 15, 36, 31, 5, 0, 0, 248, CAST(-35.56507874 AS Decimal(10, 8)), CAST(-63.84614944 AS Decimal(10, 8)), 206, 1, N'SUCESION DE RODRIGUEZ OSCAR HORACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00708/00', N'10.015.0.00708', 773, N'LA PAMPA', N'MARACO', 553, 555, 2, 9, 178, 9, 15, 736, 0, 2057, CAST(-35.55170822 AS Decimal(10, 8)), CAST(-63.84537125 AS Decimal(10, 8)), 206, 1, N'RODRIGUEZ MIGUEL ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00715/00', N'10.015.0.00715', 496, N'LA PAMPA', N'MARACO', 192, 294, 211, 372, 113, 130, 5, 0, 0, 1317, CAST(-35.55689240 AS Decimal(10, 8)), CAST(-63.66189957 AS Decimal(10, 8)), 206, 1, N'PORTU CARLOS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00715/02', N'10.015.0.00715', 496, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.55689240 AS Decimal(10, 8)), CAST(-63.66189957 AS Decimal(10, 8)), 206, 1, N'CUELLO & DIVAN S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00715/03', N'10.015.0.00715', 496, N'LA PAMPA', N'MARACO', 0, 0, 19, 10, 0, 15, 0, 0, 0, 44, CAST(-35.55689240 AS Decimal(10, 8)), CAST(-63.66189957 AS Decimal(10, 8)), 206, 1, N'MORAN DIEGO MAX')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00715/04', N'10.015.0.00715', 496, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.55689240 AS Decimal(10, 8)), CAST(-63.66189957 AS Decimal(10, 8)), 206, 1, N'PORTU CARLOS ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00716/00', N'10.015.0.00716', 306, N'LA PAMPA', N'MARACO', 0, 0, 404, 739, 0, 111, 0, 0, 0, 1254, CAST(-35.69102097 AS Decimal(10, 8)), CAST(-63.44091034 AS Decimal(10, 8)), 206, 1, N'ESTABLECIMIENTO SAN LORENZO S.R.L')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00716/01', N'10.015.0.00716', 306, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.69102097 AS Decimal(10, 8)), CAST(-63.44091034 AS Decimal(10, 8)), 206, 1, N'COSTILLA STELLA MARIS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00719/00', N'10.015.0.00719', 196, N'LA PAMPA', N'MARACO', 100, 0, 0, 0, 30, 46, 2, 3, 0, 181, CAST(-35.81415939 AS Decimal(10, 8)), CAST(-63.89537811 AS Decimal(10, 8)), 206, 1, N'SANCHEZ ENRIQUE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00721/01', N'10.015.0.00721', 120, N'LA PAMPA', N'MARACO', 14, 0, 0, 0, 5, 3, 2, 0, 0, 24, CAST(-35.54328918 AS Decimal(10, 8)), CAST(-63.69475937 AS Decimal(10, 8)), 206, 1, N'O''BRIEN EDGARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00727/00', N'10.015.0.00727', 33, N'LA PAMPA', N'MARACO', 36, 0, 7, 2, 10, 13, 0, 0, 0, 68, CAST(-35.79415131 AS Decimal(10, 8)), CAST(-63.71778107 AS Decimal(10, 8)), 206, 1, N'SERVICIOS AGRARIOS SAN JOSE SAS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00743/01', N'10.015.0.00743', 461, N'LA PAMPA', N'MARACO', 3, 27, 0, 150, 0, 55, 0, 0, 0, 235, CAST(-35.50986862 AS Decimal(10, 8)), CAST(-63.61771011 AS Decimal(10, 8)), 206, 1, N'AGRONOR S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00743/02', N'10.015.0.00743', 461, N'LA PAMPA', N'MARACO', 80, 61, 0, 0, 20, 50, 2, 8, 0, 221, CAST(-35.50986862 AS Decimal(10, 8)), CAST(-63.61771011 AS Decimal(10, 8)), 206, 1, N'LA MORENA S.R.L.')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00761/00', N'10.015.0.00761', 202, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72434616 AS Decimal(10, 8)), CAST(-63.81606293 AS Decimal(10, 8)), 206, 1, N'RAUL SEREN Y JORGE RAUL SEREN SOCIEDAD DE HECHO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00761/01', N'10.015.0.00761', 202, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72434616 AS Decimal(10, 8)), CAST(-63.81606293 AS Decimal(10, 8)), 206, 1, N'RAMIREZ DANIEL ALFREDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00782/01', N'10.015.0.00782', 331, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.78475952 AS Decimal(10, 8)), CAST(-63.80530167 AS Decimal(10, 8)), 206, 1, N'SUCESION DE SANCHEZ HECTOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00782/02', N'10.015.0.00782', 331, N'LA PAMPA', N'MARACO', 27, 0, 0, 0, 0, 0, 0, 0, 0, 27, CAST(-35.78475952 AS Decimal(10, 8)), CAST(-63.80530167 AS Decimal(10, 8)), 206, 1, N'LA BERTHA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00785/02', N'10.015.0.00785', 60, N'LA PAMPA', N'MARACO', 31, 4, 0, 4, 7, 3, 0, 0, 0, 49, CAST(-35.54410934 AS Decimal(10, 8)), CAST(-63.79539108 AS Decimal(10, 8)), 206, 1, N'O BRIEN GERARDO PATRICIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00786/00', N'10.015.0.00786', 24, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67945099 AS Decimal(10, 8)), CAST(-63.79750061 AS Decimal(10, 8)), 206, 1, N'MINETTO RAUL ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00786/01', N'10.015.0.00786', 24, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67945099 AS Decimal(10, 8)), CAST(-63.79750061 AS Decimal(10, 8)), 206, 1, N'RAICES AGROPECUARIAS SRL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00786/02', N'10.015.0.00786', 24, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67945099 AS Decimal(10, 8)), CAST(-63.79750061 AS Decimal(10, 8)), 206, 1, N'AGROPECUARIA LAS VERTIENTES')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00787/00', N'10.015.0.00787', 294, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.65182877 AS Decimal(10, 8)), CAST(-63.92678070 AS Decimal(10, 8)), 206, 1, N'GONZALEZ SEBASTIAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00800/01', N'10.015.0.00800', 50, N'LA PAMPA', N'MARACO', 36, 40, 0, 0, 5, 4, 2, 0, 0, 87, CAST(-35.90295792 AS Decimal(10, 8)), CAST(-63.85700226 AS Decimal(10, 8)), 206, 1, N'BLANCO PABLO MARTIN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00802/01', N'10.015.0.00802', 399, N'LA PAMPA', N'MARACO', 465, 0, 0, 0, 0, 0, 18, 0, 0, 483, CAST(-35.85774994 AS Decimal(10, 8)), CAST(-63.80081940 AS Decimal(10, 8)), 206, 1, N'LA BERTHA SOCIEDAD ANONIMA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00802/05', N'10.015.0.00802', 399, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.85774994 AS Decimal(10, 8)), CAST(-63.80081940 AS Decimal(10, 8)), 206, 1, N'VICENTE HNOS SOC COLECTIVA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00802/08', N'10.015.0.00802', 399, N'LA PAMPA', N'MARACO', 32, 0, 0, 0, 0, 0, 0, 0, 0, 32, CAST(-35.85774994 AS Decimal(10, 8)), CAST(-63.80081940 AS Decimal(10, 8)), 206, 1, N'VICENTE HERRERO JUAN MANUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00802/09', N'10.015.0.00802', 399, N'LA PAMPA', N'MARACO', 32, 0, 0, 0, 0, 0, 0, 0, 0, 32, CAST(-35.85774994 AS Decimal(10, 8)), CAST(-63.80081940 AS Decimal(10, 8)), 206, 1, N'VICENTE HERRERO FEDERICO GASTON')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00804/00', N'10.015.0.00804', 232, N'LA PAMPA', N'MARACO', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(-35.71532059 AS Decimal(10, 8)), CAST(-63.74757004 AS Decimal(10, 8)), 206, 1, N'AGRICOLA CUMECO SA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00805/01', N'10.015.0.00805', 96, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 30, 0, 30, CAST(-35.55472183 AS Decimal(10, 8)), CAST(-63.93687057 AS Decimal(10, 8)), 206, 1, N'RODRIGUEZ MIGUEL ANGEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00811/00', N'10.015.0.00811', 220, N'LA PAMPA', N'MARACO', 195, 206, 58, 630, 108, 106, 16, 0, 0, 1319, CAST(-35.67940903 AS Decimal(10, 8)), CAST(-63.71749878 AS Decimal(10, 8)), 206, 1, N'BROWN FELIPE JORGE')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00814/00', N'10.015.0.00814', 150, N'LA PAMPA', N'MARACO', 100, 0, 0, 0, 10, 13, 6, 0, 0, 129, CAST(-35.47361755 AS Decimal(10, 8)), CAST(-63.83736420 AS Decimal(10, 8)), 206, 1, N'LEVRA ARIEL ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00817/00', N'10.015.0.00817', 200, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.82767868 AS Decimal(10, 8)), CAST(-63.88449097 AS Decimal(10, 8)), 206, 1, N'DALMASSO CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00819/00', N'10.015.0.00819', 27, N'LA PAMPA', N'MARACO', 31, 32, 31, 82, 1958, 239, 0, 1, 0, 2374, CAST(-35.67139053 AS Decimal(10, 8)), CAST(-63.66181946 AS Decimal(10, 8)), 206, 1, N'ALBERTO TOBAL S A')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00819/02', N'10.015.0.00819', 27, N'LA PAMPA', N'MARACO', 0, 10, 0, 0, 88, 0, 0, 0, 0, 98, CAST(-35.67139053 AS Decimal(10, 8)), CAST(-63.66181946 AS Decimal(10, 8)), 206, 1, N'TOBAL NORMA ALEJANDRA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00819/03', N'10.015.0.00819', 27, N'LA PAMPA', N'MARACO', 0, 37, 0, 0, 83, 0, 0, 0, 0, 120, CAST(-35.67139053 AS Decimal(10, 8)), CAST(-63.66181946 AS Decimal(10, 8)), 206, 1, N'TOBAL ALBERTO FERNANDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00819/04', N'10.015.0.00819', 27, N'LA PAMPA', N'MARACO', 0, 17, 0, 0, 99, 0, 0, 0, 0, 116, CAST(-35.67139053 AS Decimal(10, 8)), CAST(-63.66181946 AS Decimal(10, 8)), 206, 1, N'TOBAL MARIA GABRIELA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.00822/00', N'10.015.0.00822', 400, N'LA PAMPA', N'MARACO', 152, 1, 69, 0, 64, 58, 5, 0, 0, 349, CAST(-35.72454071 AS Decimal(10, 8)), CAST(-63.80817032 AS Decimal(10, 8)), 206, 1, N'ALONSO JOSE JAIME')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06001/00', N'10.015.0.06001', 20, N'LA PAMPA', N'MARACO', 39, 0, 0, 0, 0, 0, 1, 0, 0, 40, CAST(-35.66287994 AS Decimal(10, 8)), CAST(-63.78438950 AS Decimal(10, 8)), 206, 1, N'FRIAS JAVIER RUBEN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06002/00', N'10.015.0.06002', 315, N'LA PAMPA', N'MARACO', 25, 16, 0, 183, 127, 101, 0, 0, 0, 452, CAST(-35.67992020 AS Decimal(10, 8)), CAST(-63.51016998 AS Decimal(10, 8)), 206, 1, N'SUCESION DE CACHAU JORGE ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06007/02', N'10.015.0.06007', 100, N'LA PAMPA', N'MARACO', 92, 19, 0, 0, 20, 35, 2, 0, 0, 168, CAST(-35.50637054 AS Decimal(10, 8)), CAST(-63.84514999 AS Decimal(10, 8)), 206, 1, N'CABODEVILLA GUSTAVO ADOLFO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06011/00', N'10.015.0.06011', 11, N'LA PAMPA', N'MARACO', 4, 1, 0, 0, 0, 2, 1, 0, 0, 8, CAST(-35.64296341 AS Decimal(10, 8)), CAST(-63.73404312 AS Decimal(10, 8)), 206, 1, N'NILLES JUAN RODOLFO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06012/00', N'10.015.0.06012', 15, N'LA PAMPA', N'MARACO', 62, 0, 0, 0, 1, 3, 2, 0, 0, 68, CAST(-35.64319992 AS Decimal(10, 8)), CAST(-63.74542999 AS Decimal(10, 8)), 206, 1, N'FERREYRA HUGO ALEJANDRO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06013/00', N'10.015.0.06013', 100, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.72251892 AS Decimal(10, 8)), CAST(-63.75777817 AS Decimal(10, 8)), 206, 1, N'GONELLA RUBEN ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06014/00', N'10.015.0.06014', 57, N'LA PAMPA', N'MARACO', 14, 5, 0, 0, 3, 3, 1, 0, 0, 26, CAST(-35.62779999 AS Decimal(10, 8)), CAST(-63.86548996 AS Decimal(10, 8)), 206, 1, N'MENICHELLI NILDA MARGARITA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06015/00', N'10.015.0.06015', 25, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.78078842 AS Decimal(10, 8)), CAST(-63.39387131 AS Decimal(10, 8)), 206, 1, N'ANDREOLI HECTOR HORACIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06016/01', N'10.015.0.06016', 5, N'LA PAMPA', N'MARACO', 0, 2, 0, 2, 0, 0, 0, 0, 0, 4, CAST(-35.55287933 AS Decimal(10, 8)), CAST(-63.81653976 AS Decimal(10, 8)), 206, 1, N'VASSALLO NESTOR OMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06017/00', N'10.015.0.06017', 10, N'LA PAMPA', N'MARACO', 27, 6, 0, 10, 6, 2, 1, 0, 0, 52, CAST(-35.55371094 AS Decimal(10, 8)), CAST(-63.81309128 AS Decimal(10, 8)), 206, 1, N'VASSALLO OMAR ESTEBAN')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06024/00', N'10.015.0.06024', 100, N'LA PAMPA', N'MARACO', 23, 3, 0, 0, 3, 9, 1, 0, 0, 39, CAST(-35.54409027 AS Decimal(10, 8)), CAST(-63.71693039 AS Decimal(10, 8)), 206, 1, N'SOULE JUAN HECTOR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06036/01', N'10.015.0.06036', 10, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.76964188 AS Decimal(10, 8)), CAST(-63.93648911 AS Decimal(10, 8)), 206, 1, N'AMUNDARAIN SANDRA LILIANA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06038/00', N'10.015.0.06038', 5, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63956833 AS Decimal(10, 8)), CAST(-63.72808838 AS Decimal(10, 8)), 206, 1, N'BECERRA JUAN CARLOS')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06039/00', N'10.015.0.06039', 1, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.69660187 AS Decimal(10, 8)), CAST(-63.74721909 AS Decimal(10, 8)), 206, 1, N'GAMBOA ROQUE ALBERTO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06046/00', N'10.015.0.06046', 5, N'LA PAMPA', N'MARACO', 15, 0, 0, 0, 5, 2, 2, 0, 0, 24, CAST(-35.54566956 AS Decimal(10, 8)), CAST(-63.81565094 AS Decimal(10, 8)), 206, 1, N'TOLEDO CECILIO ')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06047/00', N'10.015.0.06047', 4, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.55060959 AS Decimal(10, 8)), CAST(-63.80144119 AS Decimal(10, 8)), 206, 1, N'FIGUEROA JULIO CESAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06060/00', N'10.015.0.06060', 15, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.54684830 AS Decimal(10, 8)), CAST(-63.81216812 AS Decimal(10, 8)), 206, 1, N'LA JOYITA S R L')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06099/03', N'10.015.0.06099', 240, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.63359070 AS Decimal(10, 8)), CAST(-63.74609756 AS Decimal(10, 8)), 206, 1, N'COOPERADORA DE CIENCIAS VETERINARIAS DE LA PAMPA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06101/00', N'10.015.0.06101', 10, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.68605042 AS Decimal(10, 8)), CAST(-63.74214172 AS Decimal(10, 8)), 206, 1, N'BONGIANINO CARLOS OMAR')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06106/03', N'10.015.0.06106', 34, N'LA PAMPA', N'MARACO', 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, CAST(-35.69153976 AS Decimal(10, 8)), CAST(-63.77827835 AS Decimal(10, 8)), 206, 1, N'BAUDINO JOSE MARIA')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06130/00', N'10.015.0.06130', 7, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.64360809 AS Decimal(10, 8)), CAST(-63.71955109 AS Decimal(10, 8)), 206, 1, N'GENTILI SERGIO ALEJANDRO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.015.0.06149/01', N'10.015.0.06149', 42, N'LA PAMPA', N'MARACO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.67998886 AS Decimal(10, 8)), CAST(-63.67539978 AS Decimal(10, 8)), 206, 1, N'DALMASSO OBDULIO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.017.0.00007/01', N'10.017.0.00007', 1227, N'LA PAMPA', N'QUEMU QUEMU', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.95075989 AS Decimal(10, 8)), CAST(-63.70463943 AS Decimal(10, 8)), 206, 1, N'ALBIZU MARCELO RICARDO')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.017.0.00007/02', N'10.017.0.00007', 1227, N'LA PAMPA', N'QUEMU QUEMU', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.95075989 AS Decimal(10, 8)), CAST(-63.70463943 AS Decimal(10, 8)), 206, 1, N'ALBIZU JOSE MANUEL')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.017.0.00007/03', N'10.017.0.00007', 1227, N'LA PAMPA', N'QUEMU QUEMU', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(-35.95075989 AS Decimal(10, 8)), CAST(-63.70463943 AS Decimal(10, 8)), 206, 1, N'ALBIZU MARIA MERCEDES')
GO
INSERT [dbo].[renspas] ([renspa], [establecimiento_id], [superficie], [provincia], [partido], [vacas], [vaquillonas], [novillos], [novillitos], [terneras], [terneros], [toros], [toritos], [bueyes], [total_bovinos], [latitud], [longitud], [codigo_plan], [fundacion_id], [titular]) VALUES (N'10.021.0.01007/02', N'10.021.0.01007', 200, N'LA PAMPA', N'TRENEL', 191, 52, 0, 38, 61, 69, 6, 0, 0, 417, CAST(-35.53646851 AS Decimal(10, 8)), CAST(-63.98820877 AS Decimal(10, 8)), 206, 1, N'PICCO CRISTINA ALEJANDRA')
GO
GO
SET IDENTITY_INSERT [dbo].[tipos_usuario] ON 
GO
INSERT [dbo].[tipos_usuario] ([id], [tipo], [fecha_creacion]) VALUES (1, N'Fundacion', CAST(N'2021-08-23T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[tipos_usuario] ([id], [tipo], [fecha_creacion]) VALUES (2, N'Vacunador', CAST(N'2021-08-23T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[tipos_usuario] OFF
GO
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 
GO
INSERT [dbo].[usuarios] ([id], [usuario], [pass], [fecha_creacion], [tipo_usuario], [fundacion_id]) VALUES (2, N'FundaGes', N'FundaGes', CAST(N'2021-08-23T00:00:00.0000000' AS DateTime2), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[usuarios] OFF 
SET IDENTITY_INSERT [dbo].[vacunadores] ON 
GO
INSERT [dbo].[vacunadores] ([id], [nombre], [fecha_creacion], [cuit], [token_senasa], [usuario_id], [fundacion_id]) VALUES (1, N'Vacunador Prueba', CAST(N'1987-04-25T00:00:00.0000000' AS DateTime2), N'20-12038293-5', N'1#!CWDft346/7UHgfCbVFHu56(9IKGHNN678%7eGSDXF#24 6/(uDFvg', 6, 1)
GO
SET IDENTITY_INSERT [dbo].[vacunadores] OFF
GO
INSERT [dbo].[vacunas] ([id], [codigo], [identificador], [marca], [descripcion]) VALUES (53, N'088773.039', N'039', N'BRUCELMIQ', N'Antibrucelica Liofi.')
GO
INSERT [dbo].[vacunas] ([id], [codigo], [identificador], [marca], [descripcion]) VALUES (54, N'088776.001', N'001', N'CENTRO DE DIAGNOSTICO VETERINARIO', N'Antibrucelica Liofi.')
GO

GO
/****** Object:  Index [idx_miembros_fundacion_notnull]    Script Date: 8/10/2021 21:25:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_miembros_fundacion_notnull] ON [dbo].[miembros_fundacion]
(
	[usuario_id] ASC
)
WHERE ([usuario_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__renspas__3213E83EB5D404C5]    Script Date: 8/10/2021 21:25:02 ******/
ALTER TABLE [dbo].[renspas] ADD  CONSTRAINT [UQ__renspas__3213E83EB5D404C5] UNIQUE NONCLUSTERED 
(
	[renspa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_vacunadores_notnull]    Script Date: 8/10/2021 21:25:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_vacunadores_notnull] ON [dbo].[vacunadores]
(
	[usuario_id] ASC
)
WHERE ([usuario_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[actas]  WITH CHECK ADD  CONSTRAINT [FK_actas_estados] FOREIGN KEY([estado])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[actas] CHECK CONSTRAINT [FK_actas_estados]
GO
ALTER TABLE [dbo].[actas]  WITH CHECK ADD  CONSTRAINT [FK_actas_fundaciones] FOREIGN KEY([fundacion_id])
REFERENCES [dbo].[fundaciones] ([id])
GO
ALTER TABLE [dbo].[actas] CHECK CONSTRAINT [FK_actas_fundaciones]
GO
ALTER TABLE [dbo].[actas_animales]  WITH CHECK ADD  CONSTRAINT [FK_actas_animales_actas] FOREIGN KEY([actas_codigo])
REFERENCES [dbo].[actas] ([codigo])
GO
ALTER TABLE [dbo].[actas_animales] CHECK CONSTRAINT [FK_actas_animales_actas]
GO
ALTER TABLE [dbo].[actas_animales_ddjj]  WITH CHECK ADD  CONSTRAINT [FK_actas_animales_ddjj_actas] FOREIGN KEY([actas_codigo])
REFERENCES [dbo].[actas] ([codigo])
GO
ALTER TABLE [dbo].[actas_animales_ddjj] CHECK CONSTRAINT [FK_actas_animales_ddjj_actas]
GO
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK__Animales__Especi__6EF57B66] FOREIGN KEY([EspecieID])
REFERENCES [dbo].[Especies] ([id])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK__Animales__Especi__6EF57B66]
GO
ALTER TABLE [dbo].[Establecimiento]  WITH CHECK ADD  CONSTRAINT [FK_Establecimiento_fundaciones] FOREIGN KEY([fundacion_id])
REFERENCES [dbo].[fundaciones] ([id])
GO
ALTER TABLE [dbo].[Establecimiento] CHECK CONSTRAINT [FK_Establecimiento_fundaciones]
GO
ALTER TABLE [dbo].[heladeras]  WITH CHECK ADD FOREIGN KEY([fundacion_id])
REFERENCES [dbo].[fundaciones] ([id])
GO
ALTER TABLE [dbo].[heladeras]  WITH CHECK ADD FOREIGN KEY([subcentro_id])
REFERENCES [dbo].[subcentros] ([id])
GO
ALTER TABLE [dbo].[miembros_fundacion]  WITH CHECK ADD  CONSTRAINT [FK_miembros_fundacion_fundaciones] FOREIGN KEY([fundacion_id])
REFERENCES [dbo].[fundaciones] ([id])
GO
ALTER TABLE [dbo].[miembros_fundacion] CHECK CONSTRAINT [FK_miembros_fundacion_fundaciones]
GO
ALTER TABLE [dbo].[miembros_fundacion]  WITH CHECK ADD  CONSTRAINT [FK_miembros_fundacion_usuarios] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[miembros_fundacion] CHECK CONSTRAINT [FK_miembros_fundacion_usuarios]
GO
ALTER TABLE [dbo].[renspas]  WITH CHECK ADD  CONSTRAINT [FK_renspas_Establecimiento] FOREIGN KEY([establecimiento_id])
REFERENCES [dbo].[Establecimiento] ([id])
GO
ALTER TABLE [dbo].[renspas] CHECK CONSTRAINT [FK_renspas_Establecimiento]
GO
ALTER TABLE [dbo].[subcentros]  WITH CHECK ADD FOREIGN KEY([fundacion_id])
REFERENCES [dbo].[fundaciones] ([id])
GO
ALTER TABLE [dbo].[turnos]  WITH CHECK ADD  CONSTRAINT [FK_turnos_Establecimiento] FOREIGN KEY([establecimiento_id])
REFERENCES [dbo].[Establecimiento] ([id])
GO
ALTER TABLE [dbo].[turnos] CHECK CONSTRAINT [FK_turnos_Establecimiento]
GO
ALTER TABLE [dbo].[turnos]  WITH CHECK ADD  CONSTRAINT [FK_turnos_estados] FOREIGN KEY([estado])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[turnos] CHECK CONSTRAINT [FK_turnos_estados]
GO
ALTER TABLE [dbo].[turnos]  WITH CHECK ADD  CONSTRAINT [FK_turnos_fundaciones] FOREIGN KEY([fundacion_id])
REFERENCES [dbo].[fundaciones] ([id])
GO
ALTER TABLE [dbo].[turnos] CHECK CONSTRAINT [FK_turnos_fundaciones]
GO
ALTER TABLE [dbo].[turnos]  WITH CHECK ADD  CONSTRAINT [FK_turnos_vacunadores] FOREIGN KEY([vacunador_id])
REFERENCES [dbo].[vacunadores] ([id])
GO
ALTER TABLE [dbo].[turnos] CHECK CONSTRAINT [FK_turnos_vacunadores]
GO
ALTER TABLE [dbo].[turnos_renspas]  WITH CHECK ADD  CONSTRAINT [FK__turnos_re__rensp__45F365D3] FOREIGN KEY([renspas_id])
REFERENCES [dbo].[renspas] ([renspa])
GO
ALTER TABLE [dbo].[turnos_renspas] CHECK CONSTRAINT [FK__turnos_re__rensp__45F365D3]
GO
ALTER TABLE [dbo].[turnos_renspas]  WITH CHECK ADD  CONSTRAINT [FK__turnos_re__turno__44FF419A] FOREIGN KEY([turnos_id])
REFERENCES [dbo].[turnos] ([id])
GO
ALTER TABLE [dbo].[turnos_renspas] CHECK CONSTRAINT [FK__turnos_re__turno__44FF419A]
GO
ALTER TABLE [dbo].[turnos_vacunas]  WITH CHECK ADD  CONSTRAINT [FK__turnos_va__turno__4316F928] FOREIGN KEY([turnos_id])
REFERENCES [dbo].[turnos] ([id])
GO
ALTER TABLE [dbo].[turnos_vacunas] CHECK CONSTRAINT [FK__turnos_va__turno__4316F928]
GO
ALTER TABLE [dbo].[turnos_vacunas]  WITH CHECK ADD  CONSTRAINT [FK__turnos_va__vacun__440B1D61] FOREIGN KEY([vacunas_stock_id])
REFERENCES [dbo].[vacunas_stock] ([id])
GO
ALTER TABLE [dbo].[turnos_vacunas] CHECK CONSTRAINT [FK__turnos_va__vacun__440B1D61]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD FOREIGN KEY([tipo_usuario])
REFERENCES [dbo].[tipos_usuario] ([id])
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_fundaciones] FOREIGN KEY([fundacion_id])
REFERENCES [dbo].[fundaciones] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_fundaciones]
GO
ALTER TABLE [dbo].[vacunadores]  WITH CHECK ADD  CONSTRAINT [FK_vacunadores_fundaciones] FOREIGN KEY([fundacion_id])
REFERENCES [dbo].[fundaciones] ([id])
GO
ALTER TABLE [dbo].[vacunadores] CHECK CONSTRAINT [FK_vacunadores_fundaciones]
GO
ALTER TABLE [dbo].[vacunadores]  WITH CHECK ADD  CONSTRAINT [FK_vacunadores_usuarios] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[vacunadores] CHECK CONSTRAINT [FK_vacunadores_usuarios]
GO
ALTER TABLE [dbo].[vacunas_stock]  WITH CHECK ADD FOREIGN KEY([heladera_id])
REFERENCES [dbo].[heladeras] ([id])
GO
ALTER TABLE [dbo].[vacunas_stock]  WITH CHECK ADD  CONSTRAINT [FK__vacunas__tipos_v__3C69FB99] FOREIGN KEY([vacunas_id])
REFERENCES [dbo].[vacunas] ([id])
GO
ALTER TABLE [dbo].[vacunas_stock] CHECK CONSTRAINT [FK__vacunas__tipos_v__3C69FB99]
GO
ALTER TABLE [dbo].[vacunas_stock]  WITH CHECK ADD  CONSTRAINT [FK_vacunas_estados] FOREIGN KEY([estado_id])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[vacunas_stock] CHECK CONSTRAINT [FK_vacunas_estados]
GO
ALTER TABLE [dbo].[vacunas_stock]  WITH CHECK ADD  CONSTRAINT [FK_vacunas_stock_fundaciones] FOREIGN KEY([fundacion_id])
REFERENCES [dbo].[fundaciones] ([id])
GO
ALTER TABLE [dbo].[vacunas_stock] CHECK CONSTRAINT [FK_vacunas_stock_fundaciones]
GO
ALTER TABLE [dbo].[vacunas_stock]  WITH CHECK ADD  CONSTRAINT [FK_vacunas_stock_subcentros] FOREIGN KEY([subcentro_id])
REFERENCES [dbo].[subcentros] ([id])
GO
ALTER TABLE [dbo].[vacunas_stock] CHECK CONSTRAINT [FK_vacunas_stock_subcentros]
