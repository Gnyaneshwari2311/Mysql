BANKING SCENARIO – QUESTIONS

Basic + WHERE + Operators (1–15)


1.Retrieve all accounts with balance greater than 20,000.
--- select*
    from accounts
    where balance>20000;

2.Find customers who live in Chennai.
---select*
   from customers
   where city='Chennai';

3.Display accounts with balance between 20,000 and 50,000.
---select*
   from accounts
   where balance between 20000 and 50000;

4.Find customers whose names start with 'J'.
---select*
   from customers
   where name like'j%';

5.Retrieve accounts of type 'Savings' or 'Current'.
---select*
   from accounts
   where account_type in('Savings' , 'Current');

6.Display accounts that are not 'Savings'.
---select*
   from accounts
   where account_type not like 'Savings';

7.Find customers whose names contain the letter 'a'.
---select*
   from customers
   where name like '%a%';

8.Retrieve accounts with balance less than or equal to 30,000.
---select*
   from accounts
   where balance <=30000;

9.Find customers who are not from Madurai.
---select*
   from customers
   where city not like 'Madurai';
   or
---select*
   from customers
   where city !='madurai';

10.Display accounts where balance is not between 10,000 and 40,000.
---select*
   from accounts
   where balance not between 10000 and 40000;

11.Retrieve customers whose names end with 'i'.
---select*
   from customers
   where name like '%i';

12.Find accounts with balance equal to 50,000.
---select*
   from accounts
   where balance =50000;

13.Display customers whose city is either Chennai or Salem.
---select*
   from customers
   where city in('Chennai','salem');

14.Find accounts with balance greater than 10,000 and less than 40,000.
---select*
   from accounts
   where balance>10000 and balance<40000;
  
15.Retrieve accounts where account type is not in ('Current').
---select*
   from accounts
   WHERE account_type not in('Current');



ORDER BY (16–18)

16. Display all accounts sorted by balance in descending order.
---select*
   from accounts
   order by balance desc;

17. List customers sorted alphabetically by name.
---select*
   from customers
   order by name;

18. Display accounts sorted by account type and then by balance (descending).
---select*
   from accounts
   order by account_type , balance desc;
 


Aggregate Functions (19–23)

19. Find the total balance of all accounts.
---select sum(balance)
   from accounts;

20. Calculate the average balance of accounts.
---select avg(balance)
   from accounts;
 
21. Find the maximum account balance.
---select max(balance)
   from accounts;

22. Find the minimum account balance.
---select min(balance)
   from accounts;

23. Count the total number of customers.
---select count(*)
   from customers;



GROUP BY + HAVING (24–28)

24. Find total balance grouped by account type.
---select account_type, sum(balance)
   from accounts
   group by account_type;

25. Find average balance for each account type.
---select account_type, avg(balance)
   from accounts
   group by account_type;

26. Display account types having average balance greater than 20,000.
---select account_type, avg(balance)
   from accounts
   group by account_type
   having avg(balance)>20000;
 
27. Count number of accounts for each customer.
---select customer_id, count(*)
   from accounts
   group by customer_id;

28. Display customers having more than one account.
---select customer_id, count(*) 
   from accounts
   group by customer_id
   having count(*) > 1;


JOINS (29–35)

29. Retrieve customer names along with their account balances.
---select c.name, a.balance
   from customers c
   INNER JOIN accounts a
   ON c.customer_id = a.customer_id;

30. Display all customers and their accounts (including customers without accounts).
---select c.name, a.account_id, a.account_type, a.balance
   from customers c
   LEFT JOIN accounts a
   ON c.customer_id = a.customer_id;

31. Display all accounts and corresponding customer details.
---select a.account_id, a.account_type, a.balance, c.name, c.city
   from accounts a
   LEFT JOIN customers c
   ON a.customer_id = c.customer_id;

32. Retrieve customer names and account types where balance is greater than 20,000.
---select c.name, a.account_type, a.balance
   from customers c
   INNER JOIN accounts a
   ON c.customer_id = a.customer_id
   WHERE a.balance > 20000;

33. List customers with their total balance using JOIN.
---select c.name, SUM(a.balance) AS total_balance
   from customers c
   INNER JOIN accounts a
   ON c.customer_id = a.customer_id
   GROUP BY c.customer_id, c.name;

34. Display customer names and balances sorted by balance.
---select c.name, a.balance
   from customers c
   INNER JOIN accounts a
   ON c.customer_id = a.customer_id
   order by a.balance ASC;

35. Count number of accounts for each city using JOIN.
 ---select c.city, COUNT(a.account_id) AS total_accounts
    from customers c
    LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
    group by c.city;



