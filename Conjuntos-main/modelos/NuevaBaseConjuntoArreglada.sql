create database Conjunto2;
USE Conjunto2;

CREATE TABLE Persona(
    ID_Persona int not null,
    Nombre varchar(100) not null,
    Correo varchar(100) not null,
    Telefono varchar(100) not null,
    Contrasenia varchar(100) not null,
    primary key(ID_Persona)
);

CREATE TABLE Apartamento(
    ID_Propietario int not null,
    Numero_Apartamento int not null,
    Bloque int not null,
    primary key(Numero_Apartamento, Bloque),
    foreign key(ID_Propietario) references Conjunto2.Persona(ID_Persona)
);

CREATE TABLE Rol(
    ID_Rol int not null auto_increment,
    Nombre_Rol varchar(100) not null,
    primary key(ID_Rol)
);

CREATE TABLE Cuenta(
    ID_Cuenta int not null auto_increment,
    Numero_Apartamento int not null,
    Bloque int not null,
    MesesPagados int not null,
    MontoMensual double not null,
    MesesTotales int not null,
    Saldo double not null,
    primary key(ID_Cuenta),
    foreign key(Numero_Apartamento, Bloque)
    references Conjunto2.Apartamento(Numero_Apartamento, Bloque)
);

CREATE TABLE Rol_Persona(
    ID_Persona int not null,
    ID_Rol int not null,
    ID_Cuenta int not null,
    foreign key(ID_Rol)
    references Conjunto2.Rol(ID_Rol),
    foreign key(ID_Persona)
    references Conjunto2.Persona(ID_Persona),
    foreign key(ID_Cuenta)
    references Conjunto2.Cuenta(ID_Cuenta)
);

CREATE TABLE Estado(
    ID_Estado int not null auto_increment,
    Nombre_Estado varchar(100) not null,
    primary key(ID_Estado)
);

CREATE TABLE Paga(
    ID_Pago int not null auto_increment,
    ID_Estado int not null,
    ID_Cuenta int not null,
    Fecha date not null,
    Tot_Pagar double not null,
    Monto_Recibido double not null,
    Saldo double not null,
    primary key(ID_Pago),
    foreign key(ID_Estado)
    references Conjunto2.Estado(ID_Estado),
    foreign key(ID_Cuenta)
    references Conjunto2.Cuenta(ID_Cuenta)
);