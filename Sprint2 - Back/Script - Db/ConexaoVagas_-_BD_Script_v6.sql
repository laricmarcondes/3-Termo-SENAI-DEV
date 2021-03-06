USE [master]
GO
/****** Object:  Database [ConexaoVagas]    Script Date: 23/10/2020 16:20:54 ******/
CREATE DATABASE [ConexaoVagas]
 CONTAINMENT = NONE
GO
ALTER DATABASE [ConexaoVagas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConexaoVagas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConexaoVagas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConexaoVagas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConexaoVagas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConexaoVagas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConexaoVagas] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConexaoVagas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConexaoVagas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConexaoVagas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConexaoVagas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConexaoVagas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConexaoVagas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConexaoVagas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConexaoVagas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConexaoVagas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConexaoVagas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConexaoVagas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConexaoVagas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConexaoVagas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConexaoVagas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConexaoVagas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConexaoVagas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConexaoVagas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConexaoVagas] SET RECOVERY FULL 
GO
ALTER DATABASE [ConexaoVagas] SET  MULTI_USER 
GO
ALTER DATABASE [ConexaoVagas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConexaoVagas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConexaoVagas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConexaoVagas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConexaoVagas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConexaoVagas', N'ON'
GO
ALTER DATABASE [ConexaoVagas] SET QUERY_STORE = OFF
GO
USE [ConexaoVagas]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beneficio]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficio](
	[IdBeneficio] [int] IDENTITY(1,1) NOT NULL,
	[IdCriadoPor] [int] NULL,
	[NomeBeneficio] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Benefici__14B7CA0C4D6B1A08] PRIMARY KEY CLUSTERED 
(
	[IdBeneficio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BeneficioVaga]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BeneficioVaga](
	[IdBeneficioVaga] [int] IDENTITY(1,1) NOT NULL,
	[IdBeneficio] [int] NOT NULL,
	[IdVaga] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBeneficioVaga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidato]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidato](
	[IdUsuario] [int] NOT NULL,
	[IdStatusUsuario] [int] NOT NULL,
	[IdEndereco] [int] NULL,
	[Nome] [varchar](255) NULL,
	[Sobrenome] [varchar](255) NULL,
	[Curso] [varchar](255) NULL,
	[Matricula] [varchar](255) NOT NULL,
	[Cpf] [varchar](255) NOT NULL,
	[Rg] [varchar](255) NOT NULL,
	[Cep] [varchar](255) NOT NULL,
	[EnderecoCandidato] [varchar](255) NOT NULL,
	[NumeroEndereco] [int] NOT NULL,
	[TelefoneCandidato] [varchar](255) NOT NULL,
	[CelularCandidato] [varchar](255) NOT NULL,
	[DataNascimento] [date] NOT NULL,
	[Visualizacao] [int] NOT NULL,
 CONSTRAINT [PK__Candidat__D5598905F1707E7E] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidatura]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidatura](
	[IdCandidatura] [int] IDENTITY(1,1) NOT NULL,
	[IdCandidato] [int] NOT NULL,
	[IdVaga] [int] NOT NULL,
	[Curriculo] [varchar](255) NULL,
	[Visualizado] [bit] NOT NULL,
	[DataCriado] [datetime] NOT NULL,
 CONSTRAINT [PK__Candidat__7B9E9EACAE85B9C4] PRIMARY KEY CLUSTERED 
(
	[IdCandidatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdUsuario] [int] NOT NULL,
	[IdStatusUsuario] [int] NOT NULL,
	[Foto] [varchar](255) NULL,
	[Cnae] [varchar](255) NOT NULL,
	[Cnpj] [varchar](255) NOT NULL,
	[RazaoSocial] [varchar](255) NOT NULL,
	[TelefoneEmpresa] [varchar](255) NOT NULL,
	[CelularEmpresa] [varchar](255) NOT NULL,
	[CEP] [varchar](255) NOT NULL,
	[Endereco] [varchar](255) NOT NULL,
	[Numero] [int] NOT NULL,
	[Visualizacao] [int] NOT NULL,
 CONSTRAINT [PK__Empresa__5EF4033EBB5814A4] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[IdEndereco] [int] IDENTITY(1,1) NOT NULL,
	[Cep] [varchar](255) NULL,
	[LocalCompleto] [varchar](8000) NULL,
	[Uf] [varchar](255) NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[IdEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habilidade]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habilidade](
	[IdHabilidade] [int] IDENTITY(1,1) NOT NULL,
	[IdCriadoPor] [int] NULL,
	[NomeHabilidade] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Habilida__0DD4B30DBBE8726F] PRIMARY KEY CLUSTERED 
(
	[IdHabilidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabilidadeCandidato]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabilidadeCandidato](
	[IdHabilidadeCandidato] [int] IDENTITY(1,1) NOT NULL,
	[IdHabilidade] [int] NOT NULL,
	[IdCandidato] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHabilidadeCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabilidadeVaga]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabilidadeVaga](
	[IdHabilidadeVaga] [int] IDENTITY(1,1) NOT NULL,
	[IdHabilidade] [int] NOT NULL,
	[IdVaga] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHabilidadeVaga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificacao]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacao](
	[IdNotificacao] [int] IDENTITY(1,1) NOT NULL,
	[DataNotificacao] [datetime] NOT NULL,
	[Mensagem] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNotificacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusUsuario]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusUsuario](
	[IdStatusUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NomeStatus] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdStatusUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[IdTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Senha] [varchar](255) NOT NULL,
	[DataCadastrado] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaga]    Script Date: 23/10/2020 16:20:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaga](
	[IdVaga] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpresa] [int] NOT NULL,
	[IdEndereco] [int] NULL,
	[Titulo] [varchar](255) NOT NULL,
	[Salario] [decimal](18, 0) NOT NULL,
	[Local] [varchar](255) NOT NULL,
	[Cep] [varchar](255) NOT NULL,
	[Qualificacao] [varchar](255) NOT NULL,
	[DataCriado] [datetime] NOT NULL,
	[DataExpiracao] [datetime] NOT NULL,
	[CargaHoraria] [int] NOT NULL,
	[Descricao] [varchar](1000) NOT NULL,
	[Visualizacao] [int] NOT NULL,
 CONSTRAINT [PK__Vaga__A848DC3EC534346C] PRIMARY KEY CLUSTERED 
