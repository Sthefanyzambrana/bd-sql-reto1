USE [ASIR_Cuarentena_Dev]
GO
/****** Object:  Schema [Hospital]    Script Date: 13/05/2020 12:24:47 ******/
CREATE SCHEMA [Hospital]
GO
/****** Object:  UserDefinedFunction [Hospital].[funNumeroPacientesSegunSexo]    Script Date: 13/05/2020 12:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sthefany
-- Create date: 12-05-2020
-- Description:	Contar el número de pacientes Mujeres y Hombres FUNCION. Dependiendo de M y H.
-- =============================================
CREATE FUNCTION [Hospital].[funNumeroPacientesSegunSexo]
(
	@sexo nchar(1)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @NumHistorial int

	-- Add the T-SQL statements to compute the return value here
	SELECT @NumHistorial = COUNT(Numero_de_Historial)
	FROM Hospital.Pacientes
	WHERE Sexo = @sexo

	-- Return the result of the function
	RETURN @NumHistorial

END
GO
/****** Object:  UserDefinedFunction [Hospital].[funPacientesContar]    Script Date: 13/05/2020 12:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sthefany
-- Create date: 12-05-2020
-- Description:	Cuenta el número de pacientes que hay en el sistema FUNCION.
-- =============================================
CREATE FUNCTION [Hospital].[funPacientesContar]() 

RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @NumHistorial int 

	-- Add the T-SQL statements to compute the return value here
	SELECT @NumHistorial=COUNT(Numero_de_Historial)
	FROM Hospital.Pacientes

	-- Return the result of the function
	RETURN @NumHistorial

END
GO
/****** Object:  Table [Hospital].[Ingresos]    Script Date: 13/05/2020 12:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Ingresos](
	[Numero_de_Ingreso] [int] NOT NULL,
	[Numero_de_Historial] [nchar](9) NULL,
	[Fecha_de_Ingreso] [date] NULL,
	[Codigo_de_Identificacion] [nchar](4) NULL,
	[Numero_de_Planta] [int] NOT NULL,
	[Numero_de_Cama] [nchar](10) NULL,
	[Alergico] [bit] NULL,
	[Observaciones] [char](100) NULL,
	[Coste_del_Tratamiento] [money] NULL,
	[Diagnostico] [nvarchar](40) NULL,
 CONSTRAINT [PK_Ingresos] PRIMARY KEY CLUSTERED 
(
	[Numero_de_Ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Medicos]    Script Date: 13/05/2020 12:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Medicos](
	[Codigo_Identificacion] [nchar](4) NOT NULL,
	[Nombre_del_Medico] [nchar](15) NULL,
	[Apellidos_del_Medico] [nvarchar](30) NULL,
	[Especialidad] [nvarchar](25) NULL,
	[Fecha_de_Ingreso] [date] NULL,
	[Cargo] [nvarchar](25) NULL,
	[Numero_de_Colegiado] [int] NULL,
	[Observaciones] [char](100) NULL,
 CONSTRAINT [PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[Codigo_Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Hospital].[Pacientes]    Script Date: 13/05/2020 12:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hospital].[Pacientes](
	[N_Seguridad_Social] [nchar](15) NULL,
	[Nombre] [nchar](15) NULL,
	[Apellidos] [nvarchar](30) NULL,
	[Domicilio] [nvarchar](30) NULL,
	[Poblacion] [nvarchar](25) NULL,
	[Provincia] [nchar](15) NULL,
	[Codigo_Postal] [nchar](5) NULL,
	[Telefono] [nchar](12) NULL,
	[Numero_de_Historial] [nchar](9) NOT NULL,
	[Sexo] [nchar](1) NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[Numero_de_Historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Hospital].[Ingresos] ([Numero_de_Ingreso], [Numero_de_Historial], [Fecha_de_Ingreso], [Codigo_de_Identificacion], [Numero_de_Planta], [Numero_de_Cama], [Alergico], [Observaciones], [Coste_del_Tratamiento], [Diagnostico]) VALUES (1, N'10203-F  ', CAST(N'2009-01-23' AS Date), N'AJH ', 5, N'121       ', 0, N'Epileptico    ', 40.0000, N'ataque con frecuencia')
INSERT [Hospital].[Ingresos] ([Numero_de_Ingreso], [Numero_de_Historial], [Fecha_de_Ingreso], [Codigo_de_Identificacion], [Numero_de_Planta], [Numero_de_Cama], [Alergico], [Observaciones], [Coste_del_Tratamiento], [Diagnostico]) VALUES (2, N'15413-S  ', CAST(N'2009-03-13' AS Date), N'RLQ ', 2, N'5         ', 1, N'Alergico a la penicilina  ', 10.0000, N'Hinchazon debido a la penincilina')
INSERT [Hospital].[Ingresos] ([Numero_de_Ingreso], [Numero_de_Historial], [Fecha_de_Ingreso], [Codigo_de_Identificacion], [Numero_de_Planta], [Numero_de_Cama], [Alergico], [Observaciones], [Coste_del_Tratamiento], [Diagnostico]) VALUES (3, N'11454-L  ', CAST(N'2009-05-25' AS Date), N'RLQ ', 3, N'31        ', 0, N'    ', 25.0000, N'Accidente de transito')
INSERT [Hospital].[Ingresos] ([Numero_de_Ingreso], [Numero_de_Historial], [Fecha_de_Ingreso], [Codigo_de_Identificacion], [Numero_de_Planta], [Numero_de_Cama], [Alergico], [Observaciones], [Coste_del_Tratamiento], [Diagnostico]) VALUES (4, N'15413-S  ', CAST(N'2010-01-29' AS Date), N'CEM ', 2, N'13        ', 0, N'    ', 10.0000, N'Dolores en el corazon')
INSERT [Hospital].[Ingresos] ([Numero_de_Ingreso], [Numero_de_Historial], [Fecha_de_Ingreso], [Codigo_de_Identificacion], [Numero_de_Planta], [Numero_de_Cama], [Alergico], [Observaciones], [Coste_del_Tratamiento], [Diagnostico]) VALUES (5, N'14546-E  ', CAST(N'2010-02-24' AS Date), N'AJH ', 1, N'5         ', 1, N'Alergico al Paidoterin  ', 40.0000, N'Hinchazon')
INSERT [Hospital].[Medicos] ([Codigo_Identificacion], [Nombre_del_Medico], [Apellidos_del_Medico], [Especialidad], [Fecha_de_Ingreso], [Cargo], [Numero_de_Colegiado], [Observaciones]) VALUES (N'AJH ', N'Antonio        ', N'Jaen Hernandez', N'Pediatria', CAST(N'1982-08-12' AS Date), N'Adjunto', 2113, N'Titular                                                                       ')
INSERT [Hospital].[Medicos] ([Codigo_Identificacion], [Nombre_del_Medico], [Apellidos_del_Medico], [Especialidad], [Fecha_de_Ingreso], [Cargo], [Numero_de_Colegiado], [Observaciones]) VALUES (N'CEM ', N'Carmen         ', N'Esteril Manrique', N'Psiquiatria', CAST(N'1992-02-13' AS Date), N'Titular', 1231, N'                                                                                                    ')
INSERT [Hospital].[Medicos] ([Codigo_Identificacion], [Nombre_del_Medico], [Apellidos_del_Medico], [Especialidad], [Fecha_de_Ingreso], [Cargo], [Numero_de_Colegiado], [Observaciones]) VALUES (N'RLQ ', N'Rocio          ', N'Lopez Quijada', N'Medico de familia', CAST(N'1994-09-23' AS Date), N'Proximo a jubilacion', 1331, N'                                                                                                    ')
INSERT [Hospital].[Pacientes] ([N_Seguridad_Social], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [Codigo_Postal], [Telefono], [Numero_de_Historial], [Sexo]) VALUES (N'08/7888888     ', N'Jose Eduardo   ', N'Romerales Pinto', N'C/Azorin, 34 3o', N'Mostoles', N'Madrid         ', N'28935', N'91-345-87-45', N'10203-F  ', N'H')
INSERT [Hospital].[Pacientes] ([N_Seguridad_Social], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [Codigo_Postal], [Telefono], [Numero_de_Historial], [Sexo]) VALUES (N'08/7234823     ', N'Angel          ', N'Ruiz Picasso', N'C/Salmeron, 212', N'Madrid', N'Madrid         ', N'28028', N'91-565-34-33', N'11454-L  ', N'H')
INSERT [Hospital].[Pacientes] ([N_Seguridad_Social], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [Codigo_Postal], [Telefono], [Numero_de_Historial], [Sexo]) VALUES (N'08/7333333     ', N'Mercedes       ', N'Romero Carvajal', N'C/Malaga, 13', N'Mostoles', N'Madrid         ', N'28935', N'91-455-67-45', N'14546-E  ', N'M')
INSERT [Hospital].[Pacientes] ([N_Seguridad_Social], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [Codigo_Postal], [Telefono], [Numero_de_Historial], [Sexo]) VALUES (N'08/7555555     ', N'Martin         ', N'Fernandez Lopez', N'C/Sastres, 21', N'Madrid', N'Madrid         ', N'28028', N'91-333-33-33', N'15413-S  ', N'H')
ALTER TABLE [Hospital].[Ingresos]  WITH CHECK ADD  CONSTRAINT [CK_Ingresos] CHECK  (([Numero_de_Planta]>=(0) AND [Numero_de_Planta]<=(10)))
GO
ALTER TABLE [Hospital].[Ingresos] CHECK CONSTRAINT [CK_Ingresos]
GO
ALTER TABLE [Hospital].[Ingresos]  WITH CHECK ADD  CONSTRAINT [CK_Ingresos_1] CHECK  (([Numero_de_Cama]>=(0) AND [Numero_de_Cama]<=(200)))
GO
ALTER TABLE [Hospital].[Ingresos] CHECK CONSTRAINT [CK_Ingresos_1]
GO
ALTER TABLE [Hospital].[Pacientes]  WITH CHECK ADD  CONSTRAINT [CK_Pacientes] CHECK  (([Sexo]='H' OR [Sexo]='M' OR [Sexo]='O'))
GO
ALTER TABLE [Hospital].[Pacientes] CHECK CONSTRAINT [CK_Pacientes]
GO
/****** Object:  StoredProcedure [Hospital].[pr_IntroducirMedico]    Script Date: 13/05/2020 12:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Hospital].[pr_IntroducirMedico]

@p_CodigoIdentificacion nchar(4),
@p_NombreDelMedico nchar(15),
@p_ApellidoDelMedico nvarchar(30),
@p_Especialidad nvarchar(25),
@p_FechaDeIngreso date,
@p_Cargo nvarchar(25),
@p_NumeroDeColegiado int,
@p_Observaciones char(100)

AS

BEGIN

	IF @p_CodigoIdentificacion BETWEEN 0 AND 999

		RETURN -1

	BEGIN TRY
		INSERT INTO Hospital.Medicos
		(Codigo_Identificacion,
		Nombre_del_Medico,
		Apellidos_del_Medico,
		Especialidad,
		Fecha_de_Ingreso,
		Cargo,
		Numero_de_Colegiado,
		Observaciones)

		VALUES 
		(@p_CodigoIdentificacion,
		@p_NombreDelMedico,
		@p_ApellidoDelMedico,
		@p_Especialidad,
		@p_FechaDeIngreso,
		@p_Cargo,
		@p_NumeroDeColegiado,
		@p_Observaciones)

		RETURN 0

	END TRY
	
	BEGIN CATCH
		RETURN @@ERROR
	END CATCH

END
GO
/****** Object:  StoredProcedure [Hospital].[usp_MostrarPacientesIngresados]    Script Date: 13/05/2020 12:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Hospital].[usp_MostrarPacientesIngresados]

@p_FechaInicio date,
@p_FechaFinal date

AS

BEGIN

	SELECT P.Nombre, P.Apellidos, I.Numero_de_Historial, I.Fecha_de_Ingreso, I.Numero_de_Cama, I.Alergico, I.Observaciones, I.Coste_del_Tratamiento, I.Diagnostico
	FROM Hospital.Ingresos AS I
	JOIN Hospital.Pacientes AS P
	ON I.Numero_de_Historial = P.Numero_de_Historial
	WHERE I.Fecha_de_Ingreso BETWEEN @p_FechaInicio AND @p_FechaFinal

END
GO
