CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    publication_year INT,
    category_id INT,
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE book_authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    membership_date DATE DEFAULT (CURRENT_DATE),
    status ENUM('active', 'inactive') DEFAULT 'active'
);

CREATE TABLE borrowing_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

INSERT INTO categories (category_name, description) VALUES 
('Fiction', 'Novels and short stories'),
('Science', 'Scientific books and research'),
('Technology', 'Computer science and IT');

INSERT INTO authors (first_name, last_name, birth_year, nationality) VALUES 
('James', 'Clear', 1986, 'American'),
('Stephen', 'King', 1947, 'American'),
('Yuval', 'Harari', 1976, 'Israeli');

INSERT INTO books (title, isbn, publication_year, category_id, total_copies, available_copies) VALUES 
('Atomic Habits', '978-0735211292', 2018, 3, 5, 5),
('The Shining', '978-0307743657', 1977, 1, 3, 3),
('Sapiens', '978-0062316097', 2011, 2, 4, 4);

INSERT INTO book_authors (book_id, author_id) VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO members (first_name, last_name, email, phone) VALUES 
('Gloria', 'Baker', 'gloria@email.com', '555-0101'),
('John', 'Smith', 'john@email.com', '555-0102');