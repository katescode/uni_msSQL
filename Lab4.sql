--Создадим процедуру, вычисляющую среднее трёх чисел
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE MeanValue
    @Value1 REAL = 0,
    @Value2 REAL = 0,
    @Value3 REAL = 0
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 'MeanValue' = (@Value1+@Value2+@Value3)/3
end
GO
--Выполнение процедуры
EXEC MeanValue 1, 7, 9

--=======================================================
--создадим хранимую процедуру для отбора художников из таблицы «Authors» по их фамилиям
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Artist by Name]
    @Name nvarchar(50) = ' '
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Authors WHERE Lastname = @Name
END
GO
--Выполнение процедуры
EXEC [Artist by Name] Sívori;

--=======================================================
--отображение имен художников, родившихся в XV веке.
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE Born15
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Lastname,Firstname FROM Authors WHERE YEAR(DateOfBirth)>=1400 AND
                                                  YEAR(DateOfDeath)<=1500;
END
GO
--Выполнение процедуры
EXEC Born15;

--=======================================================
--Создать хранимую процедуру на основе фильтра «Отбор автора»
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Artists and Their Artwork]
    @Name nvarchar(50) = ' '
AS
BEGIN
    SET NOCOUNT ON;
    SELECT AU.Lastname, AU.Firstname, AU.DateOfBirth, ART.Genre, ART.Title, ART.CreatDate
    FROM dbo.Authors AS AU
    JOIN dbo.Artworks AS ART
    ON AU.AuthorId = ART.AuthorId AND AU.Lastname = @Name;
END
GO
--Выполнение процедуры
EXEC [Artists and Their Artwork] Sívori;
