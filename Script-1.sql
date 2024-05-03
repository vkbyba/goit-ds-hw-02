 
SELECT * FROM tasks   
where user_id = 1


SELECT t.*,s.name 
FROM tasks t
Join status s on t.status_id = s.id
Where s.name = 'new'
Order by USER_id

UPDATE tasks
SET status_id = (SELECT id FROM status WHERE name = 'in progress')
WHERE id = 6;

Select * from tasks t 
Where id = 6

Select * from users u 
Where id not in (Select user_id From tasks t)

Select * FROM status s 



INSERT INTO tasks (id, title,description,status_id,user_id)
VALUES (31, 'test','test description', 2,8)

Select * FROM tasks t 
Where status_id NOT in (SELECT id From status s WHERE name = 'completed')


DELETE FROM tasks  WHERE id = 28;


Select * FROM users u 
Where email like '%example.com'

UPDATE users  
SET fullname = 'Mikes Browdey'
WHERE id = 2;

SELECT t.status_id, s.name, Count(t.id) From
tasks t 
Join status s on t.status_id =s.id 
GROUP by t.status_id, s.name


SELECT t.*,u.fullname,u.email 
From tasks t  
join users u on t.user_id = u.id 
WHERE u.email  like '%example.com'

SELECT * FROM tasks t 
WHERE description  is NULL

SELECT t.*,u.fullname,u.email,s.name 
From tasks t  
join users u on t.user_id = u.id 
JOIN status s on s.id =t.status_id 
WHERE s.name = 'in progress' 

SELECT u.id, u.fullname ,COUNT(t.id) 
From users u 
left join tasks t on t.user_id  = u.id 
GROUP by  u.id, u.fullname 
