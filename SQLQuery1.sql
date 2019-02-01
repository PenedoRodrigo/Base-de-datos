create database Autogestion9
use Autogestion9
--------------------------------------------------------------------------------1
create table Carreras
(id_carrera int identity(1,1),
carrera varchar (50)
constraint pk_id_carrera primary key (id_carrera))
---------------------------------------------------------------------------------2
create table Turno_Examenes
(nro_turno int identity(1,1),
fecha datetime
constraint pk_Turno_Examenes primary key (nro_turno))
---------------------------------------------------------------------------------3
create table Cursos
(id_curso int,
nombre varchar (50),
hora datetime,
id_carrera int
constraint pk_id_curso primary key (id_curso),
constraint fk_carreras_cursos foreign key (id_carrera)
references Carreras (id_carrera))
---------------------------------------------------------------------------------4
create table Estados
(id_estado int identity(1,1) ,
estado varchar (50)
constraint pk_id_estado primary key (id_estado))
---------------------------------------------------------------------------------5
create table Materias
(id_materia int identity(1,1),
materia varchar (50)
constraint pk_id_materia primary key (id_materia))
---------------------------------------------------------------------------------6
create table barrios
(id_barrio int identity(1,1),
barrio varchar (50),
constraint pk_barrio primary key (id_barrio))
---------------------------------------------------------------------------------7
create table tipo_dni
(id_tipo_dni int,
tipo varchar(50)
constraint pk_tipo_dni primary key (id_tipo_dni))
---------------------------------------------------------------------------------8
create table generos
(id_genero int identity(1,1),
genero varchar(50)
constraint pk_genero primary key(id_genero))
---------------------------------------------------------------------------------9
create table estado_civil
(id_estado_civil int identity(1,1),  
tipo varchar(50)
constraint pk_estado_civil primary key(id_estado_civil))
--------------------------------------------------------------------------------10
create table tipo_inscripciones
(id_tipo_inscripcion int identity(1,1),
tipo varchar(50)
constraint pk_tipo_inscripcion primary key(id_tipo_inscripcion))
--------------------------------------------------------------------------------11
create table alumnos
(id_legajo int not null,
nombre varchar(50),
apellido varchar(50),
edad int,
calle varchar(50),
numero int,
telefono int,
email varchar(50),
estado_laboral bit,
id_barrio int,
id_tipo_dni int,
id_genero int,
id_estado_civil int
constraint pk_legajo primary key (id_legajo),
constraint fk_barrios_alumnos foreign key(id_barrio)
references barrios (id_barrio),
constraint fk_tipo_dni_alumnos foreign key(id_tipo_dni)
references tipo_dni (id_tipo_dni),
constraint fk_generos_alumnos foreign key(id_genero)
references generos (id_genero),
constraint fk_estado_civil_alumnos foreign key(id_estado_civil)
references estado_civil (id_estado_civil))
--------------------------------------------------------------------------------12
create table docentes
(id_matricula int not null,
nombre varchar(50),
apellido varchar(50),
dni int,
calle varchar(50),
numero int,
telefono int,
email varchar(50),
id_barrio int,
id_tipo_dni int,
id_genero int,
id_estado_civil int
constraint pk_matricula primary key (id_matricula),
constraint fk_barrios_docentes foreign key(id_barrio)
references barrios (id_barrio),
constraint fk_tipo_dni_docentes foreign key(id_tipo_dni)
references tipo_dni (id_tipo_dni),
constraint fk_generos_docentes foreign key(id_genero)
references generos (id_genero),
constraint fk_estado_civil_docentes foreign key(id_estado_civil)
references estado_civil (id_estado_civil))
--------------------------------------------------------------------------------13
create table inscripciones
(id_inscripcion int identity(1,1) ,
id_legajo int,
fecha_inscripcion datetime,
id_tipo_inscripcion int
constraint pk_inscripcion primary key (id_inscripcion),
constraint fk_tipo_inscripciones_inscripciones foreign key(id_tipo_inscripcion)
references tipo_inscripciones (id_tipo_inscripcion))
--------------------------------------------------------------------------------14
create table Curso_Docente
(id_curso_docente int ,
id_matricula int,
id_materia int,
id_curso int,
horario datetime,
año int
constraint pk_id_curso_docente primary key (id_curso_docente)
constraint fk_docentes_curso_docente foreign key (id_matricula)
references Docentes (id_matricula),
constraint fk_materias_curso_docente foreign key (id_materia)
references Materias (id_materia),
constraint fk_cursos_curso_docente foreign key (id_curso)
references Cursos (id_curso))
--------------------------------------------------------------------------------15
create table Examenes
(id_examen int,
id_curso_docente int,
id_legajo int,
nro_turno int,
id_inscripcion int,
tipo_examen varchar (50),
fecha_examen datetime,
nota decimal
constraint pk_id_examen primary key (id_examen),
constraint fk_curso_docente_examenes foreign key (id_curso_docente)
references Curso_docente (id_curso_docente),
constraint fk_alumnos_examenes foreign key (id_legajo)
references Alumnos (id_legajo),
constraint fk_turno_examenes_examenes foreign key (nro_turno)
references turno_examenes (nro_turno),
constraint fk_inscripciones_examenes foreign key (id_inscripcion)
references inscripciones (id_inscripcion))
--------------------------------------------------------------------------------16
create table Mat_Cursadas_Alu
(id_materias_cursadas int identity(1,1),
id_materia int,
id_estado int,
id_legajo int,
id_curso int
constraint pk_id_materias_cursadas primary key (id_materias_cursadas),
constraint fk_materias_mat_cursadas_alu foreign key (id_materia)
references Materias (id_materia),
constraint fk_estados_mat_cursadas_alu foreign key (id_estado)
references Estados (id_estado),
constraint fk_alumnos_mat_cursadas_alu foreign key (id_legajo)
references Alumnos (id_legajo),
constraint fk_cursos_mat_cursadas_alu foreign key (id_curso)
references Cursos (id_curso))


