-- Conversion Functions
SELECT TO_CHAR(SYSDATE, 'DD-Mon-YYYY') AS today_date FROM dual; -- Example Output: 21-Apr-2025
SELECT TO_NUMBER('12345') + 10 AS number_addition FROM dual; -- Example Output: 12355
SELECT TO_DATE('2025-04-21', 'YYYY-MM-DD') AS formatted_date FROM dual; -- Example Output: 21-APR-25

-- String Functions
SELECT 'Hello ' || 'World' AS concatenation FROM dual; -- Output: Hello World
SELECT LPAD('123', 5, '0') AS left_padded FROM dual; -- Output: 00123
SELECT RPAD('abc', 6, '*') AS right_padded FROM dual; -- Output: abc***
SELECT LTRIM('   spaced', ' ') AS left_trimmed FROM dual; -- Output: spaced
SELECT RTRIM('trailing   ', ' ') AS right_trimmed FROM dual; -- Output: trailing
SELECT LOWER('LOWERCASE') AS lower_case FROM dual; -- Output: lowercase
SELECT UPPER('uppercase') AS upper_case FROM dual; -- Output: UPPERCASE
SELECT INITCAP('capitalize every word') AS init_capital FROM dual; -- Output: Capitalize Every Word
SELECT LENGTH('Oracle SQL') AS string_length FROM dual; -- Output: 10
SELECT SUBSTR('HelloWorld', 6, 5) AS substring_extraction FROM dual; -- Output: World
SELECT INSTR('HelloWorld', 'W') AS position_of_W FROM dual; -- Output: 6

-- Date Functions
SELECT SYSDATE AS current_date FROM dual; -- Example Output: 21-APR-25
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') AS next_friday FROM dual; -- Example Output: 25-APR-25
SELECT ADD_MONTHS(SYSDATE, 2) AS two_months_later FROM dual; -- Example Output: 21-JUN-25
SELECT LAST_DAY(SYSDATE) AS last_day_of_month FROM dual; -- Example Output: 30-APR-25
SELECT MONTHS_BETWEEN(TO_DATE('2025-06-21', 'YYYY-MM-DD'), SYSDATE) AS months_diff FROM dual; -- Output: 2
SELECT LEAST(10, 20, 5, 30) AS least_value FROM dual; -- Output: 5
SELECT GREATEST(10, 20, 5, 30) AS greatest_value FROM dual; -- Output: 30
SELECT TRUNC(SYSDATE) AS truncated_date FROM dual; -- Output: 21-APR-25
SELECT ROUND(SYSDATE) AS rounded_date FROM dual; -- Output: 21-APR-25
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS formatted_sysdate FROM dual; -- Output: 2025/04/21 14:30:00 (example)
SELECT TO_DATE('21-04-2025', 'DD-MM-YYYY') AS to_date_example FROM dual; -- Output: 21-APR-25
