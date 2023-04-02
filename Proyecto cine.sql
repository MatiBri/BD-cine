create database proyecto_cine_2019_lab_1w1
go
use proyecto_cine_2019_lab_1w1
go

create table Ciudades
(
 id_ciudad int,
 ciudades varchar(50),
constraint pk_ciudad primary key(id_ciudad)
)

create table Localidades
(
 id_localidad int,
 localidades varchar(50),
 id_ciudad int,
 constraint pk_localidad primary key(id_localidad),
 constraint fk_ciudad foreign key(id_ciudad) references Ciudades(id_ciudad)
)

create table Barrios
(
 id_barrio int,
 barrios varchar(50),
 id_localidad int,
 constraint pk_barrios primary key(id_barrio),
 constraint fk_localidad foreign key(id_localidad) references Localidades(id_localidad)
)

create table Butaca
(
 id_butaca int,
 numero_butaca varchar(50),
 constraint pk_butaca primary key(id_butaca)
)

create table Actores
(
 id_actor int,
 nombre varchar(50),
 apellido varchar(50),
 edad smallint,
 nacionalidad varchar(50),
 sexo varchar(50), --También puede ser bit
 constraint pk_actor primary key(id_actor),
)

create table Directores
(
 id_director int,
 nombre varchar(50),
 apellido varchar(50),
 edad smallint,
 nacionalidad varchar(50),
 sexo varchar(50),
 constraint pk_director primary key(id_director)
)

create table Directores_Pelicula
(
 id_directores_pelicula int,
 id_director int,
 id_pelicula int,
 constraint pk_directores_pelicula primary key(id_directores_pelicula),
 constraint fk_director foreign key(id_director) references Directores(id_director),
 constraint fk_pelicula foreign key(id_pelicula) references Pelicula(id_pelicula),
)

create table Actores_Pelicula
(
 id_actores_pelicula int,
 id_pelicula int,
 id_actor int,
 constraint pk_actores_pelicula primary key(id_actores_pelicula),
 constraint fk_pelicula foreign key(id_pelicula) references Pelicula(id_pelicula),
 constraint fk_actor foreign key(id_actor) references Actores(id_actor)
)

create table Pelicula
(
 id_pelicula int,
 nombre varchar(50),
 descripcion varchar (50),
 genero varchar (50),
 duracion int, --preguntar--
 calificacion int, --preguntar--
 constraint pk_pelicula primary key(id_pelicula),
)

create table Tipos_de_sala
(
 id_tipo_de_sala int,
 tipo_de_sala varchar(50),
 constraint pk_tipo_de_sala primary key(id_tipo_de_sala)
)

create table Detalle_entrada
(
 id_detalle_entrada int,
 id_entrada int,
 id_funcion int,
 monto int,
 descuento int,
 cantidad smallint,
 constraint pk_detalle_entrada primary key(id_detalle_entrada),
 constraint fk_entrada foreign key(id_entrada) references Entrada(id_entrada),
 constraint fk_funcion foreign key(id_funcion) references Funcion(id_funcion)
)

create table Funcion
(
 id_funcion int,
 id_pelicula int,
 id_sala int,
 horario int,
 constraint pk_funcion primary key(id_funcion),
 constraint fk_pelicula foreign key(id_pelicula) references Pelicula(id_pelicula),
 constraint fk_sala foreign key(id_sala) references Sala(id_sala)
)

create table Forma_de_pago
(
 id_forma_pago int,
 forma_de_pago varchar(50),
 constraint pk_forma_pago primary key(id_forma_pago),
)

create table Sala
(
 id_sala int,
 piso int,
 numero_butaca int,
 descripcion varchar(50),
 id_tipo_de_sala int,

 constraint pk_sala primary key(id_sala),
 constraint fk_tipo_de_sala foreign key(id_tipo_de_sala) references Tipos_de_sala(id_tipo_de_sala)
)

create table Entrada
(
 id_entrada int,
 id_cliente int,
 id_sala int,
 id_pelicula int,
 id_forma_pago int,
 horario int,
 id_butaca int,
 fecha datetime,

 constraint pk_entrada primary key(id_entrada),
 constraint fk_cliente foreign key(id_cliente) references Clientes(id_cliente),
 constraint fk_sala foreign key(id_sala) references Sala(id_sala),
 constraint fk_pelicula foreign key(id_pelicula) references Pelicula(id_pelicula),
 constraint fk_forma_pago foreign key(id_forma_pago) references Forma_de_pago(id_forma_pago),
 constraint fk_butaca foreign key(id_butaca) references Butaca(id_butaca)
)

create table Clientes
(
 id_cliente int,
 nombre varchar(50),
 apellido varchar(50),
 direccion varchar(50),
 numero_telefono varchar(50),
 fecha_nacimiento datetime,
 sexo varchar(50),
 id_barrio int,
 constraint pk_cliente primary key(id_cliente),
 constraint fk_barrio foreign key(id_barrio) references Barrios(id_barrio)
)