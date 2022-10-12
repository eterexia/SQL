CREATE TABLE Course (
    CourseName VARCHAR(255),
    SectionNumber INT,
    Coursetype VARCHAR(255)
);

INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('MATH101', 1, 'Inperson');
INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('MATH101', 2, 'Inperson');
INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('MATH101', 3, 'Inperson');
INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('MATH101', 4, 'Online');

INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('SOC 201', 1, 'Inperson');
INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('SOC 201', 2, 'Inperson');

INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('ENGL 101', 1, 'Online');
INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('ENGL 101', 2, 'Online');
INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('ENGL 101', 3, 'Inperson');

INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('PHY 101', 1, 'Online');
INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('PHY 101', 2, 'Online');
INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('PHY 101', 3, 'Online');
INSERT INTO Course (CourseName, SectionNumber, Coursetype)
VALUES ('PHY 101', 4, 'Online');

SELECT * FROM Course;



SELECT SUM (CASE WHEN Inperson > 0 AND Online > 0 THEN 1 ELSE 0 END) as bothtype,
       SUM (CASE WHEN Inperson > 0 AND Online = 0 THEN 1 ELSE 0 END) as inpersononly,
       SUM (CASE WHEN Inperson = 0 AND Online > 0 THEN 1 ELSE 0 END) as onlineonly
FROM (
  SELECT Coursename,
         SUM(CASE WHEN Coursetype='Inperson' THEN 1 ELSE 0 END) as InPerson,
         SUM(CASE WHEN Coursetype='Online' THEN 1 ELSE 0 END) as Online
  FROM Course
  GROUP BY Coursename
) tot



		
SELECT coursename,
	SUM(CASE WHEN coursetype IN ('Inperson') AND coursetype IN ('Online') THEN 1 ELSE 0 END) AS bothtype,
	SUM(CASE WHEN coursetype IN ('Online')  AND coursetype NOT IN ('Inperson') THEN 1 ELSE 0 END) AS Onlineonly,
	SUM(CASE WHEN coursetype NOT IN ('online') AND coursetype IN ('Inperson') THEN 1 ELSE 0 END) AS Inpersononly
From Course
GROUP BY Coursename

SELECT COUNT (CASE coursetype WHEN 'Inperson' THEN 1 ELSE 0 END) AS Inpersononly
From Course

SELECT Coursename, COUNT (CASE WHEN coursetype = 'Inperson' THEN 1 ELSE 0 END) AS Inpersononly
FROM Course
GROUP BY Coursename