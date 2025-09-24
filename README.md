 Library Management System Database

 Project Description
Complete relational database for library management system. Includes books, members, authors, categories, and borrowing records.

 Database Structure
- 6 tables with proper relationships
- Primary keys and foreign keys
- Constraints and data validation

 Tables Created
1. categories - Book genres
2. authors - Book writers  
3. books - Main book information
4. book_authors - Many-to-many relationship
5. members - Library members
6. borrowing_records - Loan history

 How to Run
1. Open MySQL Workbench
2. Execute library_database.sql
3. Verify tables are created

 Relationships Demonstrated
- One-to-Many: categories to books
- Many-to-Many: books to authors
- One-to-Many: books to borrowing_records
