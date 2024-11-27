-- 1. Crear la base de datos
CREATE DATABASE Series;
GO

-- Usar la base de datos
USE Series;
GO

-- 2. Crear la tabla 'Genre' (Género)
CREATE TABLE Genre (
    GenreID INT IDENTITY(1,1) PRIMARY KEY,   -- ID autoincrementable como clave primaria
    GenreName NVARCHAR(80) NOT NULL           -- Nombre del género con longitud máxima de 80 caracteres
);
GO

-- 3. Crear la tabla 'Series' (Serie)
CREATE TABLE Series (
    SeriesID INT IDENTITY(1,1) PRIMARY KEY,  -- ID autoincrementable como clave primaria
    SeriesName NVARCHAR(100) NOT NULL,       -- Nombre de la serie con longitud máxima de 100 caracteres
    ReleaseDate DATE,                        -- Fecha de lanzamiento de la serie
    Description NVARCHAR(400),               -- Descripción de la serie con longitud máxima de 400 caracteres
    GenreID INT,                             -- Clave foránea para relacionar con la tabla 'Genre'
    CONSTRAINT FK_Genre FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)   -- Relación de uno a muchos
);
GO

-- 4. Insertar algunos géneros (para poblar la tabla 'Genre')
INSERT INTO Genre (GenreName) VALUES
('Acción'),
('Comedia'),
('Drama'),
('Ciencia Ficción'),
('Terror');
GO

-- 5. Insertar algunas series (para poblar la tabla 'Series')
INSERT INTO Series (SeriesName, ReleaseDate, Description, GenreID) VALUES
('Stranger Things', '2016-07-15', 'Un grupo de niños se enfrenta a eventos extraños en su ciudad, incluida la desaparición de un amigo y la aparición de una niña con poderes paranormales.', 4),  -- Ciencia Ficción
('The Office', '2005-03-24', 'Comedia de situación que sigue la vida diaria de los empleados de la oficina de Dunder Mifflin.', 2),  -- Comedia
('Breaking Bad', '2008-01-20', 'Un profesor de química convertido en fabricante de metanfetaminas lucha por mantener su familia segura mientras se adentra en el crimen.', 3),  -- Drama
('The Walking Dead', '2010-10-31', 'Un grupo de sobrevivientes lucha por sobrevivir en un mundo post-apocalíptico plagado de zombis.', 5),  -- Terror
('Game of Thrones', '2011-04-17', 'En un reino medieval, varias familias luchan por el control del Trono de Hierro mientras se enfrentan a amenazas internas y externas.', 3),  -- Drama
('The Mandalorian', '2019-11-12', 'Un cazarrecompensas solitario navega por la galaxia mientras protege a un extraño niño con poderes misteriosos.', 4),  -- Ciencia Ficción
('Friends', '1994-09-22', 'Comedia sobre un grupo de amigos que viven en Nueva York mientras navegan por las complicaciones de la vida adulta.', 2),  -- Comedia
('The Crown', '2016-11-04', 'Drama histórico sobre la vida de la Reina Isabel II y los eventos clave en su reinado.', 3),  -- Drama
('The Boys', '2019-07-26', 'Un grupo de vigilantes lucha contra superhéroes corruptos que abusan de sus poderes.', 1),  -- Acción
('Narcos', '2015-08-28', 'La historia de la lucha contra el narcotráfico en Colombia, enfocándose en el cartel de Medellín y su líder, Pablo Escobar.', 3),  -- Drama
('Westworld', '2016-10-02', 'Un parque temático futurista donde los visitantes interactúan con robots, pero la inteligencia artificial comienza a evolucionar.', 4),  -- Ciencia Ficción
('Brooklyn Nine-Nine', '2013-09-17', 'Una comedia sobre un grupo de detectives y oficiales de policía en una comisaría de Nueva York.', 2),  -- Comedia
('Mindhunter', '2017-10-13', 'Dos agentes del FBI estudian y entrevistan a asesinos en serie para desarrollar perfiles criminales.', 3),  -- Drama
('Dark', '2017-12-01', 'Serie de ciencia ficción que explora los viajes en el tiempo y sus efectos en un pequeño pueblo alemán.', 4),  -- Ciencia Ficción
('Better Call Saul', '2015-02-08', 'Precuela de "Breaking Bad" que narra el ascenso del abogado Jimmy McGill, quien eventualmente se convierte en Saul Goodman.', 3),  -- Drama
('Attack on Titan', '2013-04-06', 'En un mundo donde la humanidad está al borde de la extinción por gigantes devoradores de hombres, un grupo de soldados lucha por sobrevivir.', 1),  -- Acción
('The Office (US)', '2005-03-24', 'Un falso documental sobre un grupo de empleados de oficina, sus vidas personales y su jefe excéntrico.', 2),  -- Comedia
('Vikings', '2013-03-03', 'La serie narra la vida de Ragnar Lothbrok, un legendario héroe nórdico que se convierte en rey y líder vikingo.', 3),  -- Drama
('Sherlock', '2010-07-25', 'Una adaptación moderna de las aventuras del detective Sherlock Holmes en Londres.', 3),  -- Drama
('Black Mirror', '2011-12-04', 'Una serie antológica que explora el impacto de la tecnología en la sociedad, con episodios independientes en cada temporada.', 4),  -- Ciencia Ficción
('Rick and Morty', '2013-12-02', 'Una comedia animada que sigue las alocadas aventuras de un científico y su nieto en viajes interdimensionales.', 4),  -- Ciencia Ficción
('Stranger Things 2', '2017-10-27', 'La segunda temporada de Stranger Things, donde los niños enfrentan nuevas criaturas y misterios.', 4),  -- Ciencia Ficción
('The Witcher', '2019-12-20', 'La historia de Geralt de Rivia, un cazador de monstruos en un mundo medieval lleno de magia, seres fantásticos y conflictos.', 1),  -- Acción
('Naruto', '2002-10-03', 'Un joven ninja con un demonio sellado en su interior sueña con convertirse en el líder de su aldea.', 1),  -- Acción
('The Haunting of Hill House', '2018-10-12', 'Un grupo de hermanos se enfrenta a los oscuros recuerdos de su infancia en una casa encantada.', 5),  -- Terror
('The Umbrella Academy', '2019-02-15', 'Un grupo de hermanos adoptivos con poderes extraordinarios se reúne para resolver el misterio de la muerte de su padre.', 4),  -- Ciencia Ficción
('Scream', '2015-06-30', 'Una serie basada en la popular saga de películas de terror, donde un grupo de adolescentes es acosado por un asesino enmascarado.', 5),  -- Terror
('The Expanse', '2015-12-14', 'En un futuro lejano, la humanidad ha colonizado el sistema solar, y una conspiración amenaza la paz entre los planetas.', 4),  -- Ciencia Ficción
('The Punisher', '2017-11-17', 'Frank Castle, un hombre que busca venganza por la muerte de su familia, se convierte en un justiciero conocido como "El Castigador".', 1),  -- Acción
('The Mandalorian 2', '2020-10-30', 'La segunda temporada sigue las aventuras del Mandaloriano mientras sigue protegiendo a Baby Yoda.', 4),  -- Ciencia Ficción
('The Office (UK)', '2001-07-09', 'Comedia británica que presenta la vida cotidiana de los empleados de una oficina en una pequeña ciudad.', 2);  -- Comedia
GO
