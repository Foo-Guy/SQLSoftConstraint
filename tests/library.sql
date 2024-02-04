-- File: varied_data_types_external_references.sql

CREATE TABLE library (
    library_id INTEGER PRIMARY KEY,
    library_name TEXT
);

CREATE TABLE book (
    book_id TEXT PRIMARY KEY, -- UUID
    title TEXT,
    author TEXT,
    library_reference INTEGER -- Suggests relationship to library.library_id
);

CREATE TABLE borrower (
    borrower_id INTEGER PRIMARY KEY,
    borrower_name TEXT
);

CREATE TABLE loan (
    loan_id INTEGER PRIMARY KEY,
    bookid TEXT, -- Suggests relationship to book.book_id (UUID)
    borrowerid INTEGER, -- Suggests relationship to borrower.borrower_id
    loan_date DATE,
    return_date DATE
);

-- Insert sample data to establish detectable patterns

INSERT INTO library (library_id, library_name) VALUES
(1, 'Main Branch'),
(2, 'Downtown Branch');

INSERT INTO book (book_id, title, author, library_reference) VALUES
('uuid-book-1', 'SQL Fundamentals', 'John Doe', 1),
('uuid-book-2', 'Database Design', 'Jane Smith', 1);

INSERT INTO borrower (borrower_id, borrower_name) VALUES
(1, 'Alice Smith'),
(2, 'Bob Johnson');

INSERT INTO loan (loan_id, bookid, borrowerid, loan_date, return_date) VALUES
(1, 'uuid-book-1', 1, '2023-07-01', '2023-07-15'),
(2, 'uuid-book-2', 2, '2023-07-02', '2023-07-16');
