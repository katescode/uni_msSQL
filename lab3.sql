--Соединение таблиц Employees и Departments по внешнему классу DepId
SELECT E.Lastname, E.Firstname, E.Middlename, E.Position, D.Name, E.BeginDate
FROM dbo.Employees AS E
JOIN dbo.Departments AS D
ON E.DepId = D.DepId;

--Фильтр, выводящий данные сотрудников отдельных отделов
SELECT E.Lastname, E.Firstname, E.Middlename, E.Position, D.Name, E.BeginDate
FROM dbo.Employees AS E
JOIN dbo.Departments AS D
ON E.DepId = D.DepId
AND D.Name = N'Отдел искусства фотографии';

-- Запрос «Авторы» на основе таблиц Authors и Artworks со связью по полю AuthorId
--Отображаемые поля - Фамилия, Имя и дата рождения автора, жанр, название и дату создания произведения.
SELECT AU.Lastname, AU.Firstname, AU.DateOfBirth, ART.Genre, ART.Title, ART.CreatDate
FROM dbo.Authors AS AU
JOIN dbo.Artworks AS ART
ON AU.AuthorId = ART.AuthorId;


-- Фильтр «Отбор автора» для отображения определенных авторов на основе запроса «Авторы».

SELECT AU.Lastname, AU.Firstname, AU.DateOfBirth, ART.Genre, ART.Title, ART.CreatDate
FROM dbo.Authors AS AU
JOIN dbo.Artworks AS ART
ON AU.AuthorId = ART.AuthorId AND AU.Lastname = 'Sívori';

--Запрос «Отбор заказов по сумме» на основе таблицы Orders
SELECT *
FROM dbo.Orders
WHERE qty BETWEEN 20000 AND 200000;