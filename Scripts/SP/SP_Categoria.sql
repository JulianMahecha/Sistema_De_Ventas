--Procedimiento Mostrar Categoria
CREATE PROC spmostrar_categoria
AS
SELECT TOP 200 * FROM categoria ORDER BY	idCategoria DESC
GO

--Procedimiento Buscar Nombre
CREATE PROC	spbuscar_categoria
@txt_buscar varchar(50)
AS
SELECT * FROM categoria
WHERE Nombre LIKE @txt_buscar + '%'
GO

--Procedimiento Inertar
CREATE PROC spinsertar_categoria
@idCategoria int output,
@Nombre varchar(50),
@Descripcion varchar(256)
AS
INSERT INTO categoria(Nombre, Descripcion) VALUES (@Nombre, @Descripcion)
GO

--Preocedimiento Editar
CREATE PROC speditar_categoria
@idCategoria int,
@Nombre varchar(50),
@Descripcion varchar(256)
AS
UPDATE categoria SET Nombre=@Nombre, Descripcion=Descripcion
WHERE idCategoria = @idCategoria
GO

--Procedimiento Eliminar
CREATE PROC speliminar_categoria
@idCategoria int
AS
DELETE FROM categoria WHERE idCategoria = @idCategoria
GO

