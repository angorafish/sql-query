-- 1. Find app with ID 1880
SELECT * FROM analytics WHERE id = 1880;

-- 2. Find apps updated on 8/1/18
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- 3. Count apps in each category
SELECT category, COUNT(*) AS count FROM analytics GROUP BY category;

-- 4. Top five most reviewed apps
SELECT app_name, num_reviews FROM analytics ORDER BY num_reviews DESC LIMIT 5;

-- 5. App with most reviews rating >= 4.8
SELECT app_name, num_reviews FROM analytics WHERE rating >= 4.8 ORDER BY num_reviews DESC LIMIT 1;

-- 6. Average rating by category, ordered high to low
SELECT category, AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating DESC;

-- 7. Most expensive app with rating < 3
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- 8. Apps with min install <= 50, ordered by rating
SELECT app_name, rating FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;

-- 9. Apps rating < 3 with >= 10000 reviews
SELECT app_name FROM analytics WHERE rating < 3 AND num_reviews >= 10000;

-- 10. Most-reviewed apps costing between $0.10 and $1
SELECT app_name, num_reviews FROM analytics WHERE price BETWEEN 0.10 AND 1 ORDER BY num_reviews DESC LIMIT 10;

-- 11. Most outdated app
SELECT app_name FROM analytics ORDER BY last_updated ASC LIMIT 1;

-- 12. Most expensive app
SELECT app_name, price FROM analytics ORDER BY price DESC LIMIT 1;

-- 13. Total number of reviews in Play Store
SELECT SUM(num_reviews) AS total_reviews FROM analytics;

-- 14. Categories with over 300 apps
SELECT category, COUNT(*) AS count FROM analytics GROUP BY category HAVING COUNT(*) > 300;

-- 15. Highest proportion of min_installs to reviews
SELECT app_name, num_reviews, min_installs, (CAST(min_installs AS FLOAT) / num_reviews) AS proportion
FROM analytics 
WHERE min_installs >= 100000
ORDER BY proportion DESC LIMIT 1;