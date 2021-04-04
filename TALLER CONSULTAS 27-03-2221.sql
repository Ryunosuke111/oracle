
# A  MOSTRAMOS TODOS LOS DATOS DE LA TABLA EMPLOYEES

SELECT * FROM  employees;

# B MOSTRAMOS TODOS LOS DATOS DE LA TABLA EMPLOYEES ORDENADOS POR EL NOMBRE

SELECT * FROM employees ORDER BY first_name, last_name;

# C MOSTRAMOS TODOS LOS DATOS DE LA TABLA EMPLOYEES DONDE LOS NOMBRES EMPIECEN POR K

SELECT * FROM employees WHERE first_name LIKE 'K%';

# D B MOSTRAMOS TODOS LOS DATOS DE LA TABLA EMPLOYEES DONDE LOS NOMBRES EMPIECEN POR K ORDENADOS POR NOMBRE

SELECT * FROM employees WHERE first_name LIKE 'K%'  ORDER BY first_name; 

# E mostramos el codigo del departamento con la cantidad de empleados que posee

SELECT department_id, COUNT(department_id) FROM employees GROUP BY department_id;

# F mostramos el codigo del departamento con mas empleados

SELECT department_id, max(count(department_id))as empleados FROM employees GROUP BY department_id ;

# G mostramos el codigo del empleado el nombre del empleado y el nombre del departamento donde trabaja

SELECT employees.employee_id, employees.first_name, departments.department_name FROM employees 
INNER JOIN departments ON departments.department_id = employees.department_id;

# H mostramos el codigo  no y el salario del empleado que trabaja en el departamento Sales

SELECT employees.employee_id, employees.first_name, employees.salary FROM employees 
INNER JOIN departments ON departments.department_name = 'Sales';

# I mostramos el codigo  no y el salario del empleado que trabaja en el departamento Sales y lo ordenamos por salario de forma descendente

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

 # J mostramos el codigo nombre y el grado salarial de cada empleado

SELECT employees.employee_id, employees.first_name, employees.salary, jobs.salary_grade FROM employees
INNER JOIN jobs ON jobs.job_id = employees.job_id;

# K mostramos el codigo nombre y el grado salarial de cada empleado en los cuales el grado salarial sea de 2, 4 y 5

SELECT employees.employee_id, employees.first_name, jobs.salary_grade FROM employees
INNER JOIN jobs ON jobs.job_id = employees.job_id and (jobs.salary_grade = 2 or jobs.salary_grade = 4 or jobs.salary_grade = 5);

# L mostramos el codigo del departamento con el promedio salarial ordenado de forma descendente agrupado por codigo de departamento

SELECT department_id, avg(salary) FROM employees GROUP BY department_id ORDER BY avg(salary) desc;

# M mostramos el nombre del departamento con el promedio salarial ordenado de forma descendente

SELECT departments.department_name FROM departments 
INNER JOIN (SELECT department_id as departamento FROM employees GROUP BY department_id ORDER BY avg(salary) desc) ON departments.department_id = departamento;

# N motramos el codigo del departamento que tiene mas empleados

SELECT department_id, COUNT(employee_id) FROM employees GROUP BY department_id 
HAVING COUNT(employee_id) = (SELECT max(count(employee_id)) FROM employees GROUP BY department_id) ;

# O mostramos el codigo el nombre de cada jefe y el nolmbre del departamento donde labora

 employees.employee_id, employees.first_name, departments.department_name FROM employees , departments 
 WHERE employees.department_id = departments.department_id AND  employees.employee_id IN
 (SELECT DISTINCT jefes.manager_id FROM employees jefes);

# P mostramos los nombres de cada empleado junto con el grado salarial del empleado, el grado salarial del jefe y la diferencia de grado salarial existente con su jefe

SELECT DISTINCT employees.employee_id, employees.first_name, jefe_grad,jobs.salary_grade, jefe_grad - jobs.salary_grade FROM employees 
INNER JOIN jobs ON employees.job_id = jobs.job_id
INNER JOIN (SELECT employees.employee_id as jefe_id, employees.department_id as jefe_dep, employees.manager_id as jefe_mana, jobs.salary_grade as jefe_grad 
FROM employees 
INNER JOIN jobs ON employees.job_id = jobs.job_id
INNER JOIN departments ON departments.manager_id = employees.manager_id) ON employees.employee_id <> jefe_id
WHERE employees.department_id = jefe_dep and employees.manager_id <> jefe_mana ORDER BY employees.employee_id asc;

# Q mostramos el codigo del departamento y el nombre en donde como minimo hay un empleado que gana mas de 3000

SELECT DISTINCT departments.department_id, departments.department_name FROM departments 
INNER JOIN employees ON employees.department_id = departments.department_id and employees.salary > 3000;

# R mostramos el codigo del departamento y nombre donde hay como minimo 2 empleados que ganan mas 2500

SELECT DISTINCT departments.department_id, departments.department_name FROM departments  
INNER JOIN (SELECT department_id as departamento FROM employees GROUP BY department_id HAVING COUNT(employee_id)>2) ON departments.department_id=departamento
INNER JOIN employees  ON departments.department_id=employees.department_id WHERE employees.salary>2500;

# S mostramos el codigo y nombre de los empleados que ganan mas que su jefe

SELECT DISTINCT employees.employee_id, employees.first_name FROM employees  
INNER JOIN (SELECT e.employee_id as jefe_id, e.department_id as jefe_dep, e.salary as jefe_salary, e.manager_id as jefe_man
FROM employees e, departments d
WHERE jefe.department_id = d.department_id AND  jefe.employee_id IN (SELECT DISTINCT jefes.manager_id FROM employees jefes))
ON employees.employee_id <> jefe_id
WHERE employees.department_id = jefe_dep AND employees.salary > jefe_salary AND employees.manager_id <>jefe_man ORDER BY employees.employee_id;

# t mostramos el codigo y nombre del departamento donde almenos un empleado de ese deartamento gana mas de 3000 y mostramos la cuantos empleados

SELECT departments.department_id,departments.department_name, COUNT(employees.employee_id) FROM employees, departments
WHERE departments.department_id = employees.department_id and employees.salary > 3000 
GROUP BY departments.department_id, departments.department_name ;

# u mostramos el codigo y el nombre de los departamentos donde todos sus empleados ganan mas de 3000

SELECT departments.department_id, departments.department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id
GROUP BY departments.department_id, departments.department_name
HAVING COUNT(departments.department_id)=
(SELECT COUNT(*) FROM employees emp WHERE emp.department_id = departments.department_id AND emp.salary > 3000);

#v mostramos el codigo de los departamentos en donde todos los empleados ganan mas 3000 y almenos un jefe gana mas 5000

SELECT d.department_id, d.department_name FROM employees e1, employees e2, departments d 
WHERE e1.department_id = d.department_id AND e1.manager_id = e2.employee_id AND d.department_id
IN (SELECT DISTINCT scm,department_id FROM employees scm WHERE scm.salary > 5000 AND scm.employee_id
IN (SELECT DISTINCT ssce.manager_id FROM employees ssce))
GROUP BY d.department_id, d.department_name HAVING COUNT(d.department_id) = 
(SELECT COUNT(*) FROM employees sce WHERE sce.department_id = d.department_id AND sce.salary > 3000);

#W mostramos todos los datos de la tabla empleados donde no se encuentre empleados de codigo de departamento 80 y 
#que el salario de sus salarios sean mayor que los empleados del departamento 80

SELECT * FROM employees WHERE department_id <> 80 AND salary > ANY 
(SELECT e.salary FROM employees e WHERE e.department_id = 80 ORDER BY department_id);










