-- File: cross_reference_patterns.sql

CREATE TABLE customer (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT UNIQUE
);

CREATE TABLE invoice (
    invoice_id INTEGER PRIMARY KEY,
    cust_id INTEGER, -- Suggests a relationship to customer.customer_id
    invoice_date DATE,
    total REAL
);

CREATE TABLE invoice_line (
    line_id INTEGER PRIMARY KEY,
    inv_id INTEGER, -- Suggests a relationship to invoice.invoice_id
    description TEXT,
    quantity INTEGER,
    price REAL
);

CREATE TABLE feedback (
    feedback_id INTEGER PRIMARY KEY,
    customer_email TEXT, -- Suggests a relationship to customer.email
    comment TEXT,
    feedback_date DATE
);

-- Insert sample data to establish detectable patterns

INSERT INTO customer (customer_id, name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com');

INSERT INTO invoice (invoice_id, cust_id, invoice_date, total) VALUES
(1, 1, '2023-05-01', 300.0),
(2, 2, '2023-05-02', 450.0);

INSERT INTO invoice_line (line_id, inv_id, description, quantity, price) VALUES
(1, 1, 'Product 1', 2, 50.0),
(2, 1, 'Product 2', 1, 200.0),
(3, 2, 'Product 1', 1, 450.0);

INSERT INTO feedback (feedback_id, customer_email, comment, feedback_date) VALUES
(1, 'alice@example.com', 'Great service', '2023-05-03'),
(2, 'bob@example.com', 'Fast delivery', '2023-05-04');
