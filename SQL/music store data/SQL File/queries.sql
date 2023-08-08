-- Q1: Who is the senior most employee based on job title?

SELECT title, first_name, last_name FROM employee ORDER BY levels DESC LIMIT 1;

-- Q2: Which countries have the most Invoices?

SELECT billing_country, COUNT(*) AS invoice_count FROM invoice GROUP BY billing_country 
ORDER BY invoice_count DESC;

-- Q3: What are top 3 values of total invoice?

SELECT total FROM invoice ORDER BY total DESC LIMIT 3;

-- Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals

SELECT billing_city,SUM(total) AS InvoiceTotal
FROM invoice GROUP BY billing_city ORDER BY InvoiceTotal DESC
LIMIT 1;

-- Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.

SELECT customer.customer_id, first_name, last_name, SUM(total) AS total_spending FROM customer
LEFT JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id, first_name, last_name
ORDER BY total_spending DESC
LIMIT 1;

-- Q6:  Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A.
SELECT DISTINCT email,first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

-- Q7:Let's invite the artists who have written the most rock music in our dataset. 
-- Write a query that returns the Artist name and total track count of the top 10 rock bands.

SELECT artist.artist_id, artist.name, COUNT(track.track_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id, artist.name
ORDER BY number_of_songs DESC
LIMIT 10;

-- Q8: Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. 

SELECT name,milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track )
ORDER BY milliseconds DESC;

-- Q9: Find how much amount spent by each customer on artists? 
-- Write a query to return customer name, artist name and total spent.

SELECT c.customer_id, c.first_name, c.last_name, 
       artist.name AS artist_name, 
       SUM(il.unit_price * il.quantity) AS amount_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN album a ON t.album_id = a.album_id
JOIN artist ON a.artist_id = artist.artist_id
GROUP BY c.customer_id, c.first_name, c.last_name, artist.name
ORDER BY c.customer_id, amount_spent DESC;

-- Q10: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
-- with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
-- the maximum number of purchases is shared return all Genres.

WITH top_genres AS (
    SELECT 
        i.billing_country AS country,
        g.name AS genre_name,
        COUNT(il.invoice_line_id) AS total_purchases,
        RANK() OVER (PARTITION BY i.billing_country ORDER BY COUNT(il.invoice_line_id) DESC) AS genre_rank
    FROM invoice_line il
    JOIN track t ON il.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    JOIN invoice i ON il.invoice_id = i.invoice_id
    GROUP BY i.billing_country, g.name
)
SELECT country, genre_name
FROM top_genres
WHERE genre_rank = 1;

-- Q11: Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how much they spent. 
-- For countries where the top amount spent is shared, provide all customers who spent this amount.

WITH top_customers AS (
    SELECT
        i.billing_country AS country,
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(il.unit_price * il.quantity) AS total_spent,
        RANK() OVER (PARTITION BY i.billing_country ORDER BY SUM(il.unit_price * il.quantity) DESC) AS customer_rank
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    GROUP BY i.billing_country, c.customer_id, c.first_name, c.last_name
)
SELECT country, customer_id, first_name, last_name, total_spent
FROM top_customers
WHERE customer_rank = 1;


