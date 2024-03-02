# kamssa
A web-based system for Kampala Integrated Secondary Schools Examination Bureau

CREATE DEFINER=`root`@`localhost` PROCEDURE `kamssa`.`CountGradesPerSubject`(school_id INTEGER)

begin

    -- DECLARE school_id INTEGER;

  -- Temporary table to store the result

  CREATE TEMPORARY TABLE temp_result (

    subject_name VARCHAR(255),

    grade VARCHAR(255),

    count INT

  );

 

  -- Loop through subjects

  INSERT INTO temp_result (subject_name, grade, count)

  SELECT sub.subject_name, sub.grade, COUNT(*)

  FROM (

    SELECT s.name AS subject_name,

           CASE

             WHEN AVG(m.marks) >= 80 THEN 'D1'

             WHEN AVG(m.marks) >= 75 THEN 'D2'

             WHEN AVG(m.marks) >= 66 THEN 'C3'

             WHEN AVG(m.marks) >= 60 THEN 'C4'

             WHEN AVG(m.marks) >= 55 THEN 'C5'

             WHEN AVG(m.marks) >= 50 THEN 'C6'

             WHEN AVG(m.marks) >= 45 THEN 'P7'

             WHEN AVG(m.marks) >= 35 THEN 'P8'

             ELSE 'F9'

           END AS grade

    FROM o_level_subejcts s

    INNER JOIN o_level_subejcts_papers sp ON s.id = sp.subject_id

    INNER JOIN o_level_student_marks m ON sp.id = m.subject_paper_id

    inner join o_level_students st on m.student_id = st.id

    where st.school_id = school_id

    GROUP BY s.id, m.student_id

  ) AS sub

  GROUP BY sub.subject_name, sub.grade;

 

  -- Select the final result

  SELECT * FROM temp_result;

 

  -- Drop the temporary table

  DROP TABLE temp_result;

END

CREATE PROCEDURE kamssa.a_level_test(school_id INTEGER)

begin

    

    SELECT SUBJECTS.id, SUBJECTS.name as subject_name, GROUP_CONCAT(MARKS.marks SEPARATOR ',') AS paper_scores,

    PAPERS.subject_id, SUBJECTS.is_core, MARKS.student_id as student_id,''

    FROM a_level_student_marks AS MARKS

    JOIN a_level_subejcts_papers AS PAPERS ON PAPERS.id = MARKS.subject_paper_id

    JOIN a_level_subejcts AS SUBJECTS ON SUBJECTS.id = PAPERS.subject_id

    inner join a_level_students as st on st.id = MARKS.student_id

    where st.school_id = school_id

    GROUP BY PAPERS.subject_id,MARKS.student_id;

END


