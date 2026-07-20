-- 1:create the database
CREATE DATABASE IF NOT EXISTS libraryDB;
USE libraryDB;

-- 2:drop existing tables if they exist to ensure a clean slate
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS members;

-- 3:create a 'books' table with detailed attributes 
CREATE TABLE books (
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
author VARCHAR(100),
genre VARCHAR(50),
isbn VARCHAR(20),
status ENUM('available','borrowed') DEFAULT 'available'
);


CREATE TABLE members (
member_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR (50),
last_name VARCHAR (50),
email VARCHAR(100),
join_date DATE
);


-- 4:creating child table with foreign keys
CREATE TABLE loans (
loan_id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT,
member_id INT,
loan_date DATE,
due_date DATE,
return_date DATE NULL,
FOREIGN KEY (book_id) REFERENCES books (book_id),
FOREIGN KEY (member_id) REFERENCES members (member_id)
);

-- 1. Insert sample data into Books
INSERT INTO Books (title, author, genre, isbn, status) VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '978-0743273565', 'Available'),
('A Brief History of Time', 'Stephen Hawking', 'Science', '978-0553380163', 'Available'),
('Data Science for Business', 'Foster Provost', 'Technology', '978-1449361327', 'Available'),
('1984', 'George Orwell', 'Dystopian', '978-0451524935', 'Borrowed');

-- 2. Insert sample data into Members
INSERT INTO Members (first_name, last_name, email, join_date) VALUES 
('John', 'Doe', 'john.doe@email.com', '2026-01-15'),
('Jane', 'Smith', 'jane.smith@email.com', '2026-03-10'),
('Michael', 'Brown', 'm.brown@email.com', '2026-05-22');

-- 3. Insert sample data into Loans (Linking Books and Members)
INSERT INTO Loans (book_id, member_id, loan_date, due_date, return_date) VALUES 
(4, 1, '2026-07-01', '2026-07-15', NULL); -- '1984' borrowed by John Doe

SELECT
l.loan_id AS 'loan id',
b.title AS 'book title',
b.author AS 'author',
CONCAT(m.first_name,' ',m.last_name) AS 'member name',
l.loan_date AS 'borrowed on',
l.due_date AS 'due date',
b.status AS 'current status'
FROM loans l
JOIN books b ON l.book_id=b.book_id
JOIN members m ON l.member_id =m.member_id;








 