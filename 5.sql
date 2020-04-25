--Создадим скалярную пользовательскую функцию, вычисляющую среднее трёх величин
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION FuncMeanValue
(
    @Value1 int,
    @Value2 int,
    @Value3 int
)
RETURNS real
AS
BEGIN
    DECLARE @Result real;
    SELECT @Result = (@Value1+@Value2+@Value3)/3;
    RETURN @Result;

end
GO
--Выполнение команды
SELECT dbo.FuncMeanValue (3, 5, 4);
--====================================================================
--создание таблицы Countries
CREATE TABLE dbo.Countries(
    CountryCode INT CONSTRAINT PK_Countries PRIMARY KEY,
    CountryName NVARCHAR(100) NOT NULL,
);
--связь таблиц Countries и Authors по CountryCode
ALTER TABLE dbo.Countries
ADD CONSTRAINT FK_Country_Auth
FOREIGN KEY (CountryCode)
REFERENCES Countries (CountryCode);

--В таблицу «Countries» записываются:
INSERT INTO dbo.Countries VALUES
(32,N'Аргентина'),
(643,N'Россия'),
(858,N'Уругвай');
--====================================================================
--создание табличной пользовательской функции, выбирающей информацию о художниках по стране их проживания.
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [GetArtists]
(
@Country NVARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT Authors.Lastname, Authors.Firstname, Authors.Middlename,
           Authors.DateOfBirth, Authors.DateOfDeath
    FROM Countries INNER JOIN Authors
        ON Countries.CountryCode = Authors.CountryCode
    WHERE (Countries.CountryName = @Country)
)
GO
--Выполнение команды
SELECT * FROM GetArtists (N'Россия');

--===============================================================================
--Создать табличную пользовательскую функцию, выбирающей информацию о художниках по названию произведения.
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [GetArtistByArtwork]
(
    @NameOfArtwork nvarchar(100)
)
RETURNS TABLE
AS
RETURN
    (
        SELECT Authors.Lastname, Authors.Firstname, Authors.Middlename,
        Authors.DateOfBirth, Authors.DateOfDeath
        FROM Artworks INNER JOIN Authors
        ON Artworks.AuthorId = Authors.AuthorId
        WHERE (Artworks.Title = @NameOfArtwork)

    )
--Выполнение команды
SELECT * FROM GetArtistByArtwork (N'Штрих-код');

--===============================================================================
--Создать табличную пользовательскую функцию,
-- выбирающей информацию о заказе по сумме из диапазона
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [GetOrderByQty]
(
    @min int,
    @max int
)
RETURNS TABLE
AS
RETURN
    (
        SELECT * FROM Orders
        WHERE qty > @min AND qty < @max
    )

--Выполнение команды
SELECT * FROM GetOrderByQty(20000, 200000);