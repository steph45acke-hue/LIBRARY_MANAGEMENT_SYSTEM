# Library Management System

A relational database system designed to track library inventory, member registration, and book borrowing activities.

## Features
* **Inventory Management**: Tracks book titles, authors, genres, and availability status.
* **Member Management**: Maintains records of registered library members.
* **Loan Tracking**: Manages borrowing history, including loan dates and due dates.

## Database Schema
The system utilizes a relational structure consisting of three tables:
1. **Books**: Stores book details (ID, title, author, genre, ISBN, status).
2. **Members**: Stores member information (ID, name, email, join date).
3. **Loans**: Links books to members to track borrowing activity.

## Setup Script

```sql
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Members;

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    genre VARCHAR(50),
    isbn VARCHAR(20),
    status ENUM('Available', 'Borrowed') DEFAULT 'Available'
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    loan_date DATE,
    due_date DATE,
    return_date DATE NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