---------------------------------------------------------------------------------
-----------------------------INSERTS---------------------------------------------
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------1
insert into barrios(barrio)
values ('alta cordoba'),
       ('cofico'),
	   ('alberdi'),
	   ('centro'),
	   ('zumaran')
---------------------------------------------------------------------------------2
insert into tipo_dni (id_tipo_dni, tipo)
values (1,'dni'),
	   (2,'libreta civica'),
	   (3,'pasaporte')
---------------------------------------------------------------------------------3
insert into generos (genero)
values ('masculino'),
	   ('femenino')
---------------------------------------------------------------------------------4
insert into estado_civil (tipo)
values ('soltero'),
	   ('casado'),
	   ('viudo'),
	   ('divorsiado')
-----------------------------DOCENTES--------------------------------------------5
insert into docentes(id_matricula, nombre, apellido, dni, calle, numero, telefono, email, id_barrio ,id_tipo_dni, id_genero ,id_estado_civil)
values  (326598,'alicia','floripondio',40325234,'calle falsa',123,4568923,'lalala@g.mail.com',1,1,2,1),
	  	(326587,'roberto','del valle',40325234,'sarachaga',877,4985642,'lolololo@g.mail.com',2,1,1,1),
		(789654,'marcela','carrizo',40325234,'chacabuco',456,4854273,'lelele@g.mail.com',3,1,2,1),
		(125874,'juan','steferson',40325234,'pedro zani',154,4571243,'lilili@g.mail.com',4,1,1,2),
		(783205,'paquita','artigas',40325234,'gongora',345,44528753,'lululu@g.mail.com',5,1,2,1)

