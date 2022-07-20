/*Top 25 Schools*/
SELECT email_domain, count(u.email_domain) as count
FROM users u
GROUP BY email_domain
ORDER BY  count desc
LIMIT 25;

/* How many edu learners are located in New York */
SELECT 
    city, count(user_id) as count
FROM
    users
WHERE
    city = 'new york';
    
/*How many users using mobile app?*/
SELECT 
    count(user_id) as mobileUserCount
FROM
    users
WHERE
    mobile_app = 'mobile-user';

/*Sign up counts for each hour*/
SELECT 
    date_format(sign_up_at, "%H H") as Hour, count(user_id)
FROM
    users
GROUP BY
	Hour
order by
	Hour;

/*Do different school prefer different courses?*/
SELECT 
    email_domain,
    SUM(CASE
        WHEN p.learn_cpp IN ('started' , 'completed') THEN 1
        ELSE 0
    END) AS cppCount,
    SUM(CASE
        WHEN p.learn_sql IN ('started' , 'completed') THEN 1
        ELSE 0
    END) AS sqlCount,
    SUM(CASE
        WHEN p.learn_html IN ('started' , 'completed') THEN 1
        ELSE 0
    END) AS htmlCount,
    SUM(CASE
        WHEN p.learn_javascript IN ('started' , 'completed') THEN 1
        ELSE 0
    END) AS javascriptCount,
    SUM(CASE
        WHEN p.learn_java IN ('started' , 'completed') THEN 1
        ELSE 0
    END) AS javaCount
FROM
    users u
        JOIN
    progress p USING (user_id)
GROUP BY email_domain;
    
/*What Courses are the New Yorkers taking?*/

SELECT 
    user_id, email_domain, city, learn_cpp, learn_sql, learn_html,learn_javascript, learn_java
FROM
    users
        JOIN
    progress USING (user_id)
WHERE
    city = 'New York';
    
/*What Courses are the Chicago students taking?*/

SELECT 
    user_id, email_domain, city, learn_cpp, learn_sql, learn_html,learn_javascript, learn_java
FROM
    users
        JOIN
    progress USING (user_id)
WHERE
    city = 'Chicago';