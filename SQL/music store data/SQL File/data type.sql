-- -------------------------Employee----------------------
-- SELECT * FROM employee
-- ALTER TABLE employee
-- ALTER COLUMN birthdate TYPE DATE using birthdate::date
-- ALTER COLUMN hire_date TYPE DATE using hire_date::date
-- ALTER COLUMN reports_to TYPE INTEGER using reports_to::integer
-- ALTER COLUMN employee_id TYPE INTEGER using employee_id::integer
-- -------------------------Customer----------------------
-- SELECT * FROM customer
-- ALTER TABLE customer
-- ALTER COLUMN customer_id TYPE INTEGER using customer_id::integer
-- ALTER COLUMN support_rep_id TYPE INTEGER using support_rep_id::integer
-- -------------------------Artist----------------------
-- SELECT * FROM artist
-- ALTER TABLE artist
-- ALTER COLUMN artist_id TYPE INTEGER using artist_id::integer
-- -------------------------ALbum---------------------
-- SELECT * FROM album
-- ALTER TABLE album
-- ALTER COLUMN artist_id TYPE INTEGER using artist_id::integer
-- ALTER COLUMN album_id TYPE INTEGER using album_id::integer
-- -------------------------Genre----------------------
-- SELECT * FROM genre
-- ALTER TABLE genre
-- ALTER COLUMN genre_id TYPE INTEGER using genre_id::integer
-- -------------------------Invoice----------------------
-- SELECT * FROM invoice
-- ALTER TABLE invoice
-- ALTER COLUMN customer_id TYPE INTEGER using customer_id::integer
-- ALTER COLUMN invoice_id TYPE INTEGER using invoice_id::integer
-- ALTER COLUMN invoice_date TYPE DATE using invoice_date::date
-- ALTER COLUMN total TYPE FLOAT using total::double precision
-- -------------------------Invoice Line----------------------
-- SELECT * FROM invoice_line
-- ALTER TABLE invoice_line
-- ALTER COLUMN invoice_line_id TYPE INTEGER using invoice_line_id::integer
-- ALTER COLUMN invoice_id TYPE INTEGER using invoice_id::integer
-- ALTER COLUMN track_id TYPE INTEGER using track_id::integer
-- ALTER COLUMN quantity TYPE INTEGER using quantity::integer
-- ALTER COLUMN unit_price TYPE FLOAT using total::double precision
-- -------------------------Media Type----------------------
-- SELECT * FROM meida_type
-- ALTER TABLE media_type
-- ALTER COLUMN media_type_id TYPE INTEGER using media_type_id::integer
-- -------------------------Playlist----------------------
-- SELECT * FROM playlist
-- ALTER TABLE playlist
-- ALTER COLUMN playlist_id TYPE INTEGER using playlist_id::integer
-- -------------------------Playlist Track----------------------
-- SELECT * FROM playlist_track
-- ALTER TABLE playlist_track
-- ALTER COLUMN playlist_id TYPE INTEGER using playlist_id::integer
-- ALTER COLUMN track_id TYPE INTEGER using track_id::integer
-- -------------------------Track----------------------
-- ALTER TABLE track
-- ALTER COLUMN track_id TYPE INTEGER using track_id::integer
-- ALTER COLUMN media_type_id TYPE INTEGER using media_type_id::integer
-- ALTER COLUMN genre_id TYPE INTEGER using genre_id::integer
-- ALTER COLUMN album_id TYPE INTEGER using album_id::integer
-- ALTER COLUMN milliseconds TYPE INTEGER using milliseconds::integer
-- ALTER COLUMN bytes TYPE INTEGER using bytes::integer
-- ALTER COLUMN unit_price TYPE FLOAT using total::double precision