-----------------------------ALUMNOS----------------------------------------------6
insert into alumnos(id_legajo, nombre, apellido, edad, calle, numero, telefono, email, estado_laboral, id_barrio ,id_tipo_dni, id_genero ,id_estado_civil)
values  (110293,'rodolfa','perez',25,'calle falsa',65,4560123,'lalala@g.mail.com',0,1,1,2,1),
	  	(110418,'raul','gomez',24,'sarachaga',517,4902642,'lolololo@g.mail.com',1,2,1,1,1),
		(110597,'laura','fernandez',27,'chacabuco',486,4805273,'lelele@g.mail.com',0,3,1,2,1),
		(110458,'lucas','rodrigez',29,'pedro zani',104,4570743,'lilili@g.mail.com',1,4,1,1,2),
		(110456,'minna','sillankorva',30,'gongora',455,44520353,'lululu@g.mail.com',1,5,1,2,1),

		(100294,'mariano','Alvarez',26,'piotti',4353,4560123,'marianoalvarez@gmail.com',1,1,1,1,2),
	  	(100417,'Javier','Prosdocimo',25,'puerredon',6345,4902642,'javiern prosdocimo@gmail.com',0,2,1,1,2),
		(100598,'Mariana','fernandez',26,'neper',2879,4805273,'marianafernandez@gmail.com',1,3,1,2,1),
		(100459,'Gerardo','rodrigez',30,'recta martinolli',904,4570743,'gerardorodriguez@gmail.com',0,4,1,1,2),
		(100457,'Agustin','Diaz',31,'francisco de andrea',4563,44520353,'agustindiaz@gmail.com',1,5,1,1,2),
		---------------------------------------------------------------
		 (100394,'marianonito','Alvarezito',30,'piotti',4353,4560123, null,1,1,1,1,2),
	  	(100517,'Javiersito','Prosdocimo',24,'puerredon',6345,4902642,null,0,2,1,1,2),
		(100698,'Marianata','fernandez',40,'neper',2879,null,null,1,3,1,2,1),
		(100759,'Gerarda','rodrigez',27,'recta martinolli',904,4570743,null,0,4,1,1,2),
		(100957,'Agustina','Diaz',24,'francisco de andrea',4563,null,null,1,5,1,1,2)

---------------------------------------------------------------------------------7
insert into Carreras (carrera)
values ('ing en sistemas'),
       ('ing mecanica'),
       ('progamacion'),
       ('diseño industrial'),
       ('arquitectura')
---------------------------------------------------------------------------------8
insert into Turno_Examenes (fecha)
values ('2018/11/10'),
       ('2018/12/20'),
       ('2018/12/15'),
       ('2018/11/28'),
       ('2018/11/05')
	   --año-mes-dia--
---------------------------------------------------------------------------------9
insert into Cursos (id_curso,nombre, hora, id_carrera)
values (1,804,'08:30',1),
       (2,810,'08:00',2),
       (3,689,'10:00',3),
       (4,584,'12:00',4),
       (5,752,'11:30',5)
--------------------------------------------------------------------------------10
insert into Estados (estado)
values ('libre'),
       ('regular'),
       ('promocionado')
--------------------------------------------------------------------------------11
insert into Materias (materia)
values ('programacion'),
       ('matematicas'),
       ('computacion'),
       ('sql'),
       ('estadistica'),
	   ('ingles1'),
	   ('ingles2'),
	   ('arquitectura'),
	   ('java'),
	   ('quimica')
--------------------------------------------------------------------------------12
insert into tipo_inscripciones (tipo)
values ('presencial'),
	   ('no presencial'),
	   ('web')