SUBQUERIES (36–40)

36. Find accounts with balance greater than average balance.
--- select*
    from accounts
    WHERE balance > (select AVG(balance)
                     from accounts);
 

37. Retrieve customers who have accounts.
---select*
   from customers
   WHERE customer_id IN (select customer_id
                         from accounts);


38. Find customers who do not have any accounts.
---select*
   from customers
   WHERE customer_id NOT IN (select customer_id
                             from accounts
                             WHERE customer_id IS NOT NULL);


39. Display account(s) with the maximum balance.
 ---select*
    from accounts
    WHERE balance = (select MAX(balance)
                     from accounts);

40. Find customers whose total balance is greater than 40,000.
---select*
   from customers c
   WHERE (select SUM(a.balance)
          from accounts a
          WHERE a.customer_id = c.customer_id) > 40000;



RAILWAY RESERVATION – QUESTIONS

Basic + WHERE + Operators (41–45)

41. Retrieve all bookings with fare greater than 400.
---select*
   from bookings
   WHERE fare > 400;


42. Find bookings where status is not 'Confirmed'.
 ---select*
    from bookings
    WHERE status != 'Confirmed';

43. Display trains starting from Chennai.
 ---select*
    from trains
    WHERE source = 'Chennai';

44. Retrieve bookings with fare between 300 and 500.
---select*
   from bookings
   WHERE fare BETWEEN 300 AND 500;

45. Find passengers whose names start with 'A'.
---select*
   from bookings
   WHERE passenger_name LIKE 'A%';



JOINS + GROUP BY + ORDER BY (46–48)

46. Retrieve train names along with passenger names.
---select t.train_name, b.passenger_name
   from trains t
   INNER JOIN bookings b
    ON t.train_id = b.train_id;

47. Count number of bookings for each train.
---select t.train_name, COUNT(b.booking_id) AS total_bookings
   from trains t
   JOIN bookings b ON t.train_id = b.train_id
   group by t.train_name
   order by total_bookings DESC;

48. Display train names and total fare collected for each train.
---select t.train_name, SUM(b.fare) AS total_fare
   from trains t
   JOIN bookings b ON t.train_id = b.train_id
   group by t.train_name
   order by total_fare DESC;



SUBQUERIES (49–50)

49. Find bookings with fare equal to the highest fare.
---select*
   from bookings
   WHERE fare = (SELECT MAX(fare)
   from bookings);

50. Retrieve trains that have more than one booking.
---select*
   from trains
   WHERE train_id IN (
      select train_id
      from bookings
      group by train_id
      having COUNT(booking_id) > 1);

Employee Table

1. Find the total number of employees in each department.
---select department, COUNT(*) AS total_employees
   from employee
   group by department;

2. Find the average salary of employees in each department.
---select department, AVG(salary) AS average_salary
   from employee
   group by department;

3. Display departments having more than one employee.
---select department, COUNT(*) AS total_employees
   from employee
   group by department
   having COUNT(*) > 1;

4. Find the highest salary in each department.
---select department, MAX(salary) AS highest_salary
   from employee
   group by department;

5. Find the lowest salary in each department.
---select department, MIN(salary) AS lowest_salary
   from employee
   group by department;

6. Find departments whose average salary is greater than 50,000.
---select department, AVG(salary) AS average_salary
   from employee
   group by department
   having AVG(salary) > 50000;

7. Calculate the total salary expenditure for each department.
---select department, SUM(salary) AS total_salary
   from employee
   group by department;

8. Display all employees sorted by salary in descending order.
---select*
   from employee
   order by salary DESC;

9. Display employees sorted first by department and then by salary in descending order.
---select*
   from employee
   order by department ASC, salary DESC;

10. Find cities that have more than one employee.
---select city, COUNT(*) AS total_employees
   from employee
   group by city
   having COUNT(*) > 1;

11. Find the total salary paid in each city.
---select city, SUM(salary) AS total_salary
   from employee
   group by city;

12. Display departments ordered by total salary expenditure from highest to lowest.
---select department, SUM(salary) AS total_salary
   from employee
   group by department
   order by total_salary DESC;

13. Find the number of employees in each department whose salary is greater than 50,000.
---select department, COUNT(*) AS total_employees
   from employee
   WHERE salary > 50000
   group by department;

14. Find the difference between the highest and lowest salary in each department.
---select department, MAX(salary) - MIN(salary) AS salary_difference
   from employee
   group by department;

15. Display the top 3 highest-paid employees.
---select*
   from employee
   order by salary DESC LIMIT 3;
  


Customers & Orders Tables

