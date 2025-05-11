-- Initialize MySQL Database

-- Use the database
USE jinwoo_db;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create coffee_logs table
CREATE TABLE IF NOT EXISTS coffee_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    cups INT NOT NULL,
    log_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert sample data
INSERT INTO users (username, email) VALUES ('jinwoo', 'jinwoo@example.com');
INSERT INTO coffee_logs (user_id, cups, log_date) VALUES (1, 5, CURRENT_DATE());

-- Create view for coffee consumption
CREATE OR REPLACE VIEW coffee_consumption_view AS
SELECT u.username, cl.cups, cl.log_date
FROM users u
JOIN coffee_logs cl ON u.id = cl.user_id
ORDER BY cl.log_date DESC;