--------------------------------------------------------------------------------13
insert into inscripciones (id_legajo, fecha_inscripcion, id_tipo_inscripcion)
values  (110293,'2017/12/12',1),
	    (110418,'2018/02/02',1),
	    (110597,'2017/12/03',2),
    	(110458,'2016/12/05',3),
   	    (110456,'2017/12/08',1),

		(110293,'2017/12/12',3),
	    (110418,'2017/12/12',3),
	    (110597,'2017/12/12',1),
    	(110458,'2017/12/12',1),
   	    (110456,'2017/12/12',1),

		(110293,'2018/02/02',3),
	    (110418,'2018/02/02',3),
	    (110597,'2018/02/02',2),
    	(110458,'2018/02/02',1),
   	    (110456,'2018/02/02',2),

		(110293,'2017/12/03',1),
	    (110418,'2017/12/03',1),
	    (110597,'2017/12/03',2),
    	(110458,'2017/12/03',2),
   	    (110456,'2017/12/03',2),

		(110293,'2016/12/05',1),
	    (110418,'2016/12/05',2),
	    (110597,'2016/12/05',3),
    	(110458,'2016/12/05',3),
   	    (110456,'2016/12/05',1),

		(110293,'2017/12/08',1),
	    (110418,'2017/12/08',1),
	    (110597,'2017/12/08',2),
    	(110458,'2017/12/08',3),
   	    (110456,'2017/12/08',3),

        (100394,'2017/12/12',1),
		(100517,'2017/12/12',2),
		(100698,'2017/12/12',3),
		(100759,'2017/12/12',2),
		(100957,'2017/12/12',3),

		(100384,'2017/12/12',1),
		(100527,'2017/12/12',2),
		(100688,'2017/12/12',3),
		(100749,'2017/12/12',2),
		(100967,'2017/12/12',1),

		---------------------------
		(100394,'2018/02/02',1),
		(100517,'2018/02/02',2),
		(100698,'2018/02/02',3),
		(100759,'2018/02/02',2),
		(100957,'2018/02/02',3),

		(100384,'2018/02/02',1),
		(100527,'2018/02/02',2),
		(100688,'2018/02/02',3),
		(100749,'2018/02/02',2),
		(100967,'2018/02/02',1),

		-----------------------

		(100394,'2017/12/03',1),
		(100517,'2017/12/03',2),
		(100698,'2017/12/03',3),
		(100759,'2017/12/03',2),
		(100957,'2017/12/03',3),

		(100384,'2017/12/03',1),
		(100527,'2017/12/03',2),
		(100688,'2017/12/03',3),
		(100749,'2017/12/03',2),
		(100967,'2017/12/03',1),

		--------------------------
		
		(100394,'2016/12/05',1),
		(100517,'2016/12/05',2),
		(100698,'2016/12/05',3),
		(100759,'2016/12/05',2),
		(100957,'2016/12/05',3),

		(100384,'2016/12/05',1),
		(100527,'2016/12/05',2),
		(100688,'2016/12/05',3),
		(100749,'2016/12/05',2),
		(100967,'2016/12/05',1),

	    ------------------------
	   
	   (100394,'2017/12/08',1),
		(100517,'2017/12/08',2),
		(100698,'2017/12/08',3),
		(100759,'2017/12/08',2),
		(100957,'2017/12/08',3),

		(100384,'2017/12/08',1),
		(100527,'2017/12/08',2),
		(100688,'2017/12/08',3),
		(100749,'2017/12/08',2),
		(100967,'2017/12/08',1)

--------------------------------------------------------------------------------14
insert into Curso_Docente (id_curso_docente, id_matricula, id_materia, id_curso, horario, año)
values (1,326598,1,1,'08:30',2018),
	   (2,326587,2,2,'08:00',2018),
	   (3,789654,3,3,'10:00',2017),
	   (4,125874,4,4,'12:00',2017),
	   (5,783205,5,5,'11:30',2016)

