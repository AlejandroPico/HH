drop database if exists HH;
CREATE DATABASE HH;
use HH;

-- --------------------------------------- entidades
create table usuario(
email_usuario varchar(50),
tipo_usuario int,
nombre varchar(50),
apellidos varchar(50),
fecha_nac date,
ciudad varchar(50),
primary key (email_usuario,tipo_usuario)
);

create table ofertor(
email_ofertor varchar(50),
tipo_usuario int,
nombre varchar(50),
apellidos varchar(50),
fecha_nac date,
ciudad varchar(50),
primary key (email_ofertor,tipo_usuario)
);

create table lugar(
id_lugar int primary key,
tipo_lugar varchar(50),
ubicacion varchar(50),
responsable varchar(50),
telefono int,
valoracion int,
descripcion text,
constraint lugarofertor foreign key (responsable) references ofertor(email_ofertor)
);

create table ofertaempleo(
id_oferta int,
ofertor varchar(50),
titulo varchar(50),
lugar varchar(50),
mensaje text,
primary key(id_oferta,ofertor),
constraint ofertaempleoofertor foreign key (ofertor) references ofertor(email_ofertor)
);

create table tipolugar(
id_tipolugar int primary key,
requisitos varchar(50),
constraint tipolugarlugar foreign key (id_tipolugar) references lugar(id_lugar)
);

-- -------------------------------------- relaciones
create table buscan(
email_usuario varchar(50),
id_lugar int,
primary key (email_usuario,id_lugar),
constraint buscanusuario foreign key (email_usuario) references usuario(email_usuario),
constraint buscanlugar foreign key (id_lugar) references lugar(id_lugar)
);

create table valoran(
email_usuario varchar(50),
id_lugar int,
fecha_valoracion date,
puntuacion int,
descripcion text,
primary key (email_usuario,id_lugar,fecha_valoracion),
constraint valoranusuario foreign key (email_usuario) references usuario(email_usuario),
constraint valoranlugar foreign key (id_lugar) references lugar(id_lugar)
);

create table hablan(
email_usuario varchar(50),
email_ofertor varchar(50),
fecha_conversacion date,
mensaje text,
primary key (email_usuario, email_ofertor, fecha_conversacion),
constraint hablanusuarios foreign key (email_usuario) references usuario(email_usuario),
constraint hablanofertor foreign key (email_ofertor) references ofertor(email_ofertor)
);

create table consultar(
email_usuario varchar(50),
id_oferta int,
fecha_consulta date,
primary key(email_usuario,id_oferta,fecha_consulta),
constraint consultarusuario foreign key(email_usuario) references usuario(email_usuario),
constraint consultarofertaempleo foreign key (id_oferta) references ofertaempleo(id_oferta)
);

-- ------------------------------------------------------- INSERTS
-- Ejemplo de insert en usuario
-- campos de usuario : correo (varchar 50), tipo usuario (int), nombre(varchar 50), apellidos(varchar 50), fecha (date), ciudad (varchar 50)
INSERT INTO usuario VALUES ('usuario@gmail.com', 1, 'Han', 'Solo Solito', '1990-03-25', 'Barcelona');

-- Ejemplo de insert en ofertor
-- campos de ofertor : correo (varchar 50), tipo usuario (int), nombre (varchar 50), apellidos (varchar 50), fecha nacimiento (date), ciudad (varchar 50)
INSERT INTO ofertor VALUES ('ofertor@gmail.com', 2, 'Sin', 'Animo de Lucro', '1985-12-22', 'Barcelona');

-- Ejemplo de insert en lugar
-- campos de lugar : idlugar (int), tipo lugar (varchar 50), ubicacion (varchar 50), responsable (varchar 50), telefono (int), valoracion (int), descripcion (Text)
INSERT INTO lugar VALUES (1,'Comedor social', 'Barcelona', 'ofertor@gmail.com', 934445566, 5, 'Lugar grande y limpio para gentuza como tú....');

-- Ejemplo de insert en oferta de empleo
-- campos de ofertaempleo : idoferta (int), ofertor (varchar 50), titulo (varchar 50), lugar (varchar 50), mensje (text)
INSERT INTO ofertaempleo VALUES (1, 'ofertor@gmail.com', 'fontanero', 'Barcelona', 'Se necesita a manitas para hacerle un apaño a un "grifo"');

