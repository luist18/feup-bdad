/* Students */
INSERT INTO student values(100, 'João');
INSERT INTO student values(110, 'Manuel');
INSERT INTO student values(120, 'Rui');
INSERT INTO student values(130, 'Abel');
INSERT INTO student values(140, 'Fernando');
INSERT INTO student values(150, 'Ismael');

/* Profs */
INSERT INTO prof values('ECO', 'Eugénio');
INSERT INTO prof values('FNF', 'Fernando');
INSERT INTO prof values('JLS', 'João');
INSERT INTO prof values('RR7', 'Ronaldo Rossetti 7');

/* Course units */
/* These exercises must have been done recently since they use the old agreement on spelling :'/ */
INSERT INTO course_unit values('TS1', 'Teoria dos Sistemas I', 'IS', 'FNF');
INSERT INTO course_unit values('BD', 'Bases de Dados', 'IS', 'ECO');
INSERT INTO course_unit values('EIA', 'Estruturas de Informação e Algoritmos', 'IS', 'ECO');
INSERT INTO course_unit values('EP', 'Electrónica de Potência', 'AC', 'JLS');
INSERT INTO course_unit values('IE', 'Instalações Eléctricas', 'AC', 'JLS');

/* Tests */
INSERT INTO test values(100, 'TS1', '92-02-11', 8);
INSERT INTO test values(100, 'TS1', '93-02-02', 11);
INSERT INTO test values(100, 'BD', '93-02-04', 17);
INSERT INTO test values(100, 'EIA', '92-01-29', 16);
INSERT INTO test values(100, 'EIA', '93-02-12', 13);
INSERT INTO test values(110, 'EP', '92-01-30', 12);
INSERT INTO test values(110, 'IE', '92-02-05', 10);
INSERT INTO test values(110, 'IE', '93-02-01', 14);
INSERT INTO test values(120, 'TS1', '93-01-31', 15);
INSERT INTO test values(120, 'EP', '93-02-04', 13);
INSERT INTO test values(130, 'BD', '93-02-04', 12);
INSERT INTO test values(130, 'EIA', '93-02-24', 7);
INSERT INTO test values(130, 'TS1', '92-02-11', 8);
INSERT INTO test values(140, 'TS1', '93-01-31', 10);
INSERT INTO test values(140, 'TS1', '92-02-11', 13);
INSERT INTO test values(140, 'EIA', '93-02-02', 11);
INSERT INTO test values(150, 'TS1', '92-02-11', 10);
INSERT INTO test values(150, 'EP', '93-02-02', 11);
INSERT INTO test values(150, 'BD', '93-02-04', 17);
INSERT INTO test values(150, 'EIA', '92-01-29', 16);
INSERT INTO test values(150, 'IE', '93-02-02', 13);