--------------------------------------------------------------------------------15
insert into Mat_Cursadas_Alu (id_materia, id_estado, id_legajo, id_curso)
values (1,3,110293,1),
	   (1,3,110418,1),
	   (1,3,110597,1),
	   (1,2,110458,1),
	   (1,1,110456,1),
	   (1,3,100394,1),
	   (1,3,100517,1),
	   (1,3,100698,1),
	   (1,2,100759,1),
	   (1,1,100957,1),
	   
	   (2,1,110293,1),
	   (2,1,110418,1),
	   (2,2,110597,1),
	   (2,2,110458,1),
	   (2,3,110456,1),
	   (2,3,100394,1),
	   (2,3,100517,1),
	   (2,3,100698,1),
	   (2,2,100759,1),
	   (2,1,100957,1),

	   (3,2,110293,1),
	   (3,3,110418,1),
	   (3,3,110597,1),
	   (3,1,110458,1),
	   (3,1,110456,1),
	   (3,3,100394,1),
	   (3,3,100517,1),
	   (3,3,100698,1),
	   (3,2,100759,1),
	   (3,1,100957,1),

	   (4,2,110458,1),
	   (4,3,110293,1),
	   (4,3,110418,1),
	   (4,1,110456,1),
	   (4,3,110597,1),
	   (4,3,100394,1),
	   (4,3,100517,1),
	   (4,3,100698,1),
	   (4,2,100759,1),
	   (4,1,100957,1),

	   (5,1,110293,1),
	   (5,2,110418,1),
	   (5,2,110597,1),
	   (5,1,110458,1),
	   (5,1,110456,1),
	   (5,3,100394,1),
	   (5,3,100517,1),
	   (5,3,100698,1),
	   (5,2,100759,1),
	   (5,1,100957,1)
--------------------------------------------------------------------------------16
insert into Examenes (id_examen, id_curso_docente, id_legajo, nro_turno, tipo_examen, fecha_examen, nota)
values (1,1,110597,3,3,'2017/12/10',10),
	   (2,1,110456,5,5,'2016/12/10',5),
       (3,1,110456,5,5,'2016/12/10',2),
       (4,1,110293,1,1,'2017/12/10',8),
       (5,1,110418,2,2,'2018/12/10',4),
	   (6,1,110597,3,3,'2017/12/10',10),
	   (7,1,110458,4,4,'2018/12/10',8),
	   (8,1,110456,5,5,'2016/12/10',9),


	   (9,1,110293,5,5,'2016/12/10',5),
       (10,1,110418,5,5,'2016/12/10',2),
	   (11,1,110456,5,5,'2016/12/10',9),
	   (12,1,110597,5,5,'2016/12/10',9),
	   (13,1,110458,5,5,'2016/12/10',9),
	   (14,1,100394,1,4,'2016/12/10',5),
	   (15,1,100517,1,5,'2016/12/10',4),
	   (16,1,100698,4,5,'2016/12/10',6),
	   (17,1,100759,3,5,'2016/12/10',7),
	   (18,1,100957,5,5,'2016/12/10',8),

	   (19,1,110293,1,1,'2017/12/03',3),
	   (20,1,110418,5,5,'2017/12/03',2),
	   (21,1,110456,5,5,'2017/12/03',6),
	   (22,1,110597,5,5,'2017/12/03',7),
	   (23,1,110458,5,5,'2017/12/03',9),
	   (24,1,100394,1,4,'2017/12/03',6),
	   (25,1,100517,1,5,'2017/12/03',6),
	   (26,1,100698,4,5,'2017/12/03',6),
	   (27,1,100759,3,5,'2017/12/03',7),
	   (28,1,100957,5,5,'2017/12/03',8),

	   (29,1,110293,1,1,'2017/12/08',6),
	   (30,1,110418,5,5,'2017/12/08',2),
	   (31,1,110456,5,5,'2017/12/08',1),
	   (32,1,110597,5,5,'2017/12/08',10),
	   (33,1,110458,5,5,'2017/12/08',10),
	   (34,1,100394,1,4,'2017/12/08',8),
	   (35,1,100517,1,5,'2017/12/08',9),
	   (36,1,100698,4,5,'2017/12/08',3),
	   (37,1,100759,3,5,'2017/12/08',3),
	   (38,1,100957,5,5,'2017/12/08',8),
	   
       (39,1,110293,1,1,'2017/12/10',8),
	   (40,1,110597,3,3,'2017/12/10',6),
	   (41,1,110597,3,3,'2017/12/10',4),
	   (42,1,110458,5,5,'2017/12/10',1),
	   (43,1,110456,5,5,'2017/12/10',3),
	   (44,1,100394,1,4,'2017/12/10',9),
	   (45,1,100517,1,5,'2017/12/10',7),
	   (46,1,100698,4,5,'2017/12/10',3),
	   (47,1,100759,3,5,'2017/12/10',7),
	   (48,1,100957,5,5,'2017/12/10',8),
	   
	   (49,1,110458,4,4,'2018/02/02',1),
	   (50,1,110293,1,1,'2018/12/02',8),
	   (51,1,110418,5,5,'2018/12/02',2),
	   (52,1,110456,5,5,'2018/12/02',1),
	   (53,1,110597,5,5,'2018/12/02',1),
	   (54,1,100394,1,4,'2018/12/02',3),
	   (55,1,100517,1,5,'2018/12/02',3),
	   (56,1,100698,4,5,'2018/12/02',4),
	   (57,1,100759,3,5,'2018/12/02',6),
	   (58,1,100957,5,5,'2018/12/02',8),  
       (59,1,110458,4,4,'2018/12/02',8),
	   (60,1,110293,1,1,'2018/12/02',8),
	   (61,1,110418,5,5,'2018/12/02',6),
	   (62,1,110456,5,5,'2018/12/02',5),
	   (63,1,100957,5,5,'2018/12/02',4)


