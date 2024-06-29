-- 1. Write a SQL query to fetch “FIRST_NAME” from the Student table in upper case and use ALIAS name as STUDENT_NAME.
        select upper(FIRST_NAME) as student_Name from student;

-- 2. Write a SQL query to fetch unique values of MAJOR Subjects from Student table.
        select distinct Major from Student group by MAJOR;
        
-- 3. Write a SQL query to print the first 3 characters of FIRST_NAME from Student table.
          select substr(first_name, 1, 3) as 3_Characters from student;
          
-- 4. Write a SQL query to find the position of alphabet (‘a’) int the first name column ‘Shivansh’ from Student table.
          select instr(first_name, 'a') from student where FIRST_NAME = 'shivansh';
          
-- 5. Write a SQL query that fetches the unique values of MAJOR Subjects from Student table and print its length.
          SELECT DISTINCT MAJOR, LENGTH(MAJOR) FROM Student;    
          
-- 6. Write a SQL query to print FIRST_NAME from the Student table after replacing ‘a’ with ‘A’.
		SELECT REPLACE(FIRST_NAME, 'a', 'A') FROM Student;
        
-- 7. Write a SQL query to print the FIRST_NAME and LAST_NAME from Student table into single column COMPLETE_NAME.
	    select concat(first_name," ", Last_name) as Full_Name from student;
 
 -- 8. Write a SQL query to print all Student details from Student table order by FIRST_NAME Ascending and MAJOR Subject descending .
        select * from student order by FIRST_NAME asc , MAJOR desc ;
        
-- 9. Write a SQL query to print details of the Students with the FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.
	   select * from student where FIRST_NAME in ('prem' , 'shivansh');
       
-- 10. Write a SQL query to print details of the Students excluding FIRST_NAME as ‘Prem’ and ‘Shivansh’ from Student table.
	     select * from student where FIRST_NAME not in ('prem' , 'shivansh');
    
-- 11. Write a SQL query to print details of the Students whose FIRST_NAME ends with ‘a’.
		select * from student where FIRST_NAME like'%a';
        
-- 12. Write an SQL query to print details of the Students whose FIRST_NAME ends with ‘a’ and contains six alphabets.
         select * from student where FIRST_NAME like '____a';
         
-- 13. Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99.
         select * from student where GPA between 9.00 and 9.99;
         
-- 14. Write an SQL query to fetch the count of Students having Major Subject ‘Computer Science’.
          select major, count(student_id) from student where  MAJOR = 'computer science';
          
-- 15. Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5.
          select concat(first_name," ", Last_name) as Full_Name, gpa from student where GPA between 8.5 and 9.5; 

-- 16. Write an SQL query to fetch the no. of Students for each MAJOR subject in the descending order.
          select major, count(major) as counting from student group by major order by counting asc;
          
-- 17. Display the details of students who have received scholarships, including their names, scholarship amounts, and scholarship dates.
          select student.STUDENT_ID,student.FIRST_NAME, student.LAST_NAME,
              scholarship.SCHOLARSHIP_AMOUNT, scholarship.SCHOLARSHIP_DATE 
                 from student inner join scholarship
                    on student.STUDENT_ID = scholarship.STUDENT_REF_ID;

-- 18. Write an SQL query to show only odd rows from Student table.
          select * from student where STUDENT_ID % 2 !=0;

-- 19. Write an SQL query to show only even rows from Student table.
		  select * from student where STUDENT_ID % 2 =0;
          
-- 20. List all students and their scholarship amounts if they have received any. 
            -- If a student has not received a scholarship, display NULL for the scholarship details.
		 select student.STUDENT_ID,student.FIRST_NAME, student.LAST_NAME,
              scholarship.SCHOLARSHIP_AMOUNT, scholarship.SCHOLARSHIP_DATE 
                 from student left join scholarship
                    on student.STUDENT_ID = scholarship.STUDENT_REF_ID;
                    
-- 21. Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.
         select * from student order by GPA desc limit 5;
         
-- 22. Write an SQL query to determine the nth (say n=5) highest GPA from a table.
          select * from student order by GPA desc limit 5,1;
          
-- 23. Write an SQL query to determine the 5th highest GPA without using LIMIT keyword.
        WITH RankedGPAs AS (
    SELECT GPA, ROW_NUMBER() OVER (ORDER BY GPA DESC) AS rs
    FROM students
)
SELECT GPA
FROM student
WHERE rs = 5;

  SELECT * FROM Student s1 