16. Find the total order amount for each customer.
---select c.customer_id, c.customer_name,SUM(o.amount) AS total_purchase
   from Customers_table c
   JOIN Orders o 
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name;

17. Find customers who have placed more than 3 orders.
---select c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   having COUNT(o.order_id) > 3;

18. Find the average order amount for each customer.
---select c.customer_name, AVG(o.amount) AS average_amount
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group BY c.customer_id, c.customer_name;

19. Find the highest order amount placed by each customer.
---select c.customer_name, MAX(o.amount) AS highest_amount
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name;

20. Display customers sorted by their total purchase amount.
---select c.customer_name, SUM(o.amount) AS total_purchase
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   order by total_purchase DESC;

21. Find customers whose total purchase amount exceeds 10,000.
---select c.customer_name, SUM(o.amount) AS total_purchase
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   having SUM(o.amount) > 10000;

22. Display customer names along with the total number of orders placed.
---select c.customer_name, COUNT(o.order_id) AS total_orders
   from customers_table c
   LEFT JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name;

23. Find the customer who spent the highest amount.
---select c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
   from customer_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   order by total_purchase DESC LIMIT 1;

24. Find the customer who placed the maximum number of orders.
---select c.customer_id, c.customer_name,COUNT(o.order_id) AS total_orders
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   having COUNT(o.order_id) = (select MAX(order_count)
                               from (select COUNT(order_id) AS order_count
                                     from orders
                                     group by customer_id) AS temp
    );

25. Find customers whose average order amount is greater than 2,000.
>  select c.customer_id, c.customer_name, AVG(o.amount) AS average_amount
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   having AVG(o.amount) > 2000;

26. Display the top 5 customers based on total purchase amount.
---select c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   order by total_purchase DESC LIMIT 5;
 

27. Find the minimum order amount for each customer.
---select c.customer_id, c.customer_name, MIN(o.amount) AS minimum_order_amount
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name;

28. Find customers who have placed orders worth more than 5,000 in total.
---select c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   having SUM(o.amount) > 5000;

29. Display customer-wise total orders and total purchase amount.
>  select c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders, SUM(o.amount) AS total_purchase_amount 
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id, c.customer_name
   order by c.customer_id;

30. Find customers who placed more than 2 orders and spent more than 8,000.
---select c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders, SUM(o.amount) AS total_purchase_amount
   from customers_table c
   JOIN orders o
   ON c.customer_id = o.customer_id
   group by c.customer_id,  c.customer_name
   having COUNT(o.order_id) > 2 AND SUM(o.amount) > 8000;
    
   
 
Students Table

31. Find the average marks scored by students in each department.
---select department, AVG(marks) AS average_marks
   from students
   group by department;

32. Find departments whose average marks are above 75.
---select department, AVG(marks) AS average_marks
   from Students
   group by department
   having AVG(marks) > 75;

33. Find the highest mark scored in each department.
---select department, MAX(marks) AS highest_marks
   from Students
   group by department;

34. Find the total number of students in each department.
---select department, COUNT(*) AS total_students
   from Students
   group by department;

35. Find departments having more than 5 students.
---select department, COUNT(*) AS total_students
   from Students
   group by department
   having COUNT(*) > 5;

36. Display departments sorted by average marks in descending order.
---select department, AVG(marks) AS average_marks
   from Students
   group by department
   order by average_marks DESC;

37. Find the top 3 departments based on average marks.
---select department, AVG(marks) AS average_marks
   from Students
   group by department
   order by average_marks DESC LIMIT 3;
  
38. Find departments whose average marks are between 70 and 90.
---select department, AVG(marks) AS average_marks
   from Students
   group by department
   having AVG(marks) between 70 AND 90;

39. Find the total marks scored by students in each department.
---select department, SUM(marks) AS total_marks
   from Students
   group by department;

40. Display departments sorted by the total number of students.
---select department, COUNT(*) AS total_students
   from Students
   group by department
   order by total_students DESC;

41. Find the lowest mark scored in each department.
---select department, MIN(marks) AS lowest_marks
   from Students
   group by department;

42. Find departments where the highest mark is greater than 90.
---select department, MAX(marks) AS highest_marks
   from Students
   group by department
   having MAX(marks) > 90;

43. Find the number of students scoring above 80 in each department.
---select department, COUNT(*) AS total_students
   from Students
   WHERE marks > 80
   group by department;

44. Find departments where more than 3 students scored above 75.
---select department, COUNT(*) AS total_students
   from Students
   WHERE marks > 75
   group by department
   having count(*) > 3;

45. Display departments ordered by highest mark in descending order.
---select department, MAX(marks) AS highest_marks
   from Students
   group by department
   order by highest_marks DESC;