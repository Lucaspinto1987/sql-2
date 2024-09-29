/* Relación tipo 1:1 */
-- PASO 1
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);
-- insertamos los datos a la tabla "categorias"
INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');



-- PASO 2
-- añadimos la columna id_categoria a la tabla usuarios
ALTER TABLE usuarios ADD COLUMN id_categoria INT;


-- PASO 3
-- Añadimos categorias a distintos usuarios
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 7, 9, 10,  13, 15, 17);


-- PASO 4
-- aqui realizamos la consulta para ver que si se unen los usuarios,roles y categorias.. Hacemos un JoIN para que muestre los datos de los usuarios con sus roles y categorias.
SELECT 
    usuarios.id_usuario, 
    usuarios.nombre, 
    usuarios.apellido, 
    usuarios.email, 
    usuarios.edad, 
    roles.nombre_rol, 
    categorias.nombre_categoria 
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria;



/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí


-- PASO 2
-- Tu código aquí


-- PASO 3
-- Tu código aquí


-- PASO 4
-- Tu código aquí

/* Relación tipo N:M */
-- PASO 1
CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);



-- PASO 2

INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),  -- El usuario 1 está asociado con las categorías 1, 2 y 3
(2, 4), (2, 5),          -- El usuario 2 está asociado con las categorías 4 y 5
(3, 6), (3, 7),          -- El usuario 3 está asociado con las categorías 6 y 7
(4, 8), (4, 9), (4, 10); -- El usuario 4 está asociado con las categorías 8, 9 y 10



-- PASO 3
SELECT 
    u.id_usuario, 
    u.nombre, 
    u.apellido, 
    u.email, 
    u.edad, 
    r.nombre_rol, 
    c.nombre_categoria 
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol
JOIN usuarios_categorias uc ON u.id_usuario = uc.id_usuario
JOIN categorias c ON uc.id_categoria = c.id_categoria;
