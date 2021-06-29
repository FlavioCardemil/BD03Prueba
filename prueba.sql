\c postgres
DROP DATABASE biblioteca;
CREATE DATABASE biblioteca;
\c biblioteca

CREATE TABLE socios(
    rut VARCHAR(15),
    socio VARCHAR(30),
    apellido VARCHAR(30),
    direccion VARCHAR(50),
    telefono INT,
    PRIMARY KEY(rut)
);

CREATE TABLE libros(
    isbn VARCHAR(15),
    titulo VARCHAR(50),
    pagina INT,
    codigoautor INT,
    nombreautor VARCHAR(15),
    apellidoautor VARCHAR(15),
    nacimiento INT,
    muerte INT,
    tipodeautor VARCHAR(15),
    diasprestamo INT,
    PRIMARY KEY(titulo)
);

CREATE TABLE historial(
    rut VARCHAR(15),
    socio VARCHAR(50),
    libro VARCHAR(50),
    fechaprestamo DATE,
    fechadevolucion DATE,
    FOREIGN KEY (rut) REFERENCES socios(rut),
    FOREIGN KEY (libro) REFERENCES libros(titulo)
);


\copy socios FROM 'socios.csv' csv header;
\copy libros FROM 'libros.csv' csv header;
\copy historial FROM 'historial-de-prestamos.csv' csv header;


SELECT titulo FROM libros WHERE pagina < 300;
SELECT nombreautor, apellidoautor FROM libros WHERE nacimiento > 1970;
SELECT libro, COUNT(libro) AS total FROM historial GROUP BY libro ORDER BY total DESC LIMIT 1;