---------------------------------------------FIN------------------------------------
------------------------------------------------------------------------------------


------------------------------------------CONSULTAS----------------------------------

--1) Se quiere mostrar la nota promedio y su nombre. Mostrar estos datos solo para los casos en que su 
--promedio de notas sea inferior al importe promedio del alumno.

select a.nombre, avg(e.nota)'Nota promedio'
from alumnos a join examenes e on a.id_legajo = e.id_legajo
join curso_docente cd on cd.id_curso_docente = e.id_curso_docente 
join docentes d on d.id_matricula = cd.id_matricula 
group by a.nombre
having AVG(e.nota) < (select AVG(e.nota)  
                        from  alumnos a join examenes e on a.id_legajo = e.id_legajo 
                        where  a.id_legajo = e.id_legajo) 

-----------------------------procedimiento------------------------------------
create proc punto1
@nombre varchar(50)
as
select @nombre, avg(e.nota)'Nota promedio'
from alumnos a join examenes e on a.id_legajo = e.id_legajo
join curso_docente cd on cd.id_curso_docente = e.id_curso_docente 
join docentes d on d.id_matricula = cd.id_matricula 
group by a.nombre
having AVG(e.nota) < (select AVG(e.nota)  
                        from  alumnos a join examenes e on a.id_legajo = e.id_legajo 
                        where  a.id_legajo = e.id_legajo)



--2) Se desea contar la cantidad de alumnos con nota menor a 4. Rotule la lista con el nombre "APLAZADOS" y que 
--comienzan con la letra “M” y que el teléfono sea conocido. Elaborar más esta consulta , es muy simple
select count(e.id_examen)'APLAZADOS', a.nombre + ' ' + a.apellido 'nombre alumno'
from examenes e join alumnos a on e.id_legajo = a.id_legajo
where nota < 4 and telefono is not null and nombre like 'M%'
group by a.nombre + ' ' + a.apellido
----------------------procedimiento------------------------------------
create proc conzultaaa2
@nota int =10,
@letra nvarchar =' %'
as
select count(e.id_examen)'APLAZADOS', a.nombre + ' ' + a.apellido 'nombre alumno'
from examenes e join alumnos a on e.id_legajo = a.id_legajo
where nota < @nota and telefono is not null and nombre like @letra
group by a.nombre + ' ' + a.apellido

execute conzultaaa2 4,m



