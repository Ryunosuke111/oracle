


SELECT * FROM  employees;

SELECT * FORM employees ORDER BY first_name, last_name;

SELECT * FORM employees WHERE first_name LIKE 'K%';

SELECT * FROM employees WHERE first_name LIKE 'K%'  ORDER BY first_name; 

SELECT department_id, COUNT(employee_id) FROM employees GROUP BY department_id;

SELECT max(count(employee_id))as empleados FROM employees GROUP BY department_id ;

SELECT employees.employee_id, employees.first_name, departments.department_name FROM employees 
INNER JOIN departments ON departments.department_id = employees.employee_id;

SELECT employees.employee_id, employees.first_name, employees.salary FROM employees 
INNER JOIN departments ON departments.department_name = 'Sales';

SELECT employees.employee_id, employees.first_name, employees.salary FROM employees 
INNER JOIN departments ON departments.department_name = 'Sales' ORDER BY salary desc;

/*Como los trabajos no tienen grado salarial asignado, agrego un campo a jobs
 definiendo salary_grade tipo number y mayor que 0*/
ALTER TABLE jobs ADD salary_grade NUMBER(2) CHECK (salary_grade>0);

/*Nota: La asignación de los grados salariales que hare son ajustados al máximo
 salario que una persona puede ganar en su cargo. por ello al grado salarial 
 2021 americano le resté 14000.*/

--ASIGNACIÓN DE GRADOS SALARIALES
 UPDATE jobs SET salary_grade=1  WHERE max_salary < 5738;
 UPDATE jobs SET salary_grade=2  WHERE max_salary BETWEEN 5738 AND 8194;
 UPDATE jobs SET salary_grade=3  WHERE max_salary BETWEEN 8194 AND 10216;
 UPDATE jobs SET salary_grade=4  WHERE max_salary BETWEEN 10216 AND 13184;
 UPDATE jobs SET salary_grade=5  WHERE max_salary BETWEEN 13184 AND 16414;
 UPDATE jobs SET salary_grade=6  WHERE max_salary BETWEEN 16414 AND 19903;
 UPDATE jobs SET salary_grade=7  WHERE max_salary BETWEEN 19903 AND 23674;
 UPDATE jobs SET salary_grade=8  WHERE max_salary BETWEEN 23674 AND 27723;
 UPDATE jobs SET salary_grade=9  WHERE max_salary BETWEEN 27723 AND 32083;
 UPDATE jobs SET salary_grade=10 WHERE max_salary BETWEEN 32083 AND 36748;
 UPDATE jobs SET salary_grade=11 WHERE max_salary BETWEEN 36748 AND 41756;
 UPDATE jobs SET salary_grade=12 WHERE max_salary BETWEEN 41756 AND 52829;
 UPDATE jobs SET salary_grade=13 WHERE max_salary BETWEEN 52829 AND 65468;
 UPDATE jobs SET salary_grade=14 WHERE max_salary BETWEEN 65468 AND 79907;
 UPDATE jobs SET salary_grade=15 WHERE max_salary BETWEEN 79907 AND 96460;

SELECT employees.employee_id, employees.first_name, employees.salary, jobs.salary_grade FROM employees
INNER JOIN jobs ON jobs.job_id = employees.job_id;

SELECT employees.employee_id, employees.first_name, jobs.salary_grade FROM employees
INNER JOIN jobs ON jobs.job_id = employees.job_id and (jobs.salary_grade = 2 or jobs.salary_grade = 4 or jobs.salary_grade = 5);

SELECT department_id, avg(salary) FROM employees GROUP BY department_id ORDER BY avg(salary) desc;

SELECT department_id, COUNT(employee_id) FROM employees GROUP BY department_id 
HAVING COUNT(employee_id) = (SELECT max(count(employee_id)) FROM employees GROUP BY department_id) ;

SELECT employees.manager_id, employees.employee_id, employees.first_name, departments.department_name FROM employees
INNER JOIN departments ON departments.manager_id = employees.manager_id;

SELECT DISTINCT departments.department_id, departments.department_name FROM departments 
INNER JOIN employees ON employees.department_id = departments.department_id and employees.salary > 3000;

SELECT DISTINCT d.department_id, d.department_name FROM departments d 
INNER JOIN (SELECT department_id as departamento FROM employees GROUP BY department_id HAVING COUNT(employee_id)>2) ON d.department_id=departamento
INNER JOIN employees e ON d.department_id=e.department_id WHERE e.salary>2500; 