WHERE 4 = (
    SELECT COUNT(DISTINCT (s2.GPA)) 
    FROM Student s2
    WHERE s2.GPA >= s1.GPA
);

-- 24. Write an SQL query to fetch the list of Students with the same GPA.
          SELECT s1.* FROM Student s1, Student s2 WHERE s1.GPA = s2.GPA AND s1.Student_id != s2.Student_id;
          
-- 25. Write an SQL query to show the second highest GPA from a Student table using sub-query.
           select * from 
           (
           select * ,row_number() over(order by gpa desc) as ranking from student
           ) t1
             where t1.ranking = 2;

-- 26. Write an SQL query to show one row twice in results from a table.
           SELECT * FROM Student 
             UNION ALL
                  SELECT * FROM Student ORDER BY STUDENT_ID;
                  
-- 27. Write an SQL query to list STUDENT_ID who does not get Scholarship.
          SELECT STUDENT_ID FROM Student WHERE STUDENT_ID NOT IN (SELECT STUDENT_REF_ID FROM Scholarship);
		
-- 28. Write an SQL query to fetch the first 50% records from a table.
	       SELECT * FROM Student WHERE STUDENT_ID <= (SELECT COUNT(STUDENT_ID)/2 FROM Student);                       -- XXXX
           
-- 29. Write an SQL query to fetch the MAJOR subject that have less than 4 people in it.
           select major, count(major) from student group by major having count(major) < 4;
       
-- 30. Write an SQL query to show all MAJOR subject along with the number of people in there.
           SELECT MAJOR, COUNT(MAJOR) AS ALL_MAJOR FROM Student GROUP BY MAJOR; 
     
-- 31. Write an SQL query to show the last record from a table.
	       select * from student  order by  STUDENT_ID desc  limit 1;
           
-- 32. Write an SQL query to fetch the first row of a table.
             select * from student where student_id= (select min(student_id) from student);
             
-- 33.Write an SQL query to fetch the last five records from a table. 
	select * from (
                  select * from student  order by  STUDENT_ID desc  limit 5
                 ) as subQuery order by student_id ; 
        
-- 34. Write an SQL query to fetch three max GPA from a table using co-related subquery.       XXXXXXX
               select distinct(GPA) from student order by gpa desc limit 3;    -- OR
               
-- 35. Write an SQL query to fetch three min GPA from a table using co-related subquery.
			   select distinct(GPA) from student order by gpa asc limit 3;     -- OR
     
-- 36. Write an SQL query to fetch nth max GPA from a table.
SELECT DISTINCT GPA FROM Student S1 
WHERE count >= (SELECT COUNT(DISTINCT GPA) FROM Student S2 WHERE S1.GPA <= S2.GPA) ORDER BY S1.GPA DESC;

-- 37. Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects.
        select major, max(gpa) from student group by major;
        
-- 38. Write an SQL query to fetch the names of Students who has highest GPA.
          select concat(first_name, " ", Last_name) as Name, GPA from student where GPA = (
                select max(gpa)from student
                         )  ;
                         
-- 39. Write an SQL query to show the current date and time.
          select now();       -- Date and time
          select curdate() ;    -- current date
          
-- 40.  Write a query to create a new table which consists of data and structure copied from the other table
         --  (say Student) or clone the table named Student.
         create table clone_table as select * from student;
		 select * from clone_table;

-- 41. Write an SQL query to update the GPA of all the students in ‘Computer Science’ MAJOR subject to 7.5.
          update student set gpa="7.5" where major="Computer Science";
          select * from student;
          
-- 42. Write an SQL query to find the average GPA for each major.
           select major, avg(GPA) from student group by MAJOR;

-- 43. Write an SQL query to show the top 3 students with the highest GPA.
           SELECT * FROM Student ORDER BY GPA DESC LIMIT 3;

-- 44. Write an SQL query to find the number of students in each major who have a GPA greater than 7.5.
          SELECT MAJOR, COUNT(STUDENT_ID) AS HIGH_GPA_COUNT FROM Student WHERE GPA > 3.5 GROUP BY MAJOR;
          
-- 45. Write an SQL query to find the students who have the same GPA as ‘Shivansh Mahajan’.
            SELECT * FROM Student WHERE GPA = (SELECT GPA FROM Student WHERE FIRST_NAME = 'Shivansh' 
                AND LAST_NAME = 'Mahajan');



        