--3) se quiere saber q cantidad de alumnos regulares hay en la materia sql y a su vez el promedio de regulares de la misma, 
--para tener la condicion de regular la nota debe ser menor igual a 7 y mayor = a 4
select count(ex.id_examen)'cantidad de regulares' , materia 'Nombre Materia',  avg(nota) 'Nota Promedio'
from examenes ex join alumnos a on a.id_legajo = ex.id_legajo 
join mat_cursadas_alu mca on a.id_legajo = mca.id_legajo
join materias ma on ma.id_materia = mca.id_materia
join estados es on es.id_estado = mca.id_estado 
where ex.nota between 4 and 7 and materia like '%sql%'
group by materia
--------------PROCEDIMIENTO---------------------------
create proc consulta3
@materia nvarchar = '% %'
as
select count(ex.id_examen)'cantidad de regulares' , ma.materia 'Nombre Materia',  avg(nota) 'Nota Promedio'
from examenes ex join alumnos a on a.id_legajo = ex.id_legajo 
join mat_cursadas_alu mca on a.id_legajo = mca.id_legajo
join materias ma on ma.id_materia = mca.id_materia
join estados es on es.id_estado = mca.id_estado 
where ex.nota between 4 and 7 and ma.materia like @materia
group by ma.materia

execute consulta3               --si ejecutas este anda
execute consulta3 estadistica   --si ejecutas esta no anda (nose xq)


--4)cantidad de promocionados que hay en la materia programación que tengan email y teléfono sobre la cantidad de alumnos 
--totales del año pasado. La nota para promoción debe ser mayor a 7
select count(e.id_examen)'cantidad de promocionados', year(ins.fecha_inscripcion)
from examenes e join mat_cursadas_alu mca on e.id_legajo = mca.id_legajo
join materias ma on ma.id_materia = mca.id_materia
join alumnos al on al.id_legajo = mca.id_legajo
join inscripciones ins on ins.id_legajo = al.id_legajo
where nota > 7 and (email is not null or telefono is not null) and year(fecha_inscripcion) = year(getdate())-1 and Materia like '%programacion%'
group by  year(ins.fecha_inscripcion)


--5)se desea saber la cantidad de alumnos que hay por materias, el nombre de la materia y el curso, 
--donde el curso sea 1 y la materia 4
select count(mca.id_curso)'cantidad de alumnos',m.materia'materia', c.nombre'CURSO' 
from alumnos a join mat_cursadas_alu mca on a.id_legajo=mca.id_legajo
join materias m on m.id_materia=mca.id_materia
join cursos c on c.id_curso=mca.id_curso
where c.id_curso = 1 and m.id_materia = 4
group by m.materia,c.nombre


--6) Se quiere saber la nota mayor, la nota menor, el promedio general de cada curso. Donde los cursos sean 1,2,3
select max(e.nota)'Nota mayor', min(e.nota)'Nota menor', avg(e.nota)'Promedio notas',
c.nombre'Nombre curso'
from Examenes e join Curso_Docente cd on cd.id_curso_docente = e.id_curso_docente
join cursos c on c.id_curso=cd.id_curso
where c.id_curso in (1,2,3)
group by  c.nombre


--7) Se quiere saber nombre, edad, notas de todos los exámenes, su materia correspondiente y su estado. 
--mostrar aquellos nombres que comiendo con C. Ordenar las notas en forma descendente OK
select a.id_legajo 'legajo alumno',a.nombre'nombre alumno', a.edad'Años',ex.nota'Nota',
mat.materia'nombre materia', es.estado'condicion'        
from alumnos a join examenes ex on a.id_legajo=ex.id_legajo 
join Mat_Cursadas_Alu mca on a.id_legajo=mca.id_legajo
join materias mat on mat.id_materia=mca.id_materia
join estados es on es.id_estado=mca.id_estado
where a.nombre like 'm%'
group by a.id_legajo, a.nombre, a.edad,ex.nota,
mat.materia, es.estado  
order by ex.nota Desc

  
--8) Se desea saber el nombre, apellido, teléfono en una misma tabla. Primero mostrar los docentes y luego los alumnos. 
--ordenados por nombre
select nombre'NOMBRE', apellido'APELLIDO', telefono'TEL',email'Correo', 'Docente' tipo
from docentes
union
select nombre, apellido, telefono, email, 'Alumno'
from alumnos
order by 5 desc, 1



