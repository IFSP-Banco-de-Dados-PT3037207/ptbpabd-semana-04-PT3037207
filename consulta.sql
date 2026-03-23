--1
SELECT 
    I.ID, 
    I.name, 
    COUNT(T.course_id) AS numero_secoes
FROM 
    instructor I
LEFT OUTER JOIN 
    teaches T ON I.ID = T.ID
GROUP BY 
    I.ID, I.name;

--2
SELECT 
    I.ID, 
    I.name, 
    (SELECT COUNT(T.course_id) 
     FROM teaches T 
     WHERE T.ID = I.ID) AS numero_secoes
FROM 
    instructor I;

--3
SELECT 
    S.course_id, 
    S.sec_id, 
    S.semester, 
    S.year, 
    ISNULL(I.name, '-') AS nome_instrutor
FROM 
    section S
LEFT OUTER JOIN 
    teaches T ON S.course_id = T.course_id 
              AND S.sec_id = T.sec_id 
              AND S.semester = T.semester 
              AND S.year = T.year
LEFT OUTER JOIN 
    instructor I ON T.ID = I.ID
WHERE 
    S.semester = 'Spring' 
    AND S.year = 2010;

--4
WITH grade_points (grade, points) AS (
    SELECT 'A+', 4.0 UNION ALL
    SELECT 'A',  3.7 UNION ALL
    SELECT 'A-', 3.3 UNION ALL -- Ajustei para 3.3 conforme sua imagem
    SELECT 'B+', 3.0 UNION ALL -- Ajustei para 3.0 conforme sua imagem
    SELECT 'B',  2.7 UNION ALL
    SELECT 'B-', 2.3 UNION ALL -- Ajustei para 2.3 conforme sua imagem
    SELECT 'C+', 2.0 UNION ALL -- Ajustei para 2.0 conforme sua imagem
    SELECT 'C',  1.7 UNION ALL
    SELECT 'C-', 1.3            -- Ajustei para 1.3 conforme sua imagem
)
SELECT 
    S.ID, 
    S.name, 
    C.title, 
    S.dept_name, 
    T.grade, 
    GP.points, 
    C.credits,
    (C.credits * GP.points) AS [Pontos totais] -- O nome entre colchetes permite espaços
FROM 
    student S
JOIN 
    takes T ON S.ID = T.ID
JOIN 
    course C ON T.course_id = C.course_id
JOIN 
    grade_points GP ON T.grade = GP.grade;

--5
GO
CREATE VIEW coeficiente_rendimento AS
WITH grade_points (grade, points) AS (
    SELECT 'A+', 4.0 UNION ALL
    SELECT 'A',  3.7 UNION ALL
    SELECT 'A-', 3.3 UNION ALL
    SELECT 'B+', 3.0 UNION ALL
    SELECT 'B',  2.7 UNION ALL
    SELECT 'B-', 2.3 UNION ALL
    SELECT 'C+', 2.0 UNION ALL
    SELECT 'C',  1.7 UNION ALL
    SELECT 'C-', 1.3
)
SELECT 
    S.ID, 
    S.name, 
    C.title, 
    S.dept_name, 
    T.grade, 
    GP.points, 
    C.credits,
    (C.credits * GP.points) AS [Pontos totais]
FROM 
    student S
JOIN 
    takes T ON S.ID = T.ID
JOIN 
    course C ON T.course_id = C.course_id
JOIN 
    grade_points GP ON T.grade = GP.grade;
GO
SELECT * FROM coeficiente_rendimento 