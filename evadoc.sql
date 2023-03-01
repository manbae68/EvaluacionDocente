drop database if exists evadoc;
create database evadoc;
use evadoc;

create table rol (
    id int primary key, 
    nombre varchar(30)
); 

insert into rol ( id, nombre ) values (1,'Docente');
insert into rol ( id, nombre ) values (2,'Coordinador Virtual Facultad');
insert into rol ( id, nombre ) values (3,'Director Escuela');
insert into rol ( id, nombre ) values (4,'Decano Facultad');
insert into rol ( id, nombre ) values (5,'Analista Desarrollo Docente');
insert into rol ( id, nombre ) values (6,'Coordinador Gestión Humana');
insert into rol ( id, nombre ) values (7,'Coordinador Virtual Escuela');

create table facultad(
    id int auto_increment primary key,
    nombre varchar(60)
);

create table escuela(
    id int auto_increment primary key,
    nombre varchar(75),
    idFacultad int,
    foreign key (idFacultad) references facultad(id)
);

create table usuario(
    id bigint auto_increment primary key,
    nombre varchar(30),
    apellido varchar(30),
    usuario varchar(20) unique,
    clave text(40),
    fechaRegistro date,
    idFacultad int,
    idEscuela int,    
    idRol int,
    idTutor bigint
);

create table sede (id int primary key, descripcion varchar(20));
INSERT INTO sede (ID,DESCRIPCION) VALUES (1,'Bogotá');
INSERT INTO sede (ID,DESCRIPCION) VALUES (2,'Cali');
INSERT INTO sede (ID,DESCRIPCION) VALUES (3,'Medellín');

create table cargo (id int primary key, descripcion varchar(40));
INSERT INTO cargo (ID,DESCRIPCION) VALUES (1,'PMT AUXILIAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (2,'PROFESOR CATEDRA');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (3,'PTC ASISTENTE');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (4,'PTC ASOCIADO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (5,'PTC AUXILIAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (6,'PTC AUXILIAR - CONSEJERO ACADEMICO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (7,'PTC AUXILIAR - COOR. ACREDITACION PROGRA');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (8,'PTC AUXILIAR - COOR. AUTOEVALUACION PREG');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (9,'PTC AUXILIAR - COOR. DESARROLLO DOCENTE');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (10,'PTC AUXILIAR - COOR. FOMENTO INVESTIGACI');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (11,'PTC AUXILIAR - COOR. GEST Y COOP NAL/INT');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (12,'PTC AUXILIAR - COOR. PROCESOS INDUSTRIAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (13,'PTC AUXILIAR - COORDINADOR PRACTICAS');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (14,'PTC AUXILIAR  COORDINADOR RC PREGRADO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (15,'PTC FORMACION');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (16,'PTC FORMACION CONSEJERO ACADEMICO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (17,'PTC INICIAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (18,'PTC INICIAL - COOR. ASESORIA PEDAG/ESCEN');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (19,'PTC INICIAL - COORDINADOR RC POSGRADO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (20,'PTC INICIAL- COOR. GESTION CONOCIMIENTO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (21,'PTC TITULAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (22,'PTC TITULAR -  - COOR ARTES DE LA ESCENA');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (23,'PTC TITULAR -  COOR OFICINA DE INCLUSION');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (24,'PTCI ASISTENTE');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (25,'PTCI ASOCIADO');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (26,'PTCI ASOCIADO - COOR LABORATORIO EXP.INM');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (27,'PTCI AUXILIAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (28,'PTCI TITULAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (29,'PTCV ASISTENTE');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (30,'PTCV AUXILIAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (31,'PTCV AUXILIAR - COOR. PROYECTOS ESPECIAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (32,'PTCV AUXILIAR CV - COOR VIRTUAL FACULTAD');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (33,'PTCV INICIAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (34,'PTCV TITULAR');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (35,'TMT VIRTUAL');
INSERT INTO cargo (ID,DESCRIPCION) VALUES (36,'TUTOR VIRTUAL');


create table estado (id int primary key, descripcion varchar(10));
insert into estado (id,descripcion) values (1,'Activo');
insert into estado (id,descripcion) values (2,'Inactivo');

create table tutor(
    id bigint primary key, 
    usuario varchar(20) unique, 
    nombre varchar(30),
    apellido varchar(30),
    telefono varchar(20),
    idEscuela int,
    idSede int,
    idCargo int,
    idEstado int,
    foreign key (idEscuela) references escuela(id),
    foreign key (idSede) references sede(id),    
    foreign key (idCargo) references cargo(id),
    foreign key (idEstado) references estado(id)   
);
 
create table criterio (
    id int primary key, 
    descripcion varchar(40),
    criterio varchar(255)
);

insert into criterio (id,
    descripcion,
    criterio
    )
    values ( 1,
    'No Revisión Semana Cero',
    'El tutor cumple con la revisión y aceptación de el (los) módulo(s) durante la semana 0.'
    );

insert into criterio (id,
    descripcion,
    criterio
    )
    values (2,
    'Tiene Casos CRM',
    'El tutor atiende los requerimientos que se reportan a través del CRM o de las alertas tempranas en relación con su actividad docente en el aula virtual.'    
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (3,
    'No Ingreso frecuente a Módulos ',
    'El tutor ingresa con frecuencia, no mayor a 48 horas, a los módulos que están a su cargo.'
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (4,
    'Calificaciones fuera de los tiempos',
    'El tutor califica y retroalimenta  los trabajos dentro de los tiempos establecidos.'
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (5,
    'Anuncios, Mensajes y Foros',
    'El tutor maneja adecuadamente los recursos del módulo:  anuncios,  mensajes etc.'
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (6,
    'Encuentros Sincrónicos',
    'El tutor cumple con los encuentros sincrónicos programados acorde con la ruta tutorial.'
    );
    
 insert into criterio (id,
    descripcion,
    criterio
     )
    values (7,
    'Entrega Oportuna Requerimientos',
    'El tutor entrega oportunamente los informes solicitados por la Coordinación Virtual, la Dirección de Escuela y/o la Decanatura.'
    );

 insert into criterio (id,
    descripcion,
    criterio
     )
    values (8,
    'Retroalimenta Actividades Evaluativas',
    'El tutor  presenta reportes y retroalimentaciones de calidad para las actividades evaluativas ( bancos de preguntas PIF).'
    );
    
   insert into criterio (id,
    descripcion,
    criterio
     )
    values (9,
    'Apoya al Equipo en las Actividades',
    'El tutor contribuye y/o apoya al equipo de trabajo en las actividades requeridas (revisión aulas master, estrategia TAV, acompañamiento sincrónico, actualización de módulos, entre otros).'
    );
    
    
create table cohorte (
    id int auto_increment primary key, 
    nombre varchar(6),
    anyo int,
    cohorte int
);    

create table evaluaciondocvir(
    id int auto_increment primary key, 
    idTutor bigint,
    anyo int,
    semestre int,
    cohorte int,
    bloque int,
    idCriterio int,
    cantidadModulos int,
    numeroCaso varchar(20),
    observaciones varchar(80),
    puntajeProceso int,
    puntajeEncuentro int,
    puntajeInforme int,
    puntajeRetro int,
    puntajeApoyo int,
    puntajeCualifica int,
    puntajeSancion int,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,
    foreign key (idTutor) references tutor(id),
    foreign key (idCriterio) references criterio(id),
    index (idTutor)
);
      
create table rubrica (idCriterio int, puntaje int, indicador varchar(82),valIni int, valFin int,
    primary key (idCriterio,puntaje),
    foreign key (idCriterio) references criterio(id));

insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,1,'Más de 3 reportes.',4,999);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,2,'3 reportes.',3,3);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,3,'2 reportes.',2,2);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,4,'1 reporte.',1,1);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (1,5,'Ningún reporte.',0,0);    
    
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,1,'Más de 6 casos.',7,999);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,2,'5 o 6 casos.',5,6);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,3,'3 o 4 casos.',3,4);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,4,'1 o 2 casos.',1,2);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (2,5,'No se reportan casos.',0,0);

insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,1,'Más de 3 reportes.',4,999);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,2,'3 reportes.',3,3);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,3,'2 reportes.',2,2);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,4,'1 reporte.',1,1);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (3,5,'Ningún reporte.',0,0);

insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,1,'Más de 3 reportes.',4,999);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,2,'3 reportes.',3,3);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,3,'2 reportes.',2,2);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,4,'1 reporte.',1,1);
insert into rubrica (idCriterio, puntaje, indicador,valIni,ValFin) values (4,5,'Ningún reporte.',0,0);

insert into rubrica (idCriterio, puntaje, indicador) values (5,1,'Cumple con menos del 25% de los niveles establecidos en la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (5,2,'Cumple con el 25% con los niveles establecidos en la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (5,3,'Cumple con el 50% con los niveles establecidos en la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (5,4,'Cumple con el 75% con los niveles establecidos en la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (5,5,'Cumple con el 100% con los niveles establecidos en la ruta tutorial.');

insert into rubrica (idCriterio, puntaje, indicador) values (6,1,'No realiza encuentros sincrónicos.');
insert into rubrica (idCriterio, puntaje, indicador) values (6,2,'Realiza el 25% de los encuentros, de acuerdo con la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (6,3,'Realiza el 50% de los encuentros, de acuerdo con la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (6,4,'Realiza el 75% de los encuentros, de acuerdo con la ruta tutorial.');
insert into rubrica (idCriterio, puntaje, indicador) values (6,5,'Realiza el 100% de los encuentros, de acuerdo con la ruta tutorial.');

insert into rubrica (idCriterio, puntaje, indicador) values (7,1,'No entrega informes oportunamente.');
insert into rubrica (idCriterio, puntaje, indicador) values (7,3,'Entrega parcialmente los informes solicitados, dentro de los tiempos establecidos.');
insert into rubrica (idCriterio, puntaje, indicador) values (7,5,'Entrega todos los informes solicitados oportunamente.');

insert into rubrica (idCriterio, puntaje, indicador) values (8,1,'No retroalimenta las actividades.');
insert into rubrica (idCriterio, puntaje, indicador) values (8,2,'Retrolimenta el 25% de las actividades.');
insert into rubrica (idCriterio, puntaje, indicador) values (8,3,'Retrolimenta el 50% de las actividades.');
insert into rubrica (idCriterio, puntaje, indicador) values (8,4,'Retrolimenta el 75% de las actividades.');
insert into rubrica (idCriterio, puntaje, indicador) values (8,5,'Retrolimenta el 100% de las actividades.');

insert into rubrica (idCriterio, puntaje, indicador) values (9,1,'No apoya al equipo de trabajo.');
insert into rubrica (idCriterio, puntaje, indicador) values (9,2,'Apoya en un 25% al equipo de trabajo.');
insert into rubrica (idCriterio, puntaje, indicador) values (9,3,'Apoya en un 50% al equipo de trabajo.');
insert into rubrica (idCriterio, puntaje, indicador) values (9,4,'Apoya en un 75% al equipo de trabajo.');
insert into rubrica (idCriterio, puntaje, indicador) values (9,5,'Apoya en un 100% al equipo de trabajo.');

create table imptutor(
    id bigint, 
    correo varchar(40),
    nombre varchar(30),
    apellido varchar(30),
    telefono varchar(20),
    sede varchar(10),
    cargo varchar(50),
    escuela varchar(75),
    idUsuario int,
    primary key (id,idUsuario)
);

create table dimension (    
    id int primary key, 
    descripcion  varchar(20));
    
insert into dimension (id, descripcion) values (1, 'Comunicativa');
insert into dimension (id, descripcion) values (2, 'Planificación');
insert into dimension (id, descripcion) values (3, 'Pedagógica');
insert into dimension (id, descripcion) values (4, 'Servicio');
insert into dimension (id, descripcion) values (5, 'Trabajo en equipo');
insert into dimension (id, descripcion) values (6, 'Gestión de Procesos');
insert into dimension (id, descripcion) values (7, 'Investigación');
insert into dimension (id, descripcion) values (8, 'Innovación');
insert into dimension (id, descripcion) values (9, 'Mot Logro');
insert into dimension (id, descripcion) values (10, 'Adaptabilidad');
insert into dimension (id, descripcion) values (11, 'AZ');
insert into dimension (id, descripcion) values (12, 'AZ Continuo');
insert into dimension (id, descripcion) values (13, 'Digital');
insert into dimension (id, descripcion) values (14, 'Calidad');
insert into dimension (id, descripcion) values (15, 'Gestión');

create table unidad (id int primary key, descripcion varchar(15));
insert into unidad (id,descripcion) values (1,'Estudiante Pre');
insert into unidad (id,descripcion) values (2,'Estudiante Vir');
insert into unidad (id,descripcion) values (3,'Profesor Pre');
insert into unidad (id,descripcion) values (4,'Profesor Vir');
insert into unidad (id,descripcion) values (5,'Direccion Pre');
insert into unidad (id,descripcion) values (6,'Direccion Vir');
insert into unidad (id,descripcion) values (7,'Acad-Admin Pre');
insert into unidad (id,descripcion) values (8,'Acad-Admin Vir');
insert into unidad (id,descripcion) values (9,'Labor Pre');
insert into unidad (id,descripcion) values (10,'Labor Vir');

 create table itemautoevaluacionvir (
    id int primary key, 
    idUnidad int,    
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id)  
    );
 
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (1,4,1,"Utilizo la sección de anuncios para publicar información relevante.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (2,4,1,"El mensaje de bienvenida incluye las recomendaciones generales del módulo y el logro de las competencias.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (3,4,1,"Respondo oportunamente  las  inquietudes de los estudiantes.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (4,4,1,"Respondo respetuosamente las  inquietudes de los estudiantes.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (5,4,1,"Respondo de manera clara las inquietudes de los estudiantes.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (6,4,1,"Publico oportunamente los horarios de encuentros sincrónicos.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (7,4,2,"Programo los encuentros sincrónicos acorde con la ruta tutorial.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (8,4,2,"Cumplo con los horarios establecidos para los encuentros sincrónicos.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (9,4,3,"Desarrollo las sesiones sincrónicas dando valor agregado al aprendizaje del estudiante.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (10,4,1,"Retroalimento oportunamente las distintas actividades.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (11,4,3,"Envío recordatorios de las distintas actividades evaluativas.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (12,4,3,"Doy a conocer los criterios de evaluación para cada una de las actividades.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (13,4,3,"Fomento el uso de recursos  y  material bibliográfico adicionales como apoyo o complemento para el logro de los objetivos de aprendizaje.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (14,4,3,"Empleo distintas estrategias para facilitar el desarrollo de las competencias del módulo.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (15,4,3,"Ofrezco acompañamiento frecuente y oportuno durante el desarrollo de las actividades del módulo  (casos, proyectos, foros, talleres, trabajos, entre otros).");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (16,4,3,"Doy aportes y sugerencias con relación a materiales, evaluaciones y enfoque del módulo.");
insert into itemautoevaluacionvir(id,idUnidad,idDimension,descripcion) values
    (17,4,3,"Participo activamente en los diferentes comités o reuniones convocados por las coordinaciones virtuales, la Escuela y/o la Facultad.");

create table autoevaluacionvir (
    id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    cohorte int,
    bloque int,
    semestre int,
    usuario varchar(20),    
    puntaje1 int,
    puntaje2 int,
    puntaje3 int,
    puntaje4 int,
    puntaje5 int,
    puntaje6 int,
    puntaje7 int,
    puntaje8 int,
    puntaje9 int,
    puntaje10 int,
    puntaje11 int,
    puntaje12 int,
    puntaje13 int,
    puntaje14 int,
    puntaje15 int,
    puntaje16 int,
    puntaje17 int,
    promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,   
    primary key (idTutor,anyo,cohorte,bloque) 
    );

 create table itemautoevaluacionpre (
    id int primary key, 
    idUnidad int,  
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)      
    );

insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (1,3,3,"Oriento el proceso de aprendizaje con seguridad y claridad, cuando un concepto no queda claro, lo explico de otra manera.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (2,3,3,"Me preocupo por realizar clases interesantes y motivadoras para los estudiantes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (3,3,3,"Asisto a clase y/o encuentros sincrónicos puntualmente y cumplo con el horario establecido");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (4,3,3,"Promuevo la reflexión sobre las implicaciones o aplicaciones prácticas de lo tratado en clase.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (5,3,3,"Entrego durante la primera semana al estudiante y a la dirección de la Escuela, el sílabo de las asignaturas a mi  cargo.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (6,3,3,"Reporto en la plataforma y el sistema académico oportunamente las notas de los estudiantes.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (7,3,3,"Hago seguimiento de los procesos de aprendizaje de los estudiantes y los informo a la dirección de la Escuela o Decanatura");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (8,3,3,"Participo activamente en los diferentes comités o reuniones convocados por la escuela, la Facultad y la institución.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (9,3,3,"Utilizo y  fomento el uso de recursos, material bibliográfico, equipo de apoyo y herramientas tecnológicas que facilitan la comprensión de los temas de clase");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (10,3,3,"Diseño y aplico instrumentos evaluación basados en la interpretación, el análisis, el juicio y la creatividad que valoren los conocimientos, las aptitudes y las actitudes de los estudiantes.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (11,3,3,"Devuelvo con comentarios u observaciones los trabajos o evaluaciones escritas y realizo observaciones y retroalimentación a los estudiantes.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (12,3,3,"Planifico y realizo actividades donde el estudiante logra fortalecer su proceso de aprendizaje.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (13,3,7,"La orientación que imparto permite en los estudiantes el análisis, desarrollo del pensamiento  crítico  de acuerdo con sus intereses.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (14,3,7,"Promuevo en el aula la identificación de problemas que pueden ser abordados con base en los conocimientos adquiridos por los estudiantes en el marco de los procesos formativos");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (15,3,7,"Me intereso en desarrollar procesos de pensamiento complejo y análisis crítico y motivo al estudiante para hacerlo.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (16,3,7,"Asisto a las actividades de investigación convocadas por la Escuela, la Facultad o la Institución.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (17,3,7,"Me intereso en promover la participación de mis estudiantes en proyectos de investigación de la Escuela, Facultad o la Institución.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (18,3,11,"Implemento acciones inmediatas para resolver una situación determinada, relacionada con mi labor.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (19,3,11,"Me intereso por aprender nuevos conocimientos relacionados con mi área de desempeño personal o profesional");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (20,3,11,"Realizo procesos de evaluación de mis desempeños para evidenciar mis aciertos y desaciertos con el fin de mejorar mis acciones personales y profesionales");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (21,3,12,"Asisto a cursos, seminarios, congresos o demás eventos académicos mínimo una vez al año con el fin de actualizar mi saber disciplinar");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (22,3,12,"Identifico e incorporo en mis acciones, las buenas prácticas apropiadas por los pares referentes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (23,3,12,"Adelanto planes de mejoramiento y fortalecimiento de mis competencias.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (24,3,12,"Me esfuerzo por mejorar o satisfacer un determinado criterio de excelencia a pesar de los obstáculos y los contratiempos.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (25,3,12,"Tengo un plan de formación posgradual que me permita cumplir con mis desempeños personales y profesionales");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (26,3,12,"Me capacito en temas relacionados con mis funciones de docencia, investigación, extensión e innovación.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (27,3,12,"Aprendo uno o varios idiomas diferentes al de mi dominio");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (28,3,8,"Promuevo la creatividad e innovación para la solución de problemas o necesidades propias de las áreas de formación");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (29,3,8,"Promuevo el desarrollo de actividades académicas y evaluativas para resolver necesidades del sector real en nuestras áreas de formación");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (30,3,9,"Logro motivar a mis estudiantes para realizar modificaciones a sus conductas y actitudes a nivel personal y profesional");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (31,3,9,"Me esfuerzo por trascender el ejercicio pedagógico de aula y virtual y preocuparme por el desarrollo integral de mis estudiantes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (32,3,10,"Adapto las metodologías de enseñanza, aprendizaje y evaluación, a las diferentes manifestaciones culturales encontradas en los estudiantes.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (33,3,10,"Acepto en los otros, las diferentes formas de ver y abordar el mundo, de vivir, de pensar y de concebir la vida.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (34,3,10,"Me adapto a grupos con expresiones culturales diferentes a la mía.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (35,3,10,"Modifico mis métodos y/o actitudes cuando he acordado hacer cambios con mis estudiantes o con la dirección de programa o de Escuela");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (36,3,10,"Mi actuar es congruente con los elementos de la cultura institucional, me siento reconocido e integrado. ");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (37,3,1,"Utilizo en clase un lenguaje sencillo y comprensible para el estudiante.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (38,3,1,"Mi lenguaje verbal y no verbal, facilita mi interacción con los estudiantes, docentes y administrativos de la institución.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (39,3,1,"Escucho y reflexiono las propuestas y opiniones de los estudiantes, respecto a las distintas actividades desarrolladas en clase y extraclase.");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (40,3,4,"Comprendo las diferentes situaciones de los estudiantes y los ayudo a tomar las mejores decisiones para su bienestar personal y profesional");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (41,3,5,"Trabajo en equipo compartiendo la responsabilidad del trabajo y gestiono acciones y proyectos con mi área u otras áreas institucionales para alcanzar las metas trazadas");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (42,3,5,"Promuevo el desarrollo de espacios de trabajo colaborativo en función de enriquecer mi quehacer disciplinar con diferentes áreas, escuelas y saberes institucionales o interinstitucionales");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (43,3,13,"Propongo, utilizo y aplico actividades formativas que involucran el uso de TIC, a los estudiantes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (44,3,13,"Mantengo actualizado el Sílabo con actividades que permiten apoyar el trabajo en clase como simuladores, herramientas virtuales y herramientas tecnológicas para  el aprendizaje autónomo y colaborativo de los estudiantes");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (45,3,13,"Tengo una actitud positiva hacia las TIC");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (46,3,14,"Realizo mi trabajo de manera organizada y presto atención a los detalles para garantizar altos estánderes de calidad");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (47,3,14,"Aprendo de mis errores y trato de buscar soluciones basadas en la experiencia buscando siempre mi mejor actuar");
insert into itemautoevaluacionpre(id,idUnidad,idDimension,descripcion) values
    (48,3,2,"Organizo mi trabajo y tareas asignadas de acuerdo con las metas esperadas, los plazos y los recursos, y, realizo seguimiento permanente de su cumplimiento");

create table autoevaluacionpre (
    id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    usuario varchar(20),    
    semestre int,
    puntaje1 int,
    puntaje2 int,
    puntaje3 int,
    puntaje4 int,
    puntaje5 int,
    puntaje6 int,
    puntaje7 int,
    puntaje8 int,
    puntaje9 int,
    puntaje10 int,
    puntaje11 int,
    puntaje12 int,
    puntaje13 int,
    puntaje14 int,
    puntaje15 int,
    puntaje16 int,
    puntaje17 int,
    puntaje18 int,
    puntaje19 int,
    puntaje20 int,
    puntaje21 int,
    puntaje22 int,
    puntaje23 int,
    puntaje24 int,
    puntaje25 int,
    puntaje26 int,
    puntaje27 int,
    puntaje28 int,
    puntaje29 int,
    puntaje30 int,
    puntaje31 int,
    puntaje32 int,
    puntaje33 int,
    puntaje34 int,
    puntaje35 int,
    puntaje36 int,
    puntaje37 int,
    puntaje38 int,
    puntaje39 int,
    puntaje40 int,
    puntaje41 int,
    puntaje42 int,
    puntaje43 int,
    puntaje44 int,
    puntaje45 int,
    puntaje46 int,
    puntaje47 int,
    puntaje48 int,
    promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre,promedio)
    );

 create table itemevaestvirtual (
    id int primary key, 
    idUnidad int,    
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)         
    );
 
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (1,2,2,"El mensaje de bienvenida enviado por el tutor incluye las recomendaciones generales del módulo y el logro de las competencias.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (2,2,1,"El tutor responde oportunamente mis inquietudes.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (3,2,1,"El tutor responde respetuosamente mis inquietudes.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (4,2,1,"El tutor publica oportunamente los horarios de encuentros sincrónicos.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (5,2,3,"El tutor responde de manera clara las inquietudes de todos los estudiantes.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (6,2,2,"El tutor da cumplimiento a los horarios establecidos para las tutorías sincrónicas.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (7,2,3,"Las sesiones sincrónicas se planean adecuadamente y suma valor agregado para mi aprendizaje.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (8,2,3,"El tutor ofrece retroalimentación oportuna a las distintas actividades.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (9,2,2,"El tutor envía recordatorios de las distintas actividades evaluativas.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (10,2,3,"El tutor da a conocer los criterios de evaluación para cada una de las actividades.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (11,2,3,"El tutor fomenta el uso de recursos  y  material bibliográfico adicionales que apoyan o complementan la comprensión de las temáticas del módulo");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (12,2,3,"El tutor utiliza distintas estrategias para facilitar el desarrollo de las competencias");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (13,2,3,"Las actividades académicas  (casos, proyectos, foros, talleres, trabajos, entre otros) son guiadas de manera clara y permanente por parte del tutor.");
insert into itemevaestvirtual(id,idUnidad,idDimension,descripcion) values
    (14,2,3,"El tutor logra despertar mi interés por profundizar en las temáticas del módulo.");
  
 create table evaluacionestvirtual (
     id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    semestre int,
    cohorte int,
    bloque int,
    modulo varchar(100),
    usuario varchar(20),
    numEncuestas int,
    puntaje1 float,
    puntaje2 float,
    puntaje3 float,
    puntaje4 float,
    puntaje5 float,
    puntaje6 float,
    puntaje7 float,
    puntaje8 float,
    puntaje9 float,
    puntaje10 float,
    puntaje11 float,
    puntaje12 float,
    puntaje13 float,
    puntaje14 float,
    promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (usuario,anyo,cohorte,bloque,modulo) 
    );

 create table impevaestvirtual(
    id bigint auto_increment primary key, 
    anysemcohblo varchar(50),
    anyo int,
    semestre int,
    cohorte int,
    bloque int,   
    modulo varchar(100),
    usuario varchar(20),
    numEncuestas int,
    puntaje1 float,
    puntaje2 float,
    puntaje3 float,
    puntaje4 float,
    puntaje5 float,
    puntaje6 float,
    puntaje7 float,
    puntaje8 float,
    puntaje9 float,
    puntaje10 float,
    puntaje11 float,
    puntaje12 float,
    puntaje13 float,
    puntaje14 float,
    promedio float,
    idUsuario int
);   
   
 create table itemevaestpresencial (
    id int primary key, 
    idUnidad int,    
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)        
    );
 
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (1,1,3,"El profesor expone claramente los temas de la asignatura, soluciona nuestras dudas y proporciona apoyo para nuestra comprensión.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (2,1,3,"El profesor consigue que estemos motivados e interesados en el transcurso del semestre.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (3,1,3,"Las clases y/o encuentros sincrónicos están bien preparados, organizados, estructurados y se cumplen puntualmente.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (4,1,3,"El profesor relaciona los conocimientos teóricos con la práctica y la realidad.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (5,1,3,"El profesor al inicio de la asignatura da a conocer y explica el sílabo.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (6,1,3,"El profesor realiza realimentación oportuna de los trabajos y evaluaciones realizadas.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (7,1,3,"Las evaluaciones realizadas por el profesor se basan en los temas establecidos en el silabo.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (8,1,3,"El profesor utiliza y fomenta el uso de recursos, material bibliográfico, equipo de apoyo y herramientas tecnológicas que facilitan la comprensión de los temas trabajados en clase o encuentros sincrónicos.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (9,1,3,"El profesor mantiene actualizado el Sílabo con actividades que permiten apoyar el trabajo en clase como simuladores, herramientas virtuales y herramientas tecnológicas para  motivar mi aprendizaje.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (10,1,7,"El profesor promueve actividades que estimulan mi deseo e  interés por la búsqueda de soluciones argumentadas y con fundamentos teóricos.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (11,1,7,"El profesor estimula mi capacidad para resolver situaciones relacionadas con los contenidos de mi programa.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (12,1,11,"El profesor implementa acciones inmediatas para resolver un conflicto académico o actitudinal.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (13,1,8,"El profesor promueve en sus clases la creatividad e innovación para la solución de problemas o necesidades de nuestra área de formación.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (14,1,8,"El profesor promueve el desarrollo de actividades académicas y evaluativas para resolver necesidades del sector real en nuestras áreas de formación.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (15,1,9,"El profesor con su desempeño logra motivar en mi el desarrollo de cambios y transformaciones a nivel personal y profesional.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (16,1,10,"Me siento reconocido, integrado y respetado en sus clases.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (17,1,1,"El profesor utiliza un lenguaje sencillo y comprensible, acorde con el tema de las clases.");
insert into itemevaestpresencial(id,idUnidad,idDimension,descripcion) values
    (18,1,4,"El profesor comprende las diferentes situaciones que se presentan y nos ayuda para tomar decisiones acertadas.");
    
create table evaluacionestpresencial (
    id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    semestre int,
    asignatura varchar(100),
    usuario varchar(20),
    numEncuestas int,
    puntaje1 float,
    puntaje2 float,
    puntaje3 float,
    puntaje4 float,
    puntaje5 float,
    puntaje6 float,
    puntaje7 float,
    puntaje8 float,
    puntaje9 float,
    puntaje10 float,
    puntaje11 float,
    puntaje12 float,
    puntaje13 float,
    puntaje14 float,
    puntaje15 float,
    puntaje16 float,
    puntaje17 float,
    puntaje18 float,
    promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre,numEncuestas,promedio,asignatura)
    );

 create table impevaestpresencial(
    id bigint auto_increment primary key,
    idTutor bigint,
    nomapeTutor varchar(60),
    anyosemestre varchar(6),
    asignatura varchar(100),
    usuario varchar(20),
    numEncuestas int,
    puntaje1 float,
    puntaje2 float,
    puntaje3 float,
    puntaje4 float,
    puntaje5 float,
    puntaje6 float,
    puntaje7 float,
    puntaje8 float,
    puntaje9 float,
    puntaje10 float,
    puntaje11 float,
    puntaje12 float,
    puntaje13 float,
    puntaje14 float,
    puntaje15 float,
    puntaje16 float,
    puntaje17 float,
    puntaje18 float,    
    promedio float,
    idUsuario int
);       

-- Evaluación Facultad Presencial

 create table itemevafacultadpre (
    id int primary key,
    idUnidad int,
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)      
    );
 
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (1,5,3,"El profesor hace seguimiento de los procesos de aprendizaje de los estudiantes y los informa a la dirección de la Escuela o Decanatura");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (2,5,3,"El profesor utiliza y  fomenta el uso de recursos, material bibliográfico, equipo de apoyo y herramientas tecnológicas que facilitan la comprensión de los temas de clase");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (3,5,7,"El profesor se interesa por promover la participación de los estudiantes proyectos de investigación de la Escuela, Faculta  o la Institución.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (4,5,11,"El profesor se interesa por aprender nuevos conocimientos relacionados con su área de desempeño profesional o personal");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (5,5,8,"El profesor promueve la gestión de proyectos o ideas transformadoras e innovadoras para el desarrollo del programa, la Escuela o la Facultad");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (6,5,9,"El profesor se esfuerza por trascender el ejercicio pedagógico de aula y virtual y preocuparse por el desarrollo integral de sus estudiantes");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (7,5,10,"El profesor escucha y acoge las instrucciones y observaciones del Director de Escuela o Decano de Facultad, respecto a su desempeño");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (8,5,10,"El profesor muestra congurencia entre su actuar y los elementos de la cultura organizacional POLI.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (9,5,1,"El profesor con su lenguaje verbal y no verbal, facilita la interacción con los estudiantes, docentes y administrativos de la institución.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (10,5,5,"El profesor trabaja en equipo compartiendo la responsabilidad del trabajo y gestiona acciones y poryectos con su área u otras áreas institucionales para alcanzar las metas trazadas");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (11,5,13,"El profesor tiene una actitud positiva hacia las TIC y las implementa en sus procesos académicos y administrativos");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (12,5,14,"El profesor realiza su trabajo de manera organizada y presta atención a los detalles para garantizar altos estánderes de calidad");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (13,7,3,"El profesor asiste a clase y/o encuentros sincrónicos puntualmente y cumple con el horario establecido");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (14,7,3,"El profesor propone actualizaciones de los sílabos de las asignaturas o módulos a su cargo. ");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (15,7,3,"El profesor reporta oportunamente las notas en el sistema y físicas a la dirección de la Escuela o Facultad.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (16,7,3,"El profesor participa activamente en los diferentes inducciones, comités o reuniones convocados por la Escuela, Decanatura y el Poli");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (17,7,7,"El profesor asiste a las actividades de investigación y proyección social convocadas por el Programa, la Escuela, la Facultad o la Institución.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (18,7,12,"El profesor cumple con los planes de mejoramiento derivados de los procesos de evaluación docente.");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (19,7,12,"El profesor desarrolla los cursos de formación ofrecidos en el Plan de Cualificación Institucional");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (20,7,15,"El profesor tiene llamados de atención o sanciones disciplinarias durante el último semestre");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (21,7,15,"El profesor tiene la hoja de vida actualizada de acuerdo con los respectivos soportes");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (22,9,6,"El profesor cumple con el horario previsto para el desarrollo de las actividades de la Labor Académica Docente");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (23,9,2,"El profesor organiza su trabajo y tareas asignadas de acuerdo con las metas esperadas, los plazos y los recursos");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (24,9,2,"El profesor realiza seguimiento permanente al cumplimiento de los objetivos previstos en la labor docente");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (25,9,2,"El profesor cumple con la entrega de los avances esperados en cada una de las fases previstas para el desarrollo de su labor docente");
insert into itemevafacultadpre(id,idUnidad,idDimension,descripcion) values
    (26,9,2,"El profesor cumple con la entrega final prevista de la labor docente asignada durante el periodo académico");

create table evaluacionfacultadpre (
    id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    semestre int,
    usuario varchar(20),
    puntaje1 int,puntaje2 int,puntaje3 int,puntaje4 int,puntaje5 int,puntaje6 int,puntaje7 int,
    puntaje8 int,puntaje9 int,puntaje10 int,puntaje11 int,puntaje12 int,puntaje13 int,puntaje14 int,
    puntaje15 int,puntaje16 int,puntaje17 int,puntaje18 int,puntaje19 int,puntaje20 int,puntaje21 int,
    puntaje22 int,puntaje23 int,
    promedioDoc float , promedioLabor float, promedioAcaAdm float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre)
    );

-- Evaluación RRHH Presencial

 create table itemevarrhhpre (
    id int primary key,
    idUnidad int,
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)      
    );

insert into itemevarrhhpre(id,idUnidad,idDimension,descripcion) values
    (1,7,12,"El profesor desarrolla los cursos de formación ofrecidos en el Plan de Cualificación Institucional");
insert into itemevarrhhpre(id,idUnidad,idDimension,descripcion) values
    (2,7,6,"El profesor tiene llamados de atención o sanciones disciplinarias durante el último semestre");
insert into itemevarrhhpre(id,idUnidad,idDimension,descripcion) values
    (3,7,6,"El profesor tiene la hoja de vida actualizada de acuerdo con los respectivos soportes");

create table evaluacionrrhh (
    id bigint auto_increment unique, 
    idTutor bigint,
    anyo int,
    semestre int,
    usuario varchar(20),
    puntaje1 int,puntaje2 int,puntaje3 int,promedio float,
    usuarioRegistro varchar(20),
    fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre)
    );
    
-- Evaluación Facultad Virtual

 create table itemevafacultadvir (
    id int primary key,
    idUnidad int,
    idDimension int,
    descripcion varchar(255),
    foreign key (idDimension) references dimension(id),
    foreign key (idUnidad) references unidad(id)      
    );
 
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (1,6,2,"El tutor cumple con la revisión y aceptación de el (los) módulo(s) durante la semana 0.  ");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (2,6,4,"El tutor ingresa con frecuencia, no mayor a 48 horas, a los módulos que están a su cargo.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (3,6,3,"El tutor califica y retroalimenta  los trabajos dentro de los tiempos establecidos.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (4,6,3,"El tutor maneja adecuadamente los recursos del módulo:  anuncios,  mensajes etc.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (5,6,3,"El tutor cumple con los encuentros sincrónicos programados acorde con la ruta tutorial.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (6,6,3,"El tutor  presenta reportes y retroalimentaciones de calidad para las actividades evaluativas ( bancos de preguntas PIF)");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (7,6,5,"El tutor contribuye y/o apoya al equipo de trabajo en las actividades requeridas (revisión aulas master, estrategia TAV, acompañamiento sincrónico, actualización de módulos, entre otros)");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (8,6,4,"El tutor entrega oportunamente los informes solicitados por la Coordinación Virtual, la Dirección de Escuela y/o la Decanatura.");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (9,6,4,"El tutor atiende los requerimientos que se reportan a través del CRM o de las alertas tempranas en relación con su actividad docente en el aula virtual");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (10,6,2,"El tutor participa en los planes de cualificación institucionales");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (11,6,15,"El tutor tiene llamados de atención o sanciones disciplinarias durante el último semestre");

insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (12,10,6,"El tutor cumple con el horario previsto para el desarrollo de las actividades de la Labor Académica Docente");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (13,10,2,"El tutor organiza su trabajo y tareas asignadas de acuerdo con las metas esperadas, los plazos y los recursos");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (14,10,2,"El tutor realiza seguimiento permanente al cumplimiento de los objetivos previstos en la labor docente");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (15,10,2,"El tutor cumple con la entrega de los avances esperados en cada una de las fases previstas para el desarrollo de su labor docente");
insert into itemevafacultadvir(id,idUnidad,idDimension,descripcion) values
    (16,10,2,"El tutor cumple con la entrega final prevista de la labor docente asignada durante el periodo académico");

create table evaluacionfacultadvir (
    id bigint auto_increment unique,  
    idTutor bigint,
    anyo int,
    cohorte int,
    bloque int,
    semestre int, 
    usuario varchar(20),
    puntaje1 int, puntaje2 int, puntaje3 int, puntaje4 int, puntaje5 int, puntaje6 int, puntaje7 int, puntaje8 int, 
    puntaje9 int, puntaje10 int, puntaje11 int, puntaje12 int, puntaje13 int, puntaje14 int, 
    promedioDoc float, promedioLabor float, promedioAcaAdm float,   
    usuarioRegistro varchar(20),   fechaRegistro timestamp,    
    primary key (idTutor,anyo,semestre,cohorte,bloque) 
    );
    
-- Insertar las facultades y escuelas 
INSERT INTO facultad (ID,NOMBRE) VALUES (1,'FACULTAD DE INGENIERIA DISEÑO E INNOVACION');
INSERT INTO facultad (ID,NOMBRE) VALUES (2,'FACULTAD DE NEGOCIOS GESTIÓN Y SOSTENIBILIDAD');
INSERT INTO facultad (ID,NOMBRE) VALUES (3,'FACULTAD DE SOCIEDAD, CULTURA Y CREATIVIDAD');
INSERT INTO facultad (ID,NOMBRE) VALUES (4,'GERENCIA DE SERVICIO Y PERMANENCIA');
INSERT INTO facultad (ID,NOMBRE) VALUES (5,'DIRECCION ASEGURAMIENTO DE LA CALIDAD');
INSERT INTO facultad (ID,NOMBRE) VALUES (6,'DIRECCION BIENESTAR UNIVERSITARIO Y HUELLA GRANCOLOMBIANA');
INSERT INTO facultad (ID,NOMBRE) VALUES (7,'DIRECCION DE CURRICULO PRESENCIAL Y VIRTUAL');
INSERT INTO facultad (ID,NOMBRE) VALUES (8,'DIRECCION DE GESTION DOCENTE');
INSERT INTO facultad (ID,NOMBRE) VALUES (9,'DIRECCION INVESTIGACION INNOVACION Y CREACION');

INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,3,'ESCUELA DE CIENCIAS BASICAS (ESCUELA CB)');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,4,'ESCUELA DE DISEÑO (ESCUELA D)');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,2,'ESCUELA DE OPTIMIZACION INFRAESTRUCTURA Y AUTOMATIZACION (ESCUELA OPINA)');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,1,'ESCUELA DE TECNOLOGIAS DE LA INFORMACION Y LAS COMUNICACIONES (ESCUELA TIC)');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (1,5,'FACULTAD INGENIERIA DISENO E INNOVACION');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (2,6,'ESCUELA DE ADMINISTRACION Y COMPETITIVIDAD');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (2,7,'ESCUELA DE CONTABILIDAD INTERNACIONAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (2,8,'ESCUELA DE NEGOCIOS Y DESARROLLO INTERNACIONAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,9,'ESCUELA COMUNICACIÓN ARTES VISUALES Y DIGITALES');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,10,'ESCUELA DE DERECHO Y GOBIERNO');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,11,'ESCUELA DE EDUCACION E INNOVACION');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,12,'ESCUELA DE ESTUDIOS EN PSICOLOGIA TALENTO HUMANO Y SOCIEDAD');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,13,'ESCUELA DE MARKETING Y BRANDING');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,14,'ESCUELA DE NEGOCIOS Y DESARROLLO INTERNACIONAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,15,'ESCUELA DERECHO Y GOBIERNO');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (3,16,'FACULTAD SOCIEDAD CULTURA Y CREATIVIDAD');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (4,17,'SERVICIOS Y PERMANENCIA CENTRO-ORIENTE');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (4,18,'SERVICIOS Y PERMANENCIA NORTE');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (4,19,'SERVICIOS Y PERMANENCIA OCCIDENTE-SUR');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (5,20,'ASEGURAMIENTO DE LA CALIDAD');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (6,21,'BIENESTAR UNIVERSITARIO');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (7,22,'DESARROLLO VIRTUAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (7,23,'LABORATORIO VIRTUAL');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (7,24,'PRODUCCION DE CONTENIDOS');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (8,25,'GESTION DOCENTE');
INSERT INTO escuela (IDFACULTAD,ID,NOMBRE) VALUES (9,26,'INVESTIGACION INNOVACION Y CREACION');

INSERT INTO usuario (USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL,CLAVE) VALUES ('admin','Manuel','Báez','0','0','0','d033e22ae348aeb5660fc2140aec35850c4da997');
INSERT INTO usuario (USUARIO,NOMBRE,APELLIDO,IDFACULTAD,IDESCUELA,IDROL,CLAVE) VALUES ('system','Manuel','Báez','0','0','0','317f1e761f2faa8da781a4762b9dcc2c5cad209a');

use evadoc;
