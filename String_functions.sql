-- String Functions in SQL (MySQL)

-- Creating a sample table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(50),
    city VARCHAR(30)
);

-- Insert sample data
INSERT INTO students (full_name, city) VALUES
('Venkatesh Pamudurti', 'Guntur'),
('Lakshmi Sesha Sai Maddineni', 'Vijayawada'),
('Kushyanth Pothineni', 'Hyderabad');

------------------------------------------------------
-- 1. LENGTH() → Returns length of string
SELECT full_name, LENGTH(full_name) AS name_length
FROM students;

------------------------------------------------------
-- 2. UPPER() → Converts to uppercase
SELECT UPPER(full_name) AS uppercase_name
FROM students;

------------------------------------------------------
-- 3. LOWER() → Converts to lowercase
SELECT LOWER(city) AS lowercase_city
FROM students;

------------------------------------------------------
-- 4. CONCAT() → Join strings
SELECT CONCAT(full_name, ' from ', city) AS full_details
FROM students;

------------------------------------------------------
-- 5. SUBSTRING() → Extract part of string
SELECT full_name, SUBSTRING(full_name, 1, 7) AS short_name
FROM students;

------------------------------------------------------
-- 6. INSTR() → Find position of substring
SELECT full_name, INSTR(full_name, 'a') AS position_of_a
FROM students;

------------------------------------------------------
-- 7. RTRIM(), LTRIM() → Remove spaces
SELECT LTRIM('     Hello') AS left_trimmed,
       RTRIM('Hello     ') AS right_trimmed;

------------------------------------------------------
-- 8. REPLACE() → Replace text
SELECT REPLACE(full_name, 'Venkatesh', 'Venky') AS new_name
FROM students
WHERE full_name LIKE '%Venkatesh%';

------------------------------------------------------
-- 9. REVERSE() → Reverse text
SELECT full_name, REVERSE(full_name) AS reversed_name
FROM students;

------------------------------------------------------
-- 10. LEFT() & RIGHT() → Left or right part of string
SELECT full_name,
       LEFT(full_name, 5) AS first_5_chars,
       RIGHT(full_name, 3) AS last_3_chars
FROM students;

------------------------------------------------------
-- 11. CHAR_LENGTH() → Number of characters
SELECT full_name, CHAR_LENGTH(full_name) AS char_count
FROM students;

------------------------------------------------------
-- 12. FIELD() → Compare string with list
SELECT FIELD('Guntur', 'Hyderabad', 'Guntur', 'Vijayawada') AS position_of_city;

------------------------------------------------------
-- 13. ASCII() → ASCII value of first character
SELECT full_name, ASCII(full_name) AS ascii_value
FROM students;

------------------------------------------------------
-- 14. REPEAT() → Repeat string
SELECT REPEAT('SQL ', 3) AS repeated_string;

------------------------------------------------------
-- 15. LPAD(), RPAD() → Add padding
SELECT LPAD('SQL', 10, '*') AS left_padded,
       RPAD('SQL', 10, '*') AS right_padded;

------------------------------------------------------
-- END OF STRING FUNCTIONS