(
	[IdVaga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Beneficio] ON 

INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (1, NULL, N'FGTS')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (2, NULL, N'Vale-Transporte')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (3, NULL, N'Férias')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (4, NULL, N'Décimo terceiro salário')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (5, NULL, N'Vale Alimentação')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (6, NULL, N'Vale Refeição')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (7, NULL, N'Refeitório no local de trabalho')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (8, NULL, N'Cesta Básica')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (9, NULL, N'Assistência médica')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (10, NULL, N'Vale Combustível')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (11, NULL, N'Vale automóvel')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (12, NULL, N'Vale-cultura')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (13, NULL, N'Home office e Horários flexíveis')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (14, NULL, N'Bolsas de estudo')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (15, NULL, N'Auxílio creche ou espaço para as crianças na empresa')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (16, NULL, N'Participação dos lucros (PLR)')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (17, NULL, N'Academias')
INSERT [dbo].[Beneficio] ([IdBeneficio], [IdCriadoPor], [NomeBeneficio]) VALUES (18, NULL, N'Convênio com estabelecimentos próximos ao local de trabalho')
SET IDENTITY_INSERT [dbo].[Beneficio] OFF
SET IDENTITY_INSERT [dbo].[BeneficioVaga] ON 

INSERT [dbo].[BeneficioVaga] ([IdBeneficioVaga], [IdBeneficio], [IdVaga]) VALUES (19, 1, 8)
INSERT [dbo].[BeneficioVaga] ([IdBeneficioVaga], [IdBeneficio], [IdVaga]) VALUES (20, 5, 9)
INSERT [dbo].[BeneficioVaga] ([IdBeneficioVaga], [IdBeneficio], [IdVaga]) VALUES (21, 12, 10)
INSERT [dbo].[BeneficioVaga] ([IdBeneficioVaga], [IdBeneficio], [IdVaga]) VALUES (22, 2, 8)
INSERT [dbo].[BeneficioVaga] ([IdBeneficioVaga], [IdBeneficio], [IdVaga]) VALUES (23, 2, 9)
INSERT [dbo].[BeneficioVaga] ([IdBeneficioVaga], [IdBeneficio], [IdVaga]) VALUES (24, 2, 10)
INSERT [dbo].[BeneficioVaga] ([IdBeneficioVaga], [IdBeneficio], [IdVaga]) VALUES (25, 2, 8)
SET IDENTITY_INSERT [dbo].[BeneficioVaga] OFF
INSERT [dbo].[Candidato] ([IdUsuario], [IdStatusUsuario], [IdEndereco], [Nome], [Sobrenome], [Curso], [Matricula], [Cpf], [Rg], [Cep], [EnderecoCandidato], [NumeroEndereco], [TelefoneCandidato], [CelularCandidato], [DataNascimento], [Visualizacao]) VALUES (1049, 2, NULL, N'Matheus', N'Emorge', N'Desenvolvimento de Sistemas', N'15121105', N'051.859.728-57', N'12.548.460-9', N'01201000', N'Rua Teste 2', 254, N'(11) 2919-2020', N'(11) 98631-6715', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Empresa] ([IdUsuario], [IdStatusUsuario], [Foto], [Cnae], [Cnpj], [RazaoSocial], [TelefoneEmpresa], [CelularEmpresa], [CEP], [Endereco], [Numero], [Visualizacao]) VALUES (1050, 1, N'string', N'4525-5', N'93.007.326/0001-21', N'Empresa123', N'(11) 2511-0952', N'(11) 98195-9192', N'07864-190', N'Rua Pica-pau', 883, 2302)
SET IDENTITY_INSERT [dbo].[Habilidade] ON 

INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (1, NULL, N'.NET')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (2, NULL, N'ABAP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (3, NULL, N'ABNF')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (4, NULL, N'Ada')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (5, NULL, N'Administrador de sistema')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (6, NULL, N'Adobe')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (7, NULL, N'Adobe Photoshop')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (8, NULL, N'AdonisJS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (9, NULL, N'ADVPL ASP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (10, NULL, N'Agavi')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (11, NULL, N'Agda')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (12, NULL, N'AgilePHP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (13, NULL, N'AGS Script')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (14, NULL, N'Ajax')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (15, NULL, N'Akelos')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (16, NULL, N'Akka')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (17, NULL, N'Alloy')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (18, NULL, N'Alpine Abuild')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (19, NULL, N'Amazon Lambda')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (20, NULL, N'Amazon Redshift')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (21, NULL, N'Amazon S3')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (22, NULL, N'Amazon Web Services')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (23, NULL, N'AMPL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (24, NULL, N'Android')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (25, NULL, N'Android Application Development')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (26, NULL, N'Android Development')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (27, NULL, N'Android SDK')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (28, NULL, N'Android Studio')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (29, NULL, N'Angular JS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (30, NULL, N'Ansible')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (31, NULL, N'Ant Build System')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (32, NULL, N'ANTLR')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (33, NULL, N'Apache')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (34, NULL, N'Apache Cassandra')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (35, NULL, N'Apache Kafka')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (36, NULL, N'Apache Solr')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (37, NULL, N'Apache Storm')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (38, NULL, N'Apache Tomcat')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (39, NULL, N'Apex')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (40, NULL, N'API')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (41, NULL, N'APL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (42, NULL, N'Apollo Guidance Computer')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (43, NULL, N'AppleScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (44, NULL, N'Application deployment (Docker)')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (45, NULL, N'Arc')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (46, NULL, N'Arduino')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (47, NULL, N'ARKit')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (48, NULL, N'AsciiDoc')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (49, NULL, N'ASN.1')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (50, NULL, N'ASP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (51, NULL, N'ASP.NET Core')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (52, NULL, N'ASP.NET MVC')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (53, NULL, N'AspectJ')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (54, NULL, N'Assembly')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (55, NULL, N'Atomik')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (56, NULL, N'ATS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (57, NULL, N'Augeas')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (58, NULL, N'Aura')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (59, NULL, N'Aurelia')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (60, NULL, N'AutoHotkey')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (61, NULL, N'AutoIt')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (62, NULL, N'Automation')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (63, NULL, N'Autonomia')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (64, NULL, N'Awk')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (65, NULL, N'AWS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (66, NULL, N'AWS Cloud Services')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (67, NULL, N'AWS EC2 (Elastic Compute Cloud)')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (68, NULL, N'AWS Lambda')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (69, NULL, N'AWS RDS (Relational Database Service)')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (70, NULL, N'AWS S3')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (71, NULL, N'BabelJS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (72, NULL, N'Backbone.js')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (73, NULL, N'Backendless')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (74, NULL, N'Banco de Dados')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (75, NULL, N'Bash')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (76, NULL, N'Bash Scripting')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (77, NULL, N'Batchfile')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (78, NULL, N'Beego')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (79, NULL, N'Befunge')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (80, NULL, N'Big Data')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (81, NULL, N'Bison')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (82, NULL, N'BitBake')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (83, NULL, N'Bitbucket')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (84, NULL, N'Blade')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (85, NULL, N'BlitzBasic')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (86, NULL, N'BlitzMax')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (87, NULL, N'Bluespec')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (88, NULL, N'Boo')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (89, NULL, N'Bootstrap')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (90, NULL, N'Bottle')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (91, NULL, N'Brainfuck')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (92, NULL, N'Brightscript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (93, NULL, N'Bro')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (94, NULL, N'Brutos')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (95, NULL, N'Business Development')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (96, NULL, N'C')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (97, NULL, N'C-ObjDump')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (98, NULL, N'C#')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (99, NULL, N'C++')
GO
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (100, NULL, N'C2hs Haskell')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (101, NULL, N'Cairngorm')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (102, NULL, N'CakePHP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (103, NULL, N'Camping')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (104, NULL, N'Cap''n Proto')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (105, NULL, N'Capacidade de concentração')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (106, NULL, N'Capacidade de organização')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (107, NULL, N'Cappuccino')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (108, NULL, N'CartoCSS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (109, NULL, N'Cascading Style Sheet (CSS)')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (110, NULL, N'Cassandra')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (111, NULL, N'Catalyst')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (112, NULL, N'Celery')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (113, NULL, N'Ceylon')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (114, NULL, N'CGI::Application')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (115, NULL, N'CGI::Prototype')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (116, NULL, N'Chapel')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (117, NULL, N'Charity')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (118, NULL, N'Chef')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (119, NULL, N'CherryPy')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (120, NULL, N'ChucK')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (121, NULL, N'Circumflex')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (122, NULL, N'Cirru')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (123, NULL, N'Clarion')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (124, NULL, N'Clean')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (125, NULL, N'ClearPress')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (126, NULL, N'Click')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (127, NULL, N'CLIPS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (128, NULL, N'Clojure')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (129, NULL, N'Cloud')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (130, NULL, N'CMake')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (131, NULL, N'COBOL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (132, NULL, N'Cocoon')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (133, NULL, N'CodeIgniter')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (134, NULL, N'Coffeescript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (135, NULL, N'Colaboração')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (136, NULL, N'ColdFusion')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (137, NULL, N'ColdFusion CFC')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (138, NULL, N'COLLADA')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (139, NULL, N'Common Lisp')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (140, NULL, N'Competência intercultural')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (141, NULL, N'Compojure')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (142, NULL, N'Component Pascal')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (143, NULL, N'CompoundJS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (144, NULL, N'Comunicação efetiva')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (145, NULL, N'Conjure')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (146, NULL, N'Consulting')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (147, NULL, N'Continuous Deployment')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (148, NULL, N'Continuous Integration')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (149, NULL, N'Cool')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (150, NULL, N'Coq')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (151, NULL, N'Cordova')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (152, NULL, N'Core Java / Java SE')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (153, NULL, N'Cpp-ObjDump')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (154, NULL, N'Creole')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (155, NULL, N'Criatividade')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (156, NULL, N'Crystal')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (157, NULL, N'CSON')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (158, NULL, N'Csound')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (159, NULL, N'Csound Document')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (160, NULL, N'Csound Score')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (161, NULL, N'CSS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (162, NULL, N'CSS3')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (163, NULL, N'CSV')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (164, NULL, N'Cuba')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (165, NULL, N'Cucumber')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (166, NULL, N'Cuda')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (167, NULL, N'Customer Relationship Management')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (168, NULL, N'Customer Service')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (169, NULL, N'Cutelyst')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (170, NULL, N'Cyclone3')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (171, NULL, N'Cycript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (172, NULL, N'Cython')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (173, NULL, N'D')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (174, NULL, N'D-ObjDump')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (175, NULL, N'D3.js')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (176, NULL, N'Darcs Patch')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (177, NULL, N'Dart')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (178, NULL, N'Data Analysis')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (179, NULL, N'Data Management')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (180, NULL, N'Data Science')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (181, NULL, N'Data Warehouse')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (182, NULL, N'Delphi')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (183, NULL, N'Demandware')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (184, NULL, N'Design')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (185, NULL, N'Design de Banco de Dados e Sistemas')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (186, NULL, N'Design Pattern')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (187, NULL, N'Dev Ops')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (188, NULL, N'Diff')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (189, NULL, N'DIGITAL Command Language')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (190, NULL, N'Django')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (191, NULL, N'DM')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (192, NULL, N'DNS Zone')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (193, NULL, N'Docker')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (194, NULL, N'Doctrine')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (195, NULL, N'Dogescript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (196, NULL, N'Dojo')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (197, NULL, N'Dropwizard')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (198, NULL, N'Drupal')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (199, NULL, N'DTrace')
GO
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (200, NULL, N'Durandal')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (201, NULL, N'Dylan')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (202, NULL, N'DynamoDB')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (203, NULL, N'Eagle')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (204, NULL, N'EBNF')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (205, NULL, N'eC')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (206, NULL, N'Ecere Projects')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (207, NULL, N'ECL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (208, NULL, N'Eclipse')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (209, NULL, N'Edn')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (210, NULL, N'Eiffel')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (211, NULL, N'EJB')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (212, NULL, N'EJS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (213, NULL, N'ElasticSearch')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (214, NULL, N'Eliom')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (215, NULL, N'Elixir')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (216, NULL, N'Elm')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (217, NULL, N'Emacs Lisp')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (218, NULL, N'Email')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (219, NULL, N'Ember.js')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (220, NULL, N'EmberScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (221, NULL, N'Engineering')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (222, NULL, N'Entity framework')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (223, NULL, N'EQ')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (224, NULL, N'Erlang')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (225, NULL, N'Erlang Web')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (226, NULL, N'ErlyWeb')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (227, NULL, N'ERP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (228, NULL, N'ES6')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (229, NULL, N'Esforço')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (230, NULL, N'ETL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (231, NULL, N'Excel')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (232, NULL, N'Express')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (233, NULL, N'F#')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (234, NULL, N'Facebook API')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (235, NULL, N'Factor')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (236, NULL, N'Fancy')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (237, NULL, N'Fantom')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (238, NULL, N'Feathers')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (239, NULL, N'Filebench WML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (240, NULL, N'Filterscript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (241, NULL, N'Firebase')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (242, NULL, N'Fish')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (243, NULL, N'Flask')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (244, NULL, N'Flatiron')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (245, NULL, N'Flex')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (246, NULL, N'Flexibilidade')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (247, NULL, N'Flight')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (248, NULL, N'Flutter')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (249, NULL, N'FLUX')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (250, NULL, N'Força de vontande')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (251, NULL, N'Formatted')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (252, NULL, N'Forth')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (253, NULL, N'FORTRAN')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (254, NULL, N'FreeMarker')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (255, NULL, N'Frege')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (256, NULL, N'FuelPHP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (257, NULL, N'G-code')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (258, NULL, N'Game Maker Language')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (259, NULL, N'GAMS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (260, NULL, N'Gantry')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (261, NULL, N'GAP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (262, NULL, N'Garantia de Qualidade')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (263, NULL, N'GAS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (264, NULL, N'GCC Machine Description')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (265, NULL, N'GDB')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (266, NULL, N'GDScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (267, NULL, N'Genshi')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (268, NULL, N'Gentoo Ebuild')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (269, NULL, N'Gentoo Eclass')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (270, NULL, N'Gerenciamento de Banco de Dados')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (271, NULL, N'Gettext Catalog')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (272, NULL, N'Gin')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (273, NULL, N'Git')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (274, NULL, N'Github')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (275, NULL, N'GLSL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (276, NULL, N'Glyph')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (277, NULL, N'GN')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (278, NULL, N'Gnuplot')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (279, NULL, N'Go')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (280, NULL, N'Golo')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (281, NULL, N'Google Analytics')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (282, NULL, N'Google Cloud')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (283, NULL, N'Google Maps API')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (284, NULL, N'Google Web Toolkit')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (285, NULL, N'Gosu')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (286, NULL, N'Grace')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (287, NULL, N'Gradle')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (288, NULL, N'Grails')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (289, NULL, N'Grain')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (290, NULL, N'Grammatical Framework')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (291, NULL, N'Graph Modeling Language')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (292, NULL, N'GraphQL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (293, NULL, N'Graphviz (DOT)')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (294, NULL, N'Groff')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (295, NULL, N'Grok')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (296, NULL, N'Groovy')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (297, NULL, N'Groovy Server Pages')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (298, NULL, N'Grunt')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (299, NULL, N'Gulp')
GO
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (300, NULL, N'GWT')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (301, NULL, N'Hack')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (302, NULL, N'Hadoop')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (303, NULL, N'Halcyon')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (304, NULL, N'Haml')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (305, NULL, N'Hanami')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (306, NULL, N'Handlebars')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (307, NULL, N'Happstack')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (308, NULL, N'Harbour')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (309, NULL, N'Haskell')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (310, NULL, N'Haxe')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (311, NULL, N'Hbase')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (312, NULL, N'HCL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (313, NULL, N'Hemlock')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (314, NULL, N'Heroku')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (315, NULL, N'Hibernate')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (316, NULL, N'Hindi Language')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (317, NULL, N'Hive')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (318, NULL, N'HLSL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (319, NULL, N'Horde')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (320, NULL, N'HTML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (321, NULL, N'HTML5')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (322, NULL, N'HTTP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (323, NULL, N'Human Resources')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (324, NULL, N'Hy')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (325, NULL, N'HybridJava')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (326, NULL, N'Hybris')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (327, NULL, N'HydraMVC')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (328, NULL, N'HyPhy')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (329, NULL, N'IDL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (330, NULL, N'Idris')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (331, NULL, N'IGOR Pro')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (332, NULL, N'Inform 7')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (333, NULL, N'Infrastructure')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (334, NULL, N'Inglês')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (335, NULL, N'INI')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (336, NULL, N'Iniciativa')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (337, NULL, N'Inno Setup')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (338, NULL, N'Inovação')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (339, NULL, N'Integrity')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (340, NULL, N'Inteligência emocional')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (341, NULL, N'Inventory')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (342, NULL, N'Io')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (343, NULL, N'Ioke')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (344, NULL, N'Ionic')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (345, NULL, N'iOS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (346, NULL, N'iOS Development')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (347, NULL, N'IRC log')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (348, NULL, N'Ireport')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (349, NULL, N'Isabelle')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (350, NULL, N'J')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (351, NULL, N'Jade')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (352, NULL, N'Jasmin')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (353, NULL, N'Jasper')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (354, NULL, N'Java')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (355, NULL, N'Java Server Pages')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (356, NULL, N'JavaEE')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (357, NULL, N'JavaScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (358, NULL, N'Javascript Frameworks')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (359, NULL, N'JavaScriptMVC')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (360, NULL, N'Jenkins')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (361, NULL, N'JFlex')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (362, NULL, N'Jifty')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (363, NULL, N'JMeter')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (364, NULL, N'jQuery')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (365, NULL, N'jQuery Mobile')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (366, NULL, N'JSF')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (367, NULL, N'JSON')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (368, NULL, N'JSX')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (369, NULL, N'Julia')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (370, NULL, N'JUNIT')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (371, NULL, N'Jupyter Notebook')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (372, NULL, N'JVM')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (373, NULL, N'Kafka')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (374, NULL, N'Kanban')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (375, NULL, N'KiCad')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (376, NULL, N'Kit')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (377, NULL, N'Koa')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (378, NULL, N'Kohana')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (379, NULL, N'Konstrukt')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (380, NULL, N'Kotlin')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (381, NULL, N'KRL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (382, NULL, N'Kubernetes')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (383, NULL, N'KumbiaPHP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (384, NULL, N'LabVIEW')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (385, NULL, N'Laravel')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (386, NULL, N'Lasso')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (387, NULL, N'Latte')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (388, NULL, N'Leadership')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (389, NULL, N'Lean')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (390, NULL, N'Lemmachine')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (391, NULL, N'Less')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (392, NULL, N'Lex')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (393, NULL, N'LFE')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (394, NULL, N'Liderança')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (395, NULL, N'Lift')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (396, NULL, N'LilyPond')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (397, NULL, N'Limbo')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (398, NULL, N'Linker Script')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (399, NULL, N'Linux')
GO
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (400, NULL, N'Linux Kernel Module')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (401, NULL, N'Linux System Administration')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (402, NULL, N'Liquid')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (403, NULL, N'LiquidLava')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (404, NULL, N'Literate Agda')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (405, NULL, N'Literate CoffeeScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (406, NULL, N'Literate Haskell')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (407, NULL, N'Lithium')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (408, NULL, N'LiveScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (409, NULL, N'LLVM')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (410, NULL, N'Logos')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (411, NULL, N'Logtalk')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (412, NULL, N'LOLCODE')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (413, NULL, N'LookML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (414, NULL, N'LoomScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (415, NULL, N'LSL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (416, NULL, N'Lua')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (417, NULL, N'LUMEN')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (418, NULL, N'M')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (419, NULL, N'M4')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (420, NULL, N'M4Sugar')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (421, NULL, N'Machine learning')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (422, NULL, N'Mack')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (423, NULL, N'Magento')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (424, NULL, N'Makefile')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (425, NULL, N'Mako')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (426, NULL, N'Management')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (427, NULL, N'Markdown')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (428, NULL, N'Marketing')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (429, NULL, N'Martini')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (430, NULL, N'Mask')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (431, NULL, N'Mason')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (432, NULL, N'Mate')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (433, NULL, N'Mathematica')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (434, NULL, N'Matlab')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (435, NULL, N'Maven POM')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (436, NULL, N'Maveric')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (437, NULL, N'Max')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (438, NULL, N'MAXScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (439, NULL, N'MediaWiki')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (440, NULL, N'Memcached')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (441, NULL, N'Merb')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (442, NULL, N'Mercury')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (443, NULL, N'Metal')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (444, NULL, N'Meteor')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (445, NULL, N'MFlow')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (446, NULL, N'Microsoft')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (447, NULL, N'Microsoft Azure')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (448, NULL, N'Microsoft Excel')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (449, NULL, N'Microsoft Office')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (450, NULL, N'Microsoft PowerPoint')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (451, NULL, N'Microsoft SQL Server')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (452, NULL, N'Microsoft Windows')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (453, NULL, N'Microsoft Word')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (454, NULL, N'MiniD')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (455, NULL, N'Mirah')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (456, NULL, N'Mithril')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (457, NULL, N'Modelica')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (458, NULL, N'Modula-2')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (459, NULL, N'Module Management System')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (460, NULL, N'Mojolicious')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (461, NULL, N'MongoDB')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (462, NULL, N'Monkey')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (463, NULL, N'Moocode')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (464, NULL, N'MoonScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (465, NULL, N'Moustache')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (466, NULL, N'MQL4')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (467, NULL, N'MQL5')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (468, NULL, N'MS SQL Server')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (469, NULL, N'MTML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (470, NULL, N'MUF')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (471, NULL, N'Mupad')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (472, NULL, N'Myghty')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (473, NULL, N'MySQL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (474, NULL, N'Nancy')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (475, NULL, N'NCL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (476, NULL, N'Nemerle')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (477, NULL, N'Neo4J')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (478, NULL, N'Nerve')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (479, NULL, N'NesC')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (480, NULL, N'NetLinx')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (481, NULL, N'NetLogo')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (482, NULL, N'Networking')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (483, NULL, N'NewLisp')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (484, NULL, N'Nginx')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (485, NULL, N'Nimrod')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (486, NULL, N'Ninja')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (487, NULL, N'Nit')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (488, NULL, N'Nitro')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (489, NULL, N'Nix')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (490, NULL, N'NL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (491, NULL, N'Node-router')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (492, NULL, N'Node.js')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (493, NULL, N'Nodemachine')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (494, NULL, N'Noir')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (495, NULL, N'NoSQL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (496, NULL, N'NPM')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (497, NULL, N'NSIS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (498, NULL, N'Nu')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (499, NULL, N'NumPy')
GO
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (500, NULL, N'ObjDump')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (501, NULL, N'Objective-C')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (502, NULL, N'Objective-C++')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (503, NULL, N'Objective-J')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (504, NULL, N'OCaml')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (505, NULL, N'Odoo')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (506, NULL, N'Omgrofl')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (507, NULL, N'Ooc')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (508, NULL, N'Opa')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (509, NULL, N'Opal')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (510, NULL, N'OpenCL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (511, NULL, N'OpenCV')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (512, NULL, N'OpenEdge ABL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (513, NULL, N'OpenGL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (514, NULL, N'OpenRC runscript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (515, NULL, N'OpenSCAD')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (516, NULL, N'OpenType Feature File')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (517, NULL, N'OpenUI5')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (518, NULL, N'Operações')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (519, NULL, N'Oracle')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (520, NULL, N'Orbit')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (521, NULL, N'Org')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (522, NULL, N'Ox')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (523, NULL, N'Oxygene')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (524, NULL, N'Oz')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (525, NULL, N'Pan')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (526, NULL, N'Papyrus')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (527, NULL, N'Parrot')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (528, NULL, N'Parrot Assembly')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (529, NULL, N'Parrot Internal Representation')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (530, NULL, N'Pascal')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (531, NULL, N'PAWN')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (532, NULL, N'Pensamento crítico')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (533, NULL, N'PeopleCode')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (534, NULL, N'Perfect')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (535, NULL, N'Perl')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (536, NULL, N'Perl6')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (537, NULL, N'Phalcon')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (538, NULL, N'Phoenix')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (539, NULL, N'PhoneGap')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (540, NULL, N'Photoshop')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (541, NULL, N'PHP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (542, NULL, N'Pic')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (543, NULL, N'Picard')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (544, NULL, N'Pickle')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (545, NULL, N'PicoLisp')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (546, NULL, N'PigLatin')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (547, NULL, N'Pike')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (548, NULL, N'Planning')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (549, NULL, N'Play')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (550, NULL, N'PLpgSQL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (551, NULL, N'PLSQL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (552, NULL, N'Pod')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (553, NULL, N'PogoScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (554, NULL, N'Polymer')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (555, NULL, N'Pony')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (556, NULL, N'POO')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (557, NULL, N'PostgreSQL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (558, NULL, N'PostScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (559, NULL, N'POV-Ray SDL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (560, NULL, N'PowerBuilder')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (561, NULL, N'PowerShell')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (562, NULL, N'Prado')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (563, NULL, N'Processing')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (564, NULL, N'Product Management')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (565, NULL, N'Produtividade')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (566, NULL, N'Programming')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (567, NULL, N'Progress')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (568, NULL, N'Project Management')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (569, NULL, N'Prolog')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (570, NULL, N'Propeller Spin')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (571, NULL, N'Protocol Buffer')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (572, NULL, N'Prototyping')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (573, NULL, N'Public Key')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (574, NULL, N'Puppet')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (575, NULL, N'Pure Data')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (576, NULL, N'PureBasic')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (577, NULL, N'PureMVC')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (578, NULL, N'PureScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (579, NULL, N'Pyramid')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (580, NULL, N'Python')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (581, NULL, N'Qcodo')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (582, NULL, N'QCubed')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (583, NULL, N'Qlikview')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (584, NULL, N'QMake')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (585, NULL, N'QML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (586, NULL, N'Quixote')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (587, NULL, N'R')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (588, NULL, N'Rabbitmq')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (589, NULL, N'Racket')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (590, NULL, N'Ragel in Ruby Host')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (591, NULL, N'Ramaze')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (592, NULL, N'RAML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (593, NULL, N'Rascal')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (594, NULL, N'Ratpack')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (595, NULL, N'Raw token data')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (596, NULL, N'RDBMS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (597, NULL, N'RDoc')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (598, NULL, N'React Native')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (599, NULL, N'ReactJS')
GO
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (600, NULL, N'REALbasic')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (601, NULL, N'Rebol')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (602, NULL, N'Red')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (603, NULL, N'Redcode')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (604, NULL, N'Redis')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (605, NULL, N'Redux')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (606, NULL, N'Relational Databases')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (607, NULL, N'Ren''Py')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (608, NULL, N'RenderScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (609, NULL, N'Research')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (610, NULL, N'Resolução de problemas')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (611, NULL, N'Responsabilidade')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (612, NULL, N'REST APIs')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (613, NULL, N'RESTful')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (614, NULL, N'RestfulX')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (615, NULL, N'Restlet')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (616, NULL, N'reStructuredText')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (617, NULL, N'Retail')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (618, NULL, N'Revel')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (619, NULL, N'REXX')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (620, NULL, N'RHTML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (621, NULL, N'Ring')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (622, NULL, N'Riot.js')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (623, NULL, N'RMarkdown')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (624, NULL, N'RobotFramework')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (625, NULL, N'Roma')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (626, NULL, N'Rouge')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (627, NULL, N'RPM Spec')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (628, NULL, N'Rspec')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (629, NULL, N'Ruby')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (630, NULL, N'Ruby on Rails')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (631, NULL, N'Rum')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (632, NULL, N'RUNOFF')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (633, NULL, N'Rust')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (634, NULL, N'Sage')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (635, NULL, N'Sails.js')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (636, NULL, N'Sales')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (637, NULL, N'Salesforce')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (638, NULL, N'Salesforce Developer')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (639, NULL, N'SaltStack')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (640, NULL, N'Salvia')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (641, NULL, N'SAP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (642, NULL, N'SAS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (643, NULL, N'Sass')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (644, NULL, N'Scala')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (645, NULL, N'Scalatra')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (646, NULL, N'Scaml')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (647, NULL, N'Scheme')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (648, NULL, N'Scilab')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (649, NULL, N'SCORM')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (650, NULL, N'Scripting Languages')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (651, NULL, N'SCRUM')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (652, NULL, N'SCSS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (653, NULL, N'Seagull')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (654, NULL, N'Security')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (655, NULL, N'Selenium')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (656, NULL, N'Selenium WebDriver')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (657, NULL, N'Self')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (658, NULL, N'Servant')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (659, NULL, N'Servers')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (660, NULL, N'Services')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (661, NULL, N'Sharepoint')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (662, NULL, N'Shell')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (663, NULL, N'Shell Script')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (664, NULL, N'Shell Scripting')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (665, NULL, N'ShellSession')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (666, NULL, N'Shen')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (667, NULL, N'Shopify')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (668, NULL, N'SilverStripe Sapphire')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (669, NULL, N'Sin')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (670, NULL, N'Sinatra')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (671, NULL, N'Slash')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (672, NULL, N'Slim')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (673, NULL, N'Smali')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (674, NULL, N'Smalltalk')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (675, NULL, N'Smarty')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (676, NULL, N'SMT')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (677, NULL, N'Snap')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (678, NULL, N'Sociabilidade')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (679, NULL, N'Socket.io')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (680, NULL, N'Software')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (681, NULL, N'Solar')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (682, NULL, N'SourcePawn')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (683, NULL, N'Spark')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (684, NULL, N'SPARQL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (685, NULL, N'Spline Font Database')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (686, NULL, N'Spring')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (687, NULL, N'SproutCore')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (688, NULL, N'SQF')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (689, NULL, N'SQL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (690, NULL, N'SQL Server')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (691, NULL, N'SQLite')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (692, NULL, N'SQLPL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (693, NULL, N'SQR')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (694, NULL, N'Squatting')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (695, NULL, N'Squirrel')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (696, NULL, N'SRecode Template')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (697, NULL, N'Stan')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (698, NULL, N'Standard ML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (699, NULL, N'Stata')
GO
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (700, NULL, N'STON')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (701, NULL, N'Stripes')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (702, NULL, N'Struts')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (703, NULL, N'Styled-Components')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (704, NULL, N'Stylus')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (705, NULL, N'Sublime Text')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (706, NULL, N'SubRip Text')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (707, NULL, N'SuperCollider')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (708, NULL, N'Support')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (709, NULL, N'SVG')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (710, NULL, N'Svn')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (711, NULL, N'Sweetcala')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (712, NULL, N'Swift')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (713, NULL, N'Swiftlet')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (714, NULL, N'Swiz')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (715, NULL, N'Symfony')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (716, NULL, N'SystemVerilog')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (717, NULL, N'Tapestry')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (718, NULL, N'TCL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (719, NULL, N'TCP/IP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (720, NULL, N'Tcsh')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (721, NULL, N'Tea')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (722, NULL, N'Técnologia da Informação')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (723, NULL, N'TensorFlow')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (724, NULL, N'Terra')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (725, NULL, N'Terraform')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (726, NULL, N'Test')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (727, NULL, N'Testes automatizados')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (728, NULL, N'Testes unitários')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (729, NULL, N'TeX')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (730, NULL, N'Text')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (731, NULL, N'Textile')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (732, NULL, N'Thrift')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (733, NULL, N'TI Program')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (734, NULL, N'Tipfy')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (735, NULL, N'TLA')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (736, NULL, N'Tomcat')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (737, NULL, N'TOML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (738, NULL, N'Tornado')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (739, NULL, N'Trabalho em equipe')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (740, NULL, N'Training')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (741, NULL, N'Turbine')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (742, NULL, N'TurboGears')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (743, NULL, N'Turing')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (744, NULL, N'Turtle')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (745, NULL, N'Twig')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (746, NULL, N'TXL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (747, NULL, N'TypeScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (748, NULL, N'Ubuntu')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (749, NULL, N'UKI')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (750, NULL, N'UML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (751, NULL, N'Unified Parallel C')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (752, NULL, N'Unity')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (753, NULL, N'Unity3D Asset')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (754, NULL, N'Unix')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (755, NULL, N'Uno')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (756, NULL, N'Unreal Engine 4')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (757, NULL, N'UnrealScript')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (758, NULL, N'UrWeb')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (759, NULL, N'Vaadin')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (760, NULL, N'Vagrant')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (761, NULL, N'Vala')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (762, NULL, N'Vanilla')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (763, NULL, N'Vapor')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (764, NULL, N'VBA')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (765, NULL, N'VCL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (766, NULL, N'Verilog')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (767, NULL, N'Vert.x')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (768, NULL, N'VHDL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (769, NULL, N'VimL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (770, NULL, N'Visual Basic')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (771, NULL, N'Volt')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (772, NULL, N'Vork')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (773, NULL, N'Vroom')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (774, NULL, N'Vue.Js')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (775, NULL, N'Wavefront Material')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (776, NULL, N'Wavefront Object')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (777, NULL, N'Waves')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (778, NULL, N'Web')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (779, NULL, N'Web API')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (780, NULL, N'Web Application Frameworks')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (781, NULL, N'Web Ontology Language')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (782, NULL, N'Web Services')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (783, NULL, N'Web Technologies')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (784, NULL, N'Web2py')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (785, NULL, N'WebGL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (786, NULL, N'WebGUI')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (787, NULL, N'WebIDL')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (788, NULL, N'Webjure')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (789, NULL, N'Webpack')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (790, NULL, N'WebRTC')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (791, NULL, N'Websockets')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (792, NULL, N'Wee')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (793, NULL, N'Wicket')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (794, NULL, N'Windows Azure')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (795, NULL, N'Wisp')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (796, NULL, N'WordPress')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (797, NULL, N'World of Warcraft Addon Data')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (798, NULL, N'WPF')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (799, NULL, N'X10')
GO
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (800, NULL, N'Xamarin')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (801, NULL, N'xBase')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (802, NULL, N'XC')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (803, NULL, N'Xcode')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (804, NULL, N'Xitrum')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (805, NULL, N'XML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (806, NULL, N'XMPP')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (807, NULL, N'Xojo')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (808, NULL, N'XPages')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (809, NULL, N'XProc')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (810, NULL, N'XQuery')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (811, NULL, N'XS')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (812, NULL, N'XSLT')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (813, NULL, N'Xtend')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (814, NULL, N'Xyster')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (815, NULL, N'Yacc')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (816, NULL, N'YAML')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (817, NULL, N'YANG')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (818, NULL, N'Yesod')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (819, NULL, N'Yii')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (820, NULL, N'Zend')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (821, NULL, N'Zephir')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (822, NULL, N'Zepto')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (823, NULL, N'Zimpl')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (824, NULL, N'ZK')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (825, NULL, N'Zope')
INSERT [dbo].[Habilidade] ([IdHabilidade], [IdCriadoPor], [NomeHabilidade]) VALUES (826, NULL, N'Zotonic')
SET IDENTITY_INSERT [dbo].[Habilidade] OFF
SET IDENTITY_INSERT [dbo].[HabilidadeCandidato] ON 

INSERT [dbo].[HabilidadeCandidato] ([IdHabilidadeCandidato], [IdHabilidade], [IdCandidato]) VALUES (24, 1, 1049)
INSERT [dbo].[HabilidadeCandidato] ([IdHabilidadeCandidato], [IdHabilidade], [IdCandidato]) VALUES (25, 2, 1049)
INSERT [dbo].[HabilidadeCandidato] ([IdHabilidadeCandidato], [IdHabilidade], [IdCandidato]) VALUES (26, 4, 1049)
SET IDENTITY_INSERT [dbo].[HabilidadeCandidato] OFF
SET IDENTITY_INSERT [dbo].[HabilidadeVaga] ON 

INSERT [dbo].[HabilidadeVaga] ([IdHabilidadeVaga], [IdHabilidade], [IdVaga]) VALUES (24, 2, 8)
INSERT [dbo].[HabilidadeVaga] ([IdHabilidadeVaga], [IdHabilidade], [IdVaga]) VALUES (25, 7, 9)
INSERT [dbo].[HabilidadeVaga] ([IdHabilidadeVaga], [IdHabilidade], [IdVaga]) VALUES (26, 3, 10)
INSERT [dbo].[HabilidadeVaga] ([IdHabilidadeVaga], [IdHabilidade], [IdVaga]) VALUES (27, 1, 10)
INSERT [dbo].[HabilidadeVaga] ([IdHabilidadeVaga], [IdHabilidade], [IdVaga]) VALUES (28, 2, 10)
INSERT [dbo].[HabilidadeVaga] ([IdHabilidadeVaga], [IdHabilidade], [IdVaga]) VALUES (29, 3, 8)
INSERT [dbo].[HabilidadeVaga] ([IdHabilidadeVaga], [IdHabilidade], [IdVaga]) VALUES (30, 3, 9)
INSERT [dbo].[HabilidadeVaga] ([IdHabilidadeVaga], [IdHabilidade], [IdVaga]) VALUES (31, 3, 10)
INSERT [dbo].[HabilidadeVaga] ([IdHabilidadeVaga], [IdHabilidade], [IdVaga]) VALUES (32, 3, 8)
SET IDENTITY_INSERT [dbo].[HabilidadeVaga] OFF
SET IDENTITY_INSERT [dbo].[Notificacao] ON 

INSERT [dbo].[Notificacao] ([IdNotificacao], [DataNotificacao], [Mensagem]) VALUES (4, CAST(N'2020-09-02T13:33:45.000' AS DateTime), N'Marina se cadastrou.')
INSERT [dbo].[Notificacao] ([IdNotificacao], [DataNotificacao], [Mensagem]) VALUES (5, CAST(N'2020-09-01T13:35:00.000' AS DateTime), N'Instagram Ltda. criou uma vaga.')
SET IDENTITY_INSERT [dbo].[Notificacao] OFF
SET IDENTITY_INSERT [dbo].[StatusUsuario] ON 

INSERT [dbo].[StatusUsuario] ([IdStatusUsuario], [NomeStatus]) VALUES (1, N'Pendente')
INSERT [dbo].[StatusUsuario] ([IdStatusUsuario], [NomeStatus]) VALUES (2, N'Ativo')
INSERT [dbo].[StatusUsuario] ([IdStatusUsuario], [NomeStatus]) VALUES (3, N'Bloqueado')
INSERT [dbo].[StatusUsuario] ([IdStatusUsuario], [NomeStatus]) VALUES (4, N'Recusado')
SET IDENTITY_INSERT [dbo].[StatusUsuario] OFF
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Nome]) VALUES (1, N'Administrador')
INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Nome]) VALUES (2, N'Empresa')
INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [Nome]) VALUES (3, N'Candidato')
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Email], [Senha], [DataCadastrado]) VALUES (1049, 3, N'matheusatualizadoo@gmail.com', N'hQ0jWfj5IuwPv4312+/7zbON3Yf3sKIClvbj1mXAHtByGIQp', CAST(N'2020-09-20T15:14:58.767' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [IdTipoUsuario], [Email], [Senha], [DataCadastrado]) VALUES (1050, 2, N'ti@luanaconsultoriafinanceiraltda.com.br', N'77+sON9CJyefkrn2WHnIP8oz9syW1B2pgJiRqKlI82Krwc+M', CAST(N'2020-09-22T16:00:19.713' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[Vaga] ON 

INSERT [dbo].[Vaga] ([IdVaga], [IdEmpresa], [IdEndereco], [Titulo], [Salario], [Local], [Cep], [Qualificacao], [DataCriado], [DataExpiracao], [CargaHoraria], [Descricao], [Visualizacao]) VALUES (8, 1050, NULL, N'Teste atualizado', CAST(1000 AS Decimal(18, 0)), N'Rua Teste', N'01001000', N'Teste', CAST(N'2020-09-04T11:11:11.000' AS DateTime), CAST(N'2020-11-04T11:11:11.000' AS DateTime), 6, N'Descrição teste', 124)
INSERT [dbo].[Vaga] ([IdVaga], [IdEmpresa], [IdEndereco], [Titulo], [Salario], [Local], [Cep], [Qualificacao], [DataCriado], [DataExpiracao], [CargaHoraria], [Descricao], [Visualizacao]) VALUES (9, 1050, NULL, N'Estagiário C#', CAST(1000 AS Decimal(18, 0)), N'Rua Teste', N'01310918', N'Teste', CAST(N'2020-09-04T11:11:11.000' AS DateTime), CAST(N'2020-11-04T11:11:11.000' AS DateTime), 6, N'Descrição teste', 0)
INSERT [dbo].[Vaga] ([IdVaga], [IdEmpresa], [IdEndereco], [Titulo], [Salario], [Local], [Cep], [Qualificacao], [DataCriado], [DataExpiracao], [CargaHoraria], [Descricao], [Visualizacao]) VALUES (10, 1050, NULL, N'Desenvolvedor Flutter', CAST(1000 AS Decimal(18, 0)), N'Santos', N'03634080', N'Teste', CAST(N'2020-09-04T11:11:11.000' AS DateTime), CAST(N'2020-11-04T11:11:11.000' AS DateTime), 6, N'Descrição teste', 0)
SET IDENTITY_INSERT [dbo].[Vaga] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Beneficio]    Script Date: 23/10/2020 16:20:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Beneficio] ON [dbo].[Beneficio]
(
	[NomeBeneficio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CPF]    Script Date: 23/10/2020 16:20:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_CPF] ON [dbo].[Candidato]
(
	[Cpf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Matricula]    Script Date: 23/10/2020 16:20:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Matricula] ON [dbo].[Candidato]
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Rg]    Script Date: 23/10/2020 16:20:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Rg] ON [dbo].[Candidato]
(
	[Rg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Cnpj]    Script Date: 23/10/2020 16:20:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Cnpj] ON [dbo].[Empresa]
(
	[Cnpj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_RazaoSocial]    Script Date: 23/10/2020 16:20:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_RazaoSocial] ON [dbo].[Empresa]
(
	[RazaoSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Habilida__206452FF4DEB5434]    Script Date: 23/10/2020 16:20:55 ******/
ALTER TABLE [dbo].[Habilidade] ADD  CONSTRAINT [UQ__Habilida__206452FF4DEB5434] UNIQUE NONCLUSTERED 
(
	[NomeHabilidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Email]    Script Date: 23/10/2020 16:20:55 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Email] ON [dbo].[Usuario]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Usuario]
GO
ALTER TABLE [dbo].[Beneficio]  WITH CHECK ADD  CONSTRAINT [FK_Beneficio_Usuario] FOREIGN KEY([IdCriadoPor])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Beneficio] CHECK CONSTRAINT [FK_Beneficio_Usuario]
GO
ALTER TABLE [dbo].[BeneficioVaga]  WITH CHECK ADD  CONSTRAINT [FK_BeneficioVaga_Beneficio] FOREIGN KEY([IdBeneficio])
REFERENCES [dbo].[Beneficio] ([IdBeneficio])
GO
ALTER TABLE [dbo].[BeneficioVaga] CHECK CONSTRAINT [FK_BeneficioVaga_Beneficio]
GO
ALTER TABLE [dbo].[BeneficioVaga]  WITH CHECK ADD  CONSTRAINT [FK_BeneficioVaga_Vaga] FOREIGN KEY([IdVaga])
REFERENCES [dbo].[Vaga] ([IdVaga])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BeneficioVaga] CHECK CONSTRAINT [FK_BeneficioVaga_Vaga]
GO
ALTER TABLE [dbo].[Candidato]  WITH CHECK ADD  CONSTRAINT [FK_Candidato_Endereco] FOREIGN KEY([IdEndereco])
REFERENCES [dbo].[Endereco] ([IdEndereco])
GO
ALTER TABLE [dbo].[Candidato] CHECK CONSTRAINT [FK_Candidato_Endereco]
GO
ALTER TABLE [dbo].[Candidato]  WITH CHECK ADD  CONSTRAINT [FK_Candidato_StatusUsuario] FOREIGN KEY([IdStatusUsuario])
REFERENCES [dbo].[StatusUsuario] ([IdStatusUsuario])
GO
ALTER TABLE [dbo].[Candidato] CHECK CONSTRAINT [FK_Candidato_StatusUsuario]
GO
ALTER TABLE [dbo].[Candidato]  WITH CHECK ADD  CONSTRAINT [FK_Candidato_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Candidato] CHECK CONSTRAINT [FK_Candidato_Usuario]
GO
ALTER TABLE [dbo].[Candidatura]  WITH CHECK ADD  CONSTRAINT [FK_Candidatura_Candidato] FOREIGN KEY([IdCandidato])
REFERENCES [dbo].[Candidato] ([IdUsuario])
GO
ALTER TABLE [dbo].[Candidatura] CHECK CONSTRAINT [FK_Candidatura_Candidato]
GO
ALTER TABLE [dbo].[Candidatura]  WITH CHECK ADD  CONSTRAINT [FK_Candidatura_Vaga] FOREIGN KEY([IdVaga])
REFERENCES [dbo].[Vaga] ([IdVaga])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Candidatura] CHECK CONSTRAINT [FK_Candidatura_Vaga]
GO
ALTER TABLE [dbo].[Empresa]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_StatusUsuario] FOREIGN KEY([IdStatusUsuario])
REFERENCES [dbo].[StatusUsuario] ([IdStatusUsuario])
GO
ALTER TABLE [dbo].[Empresa] CHECK CONSTRAINT [FK_Empresa_StatusUsuario]
GO
ALTER TABLE [dbo].[Empresa]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Empresa] CHECK CONSTRAINT [FK_Empresa_Usuario]
GO
ALTER TABLE [dbo].[Habilidade]  WITH CHECK ADD  CONSTRAINT [FK_Habilidade_Usuario] FOREIGN KEY([IdCriadoPor])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Habilidade] CHECK CONSTRAINT [FK_Habilidade_Usuario]
GO
ALTER TABLE [dbo].[HabilidadeCandidato]  WITH CHECK ADD  CONSTRAINT [FK_HabilidadeCandidato_Candidato] FOREIGN KEY([IdCandidato])
REFERENCES [dbo].[Candidato] ([IdUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HabilidadeCandidato] CHECK CONSTRAINT [FK_HabilidadeCandidato_Candidato]
GO
ALTER TABLE [dbo].[HabilidadeCandidato]  WITH CHECK ADD  CONSTRAINT [FK_HabilidadeCandidato_Habilidade] FOREIGN KEY([IdHabilidade])
REFERENCES [dbo].[Habilidade] ([IdHabilidade])
GO
ALTER TABLE [dbo].[HabilidadeCandidato] CHECK CONSTRAINT [FK_HabilidadeCandidato_Habilidade]
GO
ALTER TABLE [dbo].[HabilidadeVaga]  WITH CHECK ADD  CONSTRAINT [FK_HabilidadeVaga_Habilidade] FOREIGN KEY([IdHabilidade])
REFERENCES [dbo].[Habilidade] ([IdHabilidade])
GO
ALTER TABLE [dbo].[HabilidadeVaga] CHECK CONSTRAINT [FK_HabilidadeVaga_Habilidade]
GO
ALTER TABLE [dbo].[HabilidadeVaga]  WITH CHECK ADD  CONSTRAINT [FK_HabilidadeVaga_Vaga] FOREIGN KEY([IdVaga])
REFERENCES [dbo].[Vaga] ([IdVaga])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HabilidadeVaga] CHECK CONSTRAINT [FK_HabilidadeVaga_Vaga]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([IdTipoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
ALTER TABLE [dbo].[Vaga]  WITH CHECK ADD  CONSTRAINT [FK_Vaga_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdUsuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vaga] CHECK CONSTRAINT [FK_Vaga_Empresa]
GO
ALTER TABLE [dbo].[Vaga]  WITH CHECK ADD  CONSTRAINT [FK_Vaga_Endereco] FOREIGN KEY([IdEndereco])
REFERENCES [dbo].[Endereco] ([IdEndereco])
GO
ALTER TABLE [dbo].[Vaga] CHECK CONSTRAINT [FK_Vaga_Endereco]
GO
USE [master]
GO
ALTER DATABASE [ConexaoVagas] SET  READ_WRITE 
GO