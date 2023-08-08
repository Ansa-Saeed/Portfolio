-- Data Cleaning 
--                   First Table 
SELECT * FROM album;
-- Remove First row because column name show 
DELETE FROM album
WHERE title = 'title';
--                   Second Table
-- Show Table
SELECT * FROM artist;
-- Delete First Row
DELETE FROM artist
WHERE name = 'name';
--                   Third Table
DELETE FROM customer
WHERE customer_id = 'customer_id';
--                4th table
SELECT * FROM employee;
DELETE FROM employee
WHERE employee_id = 'employee_id';
--           5th table
SELECT * FROM genre;
DELETE FROM genre
WHERE genre_id = 'genre_id'
--         6th Table
SELECT * FROM invoice;
DELETE FROM invoice
WHERE invoice_id = 'invoice_id'
----                7th Table
SELECT * FROM invoice_line;
DELETE FROM invoice_line
WHERE invoice_line_id = 'invoice_line_id'
----      8th table
SELECT * FROM media_type;
DELETE FROM media_type
WHERE media_type_id = 'media_type_id'
-------  9th table
SELECT * FROM playlist;
DELETE FROM playlist
WHERE playlist_id = 'playlist_id'
------       10th table
SELECT * FROM playlist_track;
DELETE FROM playlist_track
WHERE playlist_id = 'playlist_id'
-----------     11th table
SELECT * FROM track;
DELETE FROM track
WHERE track_id = 'track_id'