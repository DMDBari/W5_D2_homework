CREATE TABLE IF NOT EXISTS customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS movie (
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	director VARCHAR(50) NOT NULL,
	genre VARCHAR(50) NOT NULL,
	play_time INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS ticket (
	ticket_id SERIAL PRIMARY KEY,
	ticket_cost INTEGER NOT NULL,
	time_of_show TIMESTAMP NOT NULL,
	movie_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE IF NOT EXISTS customer_movie (
	customer_id INTEGER NOT NULL,
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);