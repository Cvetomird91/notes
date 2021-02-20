PL/SQL Block Structure
• DECLARE (optional)
	– Variables, cursors, user-defined exceptions
• BEGIN (mandatory)
	– SQL statements SQL statements
	– PL/SQL statements
	- This section needs to have at least one statement
• EXCEPTION (optional)
	– Actions to perform when exceptions occur
• END; (mandatory) ; (mandatory)
	- END is always terminated with a semicolon

There are three types of blocks that make up a PL/SQL program:
	• Procedures - Procedures are named objects that contain SQL and/or PL/SQL statements
	• Functions - Functions are named objects that contain SQL and/or PL/SQL statements. Unlike
	a proced re a f nction ret rns a al e of a specified data t pe a procedure, a function returns a value of a specified data type
	• Anonymous blocks - Anonymous blocks are unnamed blocks. They are declared inline at the
	point in an application where they are to be executed and are compiled each time the
	application is executed. These blocks are not stored in the database. They are passed to the
	PL/SQL engine for execution at run time. Triggers in Oracle Developer components consist of
	such blocks.

	- Subprograms - Subprograms are complementary to anonymous blocks. They are named PL/SQL blocks that
	are stored in the database. Because they are named and stored, you can invoke them
	whenever y ( p g y pp ) ou want (depending on your application). You can declare them either as
	procedures or as functions. You typically use a procedure to perform an action and a function
	to compute and return a value.

The program constructs are available based on the environment in which they are executed.

Anonymous blocks:
	Description: Unnamed PL/SQL blocks that are embedded within an application or are issued interactively.
	Availability: All PL/SQL environments

PL/SQL variables:
- Scalar - the value depends on the data type of the variable. . Scalar data types
can be classified into four categories: number, character, date, and Boolean. Character and
number data types have subtypes that associate a base type to a constraint.
- Reference
- Large object(LOB) - LOB data types hold values, called locators, which specify the location
of large objects (such as graphic images) that are stored outside the table.
- Composite - Composite data types are available by using PL/SQL collection and record variables.
Non PL/SQL variables:
- Bind Variables
In constant declarations, the CONSTANT keyword must precede the type specifier. 

Naming Conventions of PL/SQL Structures
Variable 				v_variable_name (ex: v_rate)
constant 				c_constant_name (ex: c_rate)
Subprogram parameter	p_parameter_name (ex: p_id)
Bind (host) variable 	b_bind_name (ex: b_salary)
Cursor 					cur_cursor_name (ex: cur_emp)
Record 					rec_record_name(ex: rec_emp)
Type 					type_name_type (ex: ename_table_type)
Exception 				e_exception_name(ex: e_products_invalid)
File handle 			f_file_handle_name(ex: f_file)

Base Scalar Data Types
• CHAR [(maximum_length)]
• VARCHAR2 (maximum_length)
• NUMBER [(precision, scale)]
• BINARY INTEGER BINARY_INTEGER
• PLS_INTEGER
• BOOLEAN - Base type that stores one of the three possible values used for
logical calculations: TRUE, FALSE, and NULL 
• BINARY_FLOAT
• BINARY DOUBLE
• DATE
• TIMESTAMP
• TIMESTAMP WITH TIME ZONE
• TIMESTAMP WITH LOCAL TIME ZONE TIMESTAMP WITH LOCAL TIME ZONE
• INTERVAL YEAR TO MONTH
• INTERVAL DAY TO SECOND

%TYPE Attribute
• Is used to declare a variable according to:
	– A database column definition
	– Another declared variable
• Is prefixed with:
	– The database table and column name
	– The name of the declared variable

Example:
...
v_balance NUMBER(7,2);
v_min_balance v_balance%TYPE := 1000;
...	

A NOT NULL database column constraint does not apply to variables that are declared using
%TYPE. Therefore, if you declare a variable using the %TYPE attribute that uses a database
column defined as NOT NULL, you can assign the NULL value to the variable.

Bind variables are:
• Created in the environment
• Also called host variables
• Created with the Created with the VARIABLE VARIABLE keyword keyword*
• Used in SQL statements and PL/SQL blocks
• Accessed even after the PL/SQL block is executed
• Referenced with a preceding colon
Values can be outp g ut using the PRINT command.
* Required when using SQL*Plus and SQL Developer

<>, != - inequality operators

A cursor is a pointer to the private memory area allocated
by the Oracle Server. It is used to handle the result set of a
SELECT statement.
• There are two typ p p es of cursors: implicit and explicit.
– Implicit: Created and managed internally by the Oracle
Server to process SQL statements
– Explicit: Declared explicitly by the programmer

SQL%FOUND Boolean attribute that evaluates to TRUE if the most recent SQL statement affected at least one most recent SQL statement affected at least one row
SQL%NOTFOUND Boolean attribute that evaluates to TRUE if the most recent SQL statement did not affect even one row
SQL%ROWCOUNT An integer value that represents the number of rows aff d b h SQL ffected by the most recent SQL statement 

Composite data types are of two types:
– PL/SQL records
– PL/SQL collections PL/SQL collections
— Associative array (INDEX BY table)
— Nested table
— VARRAY

PL/SQL collections: PL/SQL collections: Collections are used to treat data a Collections are used to treat data as a single unit Collections are a single unit. Collections are
of three types:
- Associative array
- Nested table
- VARRAY

PL/SQL records: Records are used to treat related but dissimilar data as a logical unit.
A PL/SQL record can have variables of different types

PL/SQL Records or Collections?
• Use PL/SQL records when you want to store values of
different data types but only one occurrence at a time.
• Use PL/SQL collections when you want to store values of
the same data type.

The %ROWTYPE attribute is used to declare a record that can hold an entire row of a table or view.

Associative arrays have only two columns, neither of which can be named:
• The first column, of integer or string type, acts as the primary key.
• The second column, of scalar or record data type, holds values.

An associative array is not populated at the time of declaration. It contains no keys or
values, and you cannot initialize an associative array in its declaration. the size of an associative array is unconstrained.

• The nested table is a valid data type in a schema-level table, but an associative array is
not. Therefore, unlike associative arrays, nested tables can be stored in the database.
• The size of a nested table can increase dynamically, although the maximum size is 2
GB.
• The “key” cannot be a negative value (unlike in the associative array). Though reference
is made to the first column as key, there is no key in a nested table. There is a column
with numbers.
• Elements can be deleted from anywhere in a nested table, leaving a sparse table with
nonsequential “keys.” The rows of a nested table are not in any particular order.
• When you retrieve values from a nested table, the rows are given consecutive
subscripts starting from 1.

A variable-size array (VARRAY) is similar to an associative array, except that a VARRAY is
constrained in size.
• A VARRAY is valid in a schema-level table.
• Items of VARRAY type are called VARRAYs.
• VARRAYs have a fixed upper bound. You have to specify the upper bound when you
declare them. This is similar to arrays in C language. The maximum size of a VARRAY is
2 GB, as in nested tables.
• The distinction between a nested table and a VARRAY is the physical storage mode. The
elements of a VARRAY are stored inline with the table’s data unless the size of the
VARRAY is greater than 4 KB. Contrast that with nested tables, which are always stored
out-of-line.
• You can create a VARRAY type in the database by using SQL.

Associative Arrays
Associative arrays are sets of key-value pairs, where each key is unique and is used to locate
a corresponding value in the array. The key can be either integer- or character-based. The
Copyright © 2012, Oracle and/or its affiliates. All rights reserved.
a corresponding value in the array. The key can be either integer or character based. The
array value may be of the scalar data type (single value) or the record data type (multiple
values).
Because associative arrays are intended for storing temporary data, you cannot use them
with SQL statements such as INSERT and SELECT INTO.
Nested Tables
A nested table holds a set of values. In other wo A nested table holds a set of values. In other words, it is a table within a table. Nested tables it is a table within a table. Nested tables are unbounded; that is, the size of the table can increase dynamically. Nested tables are available in both PL/SQL and the database. Within PL/SQL, nested tables are like onedimensional arrays whose size can increase dynamically.
Varrays
Variable-size arrays, or varrays, are also collections of homogeneous elements that hold a
fixed number of elements (although you can change the number of elements at run time).
They use sequential numbers as subscripts. You can define equivalent SQL types, thereby
allowing varrays to be stored in database tables.

A PL/SQL program opens a cursor, processes rows returned by a query, and then closes the
cursor. The cursor marks the current position in the active set.
1. The OPEN statement executes the query associated with the cursor, identifies the active
Copyright © 2012, Oracle and/or its affiliates. All rights reserved.
qy ,
set, and positions the cursor at the first row.
2. The FETCH statement retrieves the current row and advances the cursor to the next
row until there are no more rows or a specified condition is met.
3. The CLOSE statement releases the cursor.

Cursor status attributes:
%ISOPEN - boolean - Evaluates to TRUE if the cursor is open
%NOTFOUND - boolean - Evaluates to TRUE if the most recent fetch does not return a row
%FOUND - Evaluates to TRUE if the most recent fetch returns a row; complement of returns a row; complement of %NOTFOUND
%ROWCOUNT - Evaluates to the total number of rows that’s has been fetched.

FOR UPDATE clause
Syntax:
SELECT ...
FROM ...
FOR UPDATE [OF column_reference][NOWAIT | WAIT n];
• Use explicit locking to deny access to other sessions for
the duration of a transaction.
• Lock the rows before the update or delete.

If there are multiple sessions for a single database, there is the possibility that the rows of a
particular table were updated after you opened your cursor. You see the updated data only
when you reopen the cursor. Therefore, it is better to have locks on the rows before you
update or delete rows. You can lock the rows with the FOR UPDATE clause in the cursor
query.

WHERE CURRENT OF Clause
Syntax:
• Use cursors to update or delete the current row.
• Include the FOR UPDATE clause in the cursor query to first
WHERE CURRENT OF cursor ;
• Include the FOR UPDATE clause in the cursor query to first
lock the rows.
• Use the WHERE CURRENT OF clause to reference the
current row from an explicit cursor.
UPDATE employees
SET salary SET salary = ...
WHERE CURRENT OF c_emp_cursor;

OTHERS Is an optional exception-handling clause that traps any exceptions
that have not been explicitly handled

Sample predefined exceptions:
– NO DATA FOUND NO_DATA_FOUND
– TOO_MANY_ROWS
– INVALID_CURSOR
– ZERO_DIVIDE
– DUP_VAL_ON_INDEX

Functions for trapping exceptions:
SQLCODE: Returns the numeric value for the error code
SQLERRM: Returns the message associated with the error
number

When a subblock handles an exception, it terminates normally. Control resumes in the
enclosing block immediately after the subblock’s END statement.
However, if a PL/SQL raises an exception and the current block does not have a handler for
that exception, the exception propagates to successive enclosing blocks until it finds a
handler. If none of these blocks handles the exception, an unhandled exception in the host
environment results

RAISE_APPLICATION_ERROR Procedure
• Is used in two different places:
	– Executable section
	– Exception section
• Returns error conditions to the user in a manner consistent Returns error conditions to the user in a manner consistent
with other Oracle Server errors

Procedures and Functions
• Are named PL/SQL blocks
• Are called PL/SQL subprograms
• Have block structures similar to anonymous blocks:
	– Optional declarative section (without the Optional declarative section (without the DECLARE DECLARE keyword) keyword)
	– Mandatory executable section
	– Optional section to handle exceptions

Creating Procedures
Creating Functions and Debugging Subprograms
Creating Packages
Working with Packages
Using Oracle-Supplied Packages in Application Development ???
Using Dynamic SQL
Creating Triggers
Creating Compound, DDL, and Event Database Triggers

Parameter modes are specified in the formal parameter
declaration, after the parameter name and before its data
type.
• The IN mode is the default if no mode is specified

Comparing parameter modes
IN - default mode. Value is passed into subprogram. Formal parameter acts as a constant. Actual parameter can be a literal, expression, constant, or initialized variable. Can be assigned a default value.
OUT - Must be specified. Value is returned to the calling environment. Uninitialized variable. Must be a variable. Cannot be assigned a default value
IN OUT - Must be specified. Value passed into subprogram; value returned to
calling environment. Initialized variable. Must be a variable. Cannot be assigned a default value

-- Passing parameters using the positional notation.
EXECUTE add_dept ('TRAINING', 2500)
-- Passing parameters using the named notation.
EXECUTE add_dept (p_loc=>2400, p_name=>'EDUCATION')

Parameter with default value:
CREATE OR REPLACE PROCEDURE add_dept(
	p_name departments.department_name%TYPE:='Unknown',
	p_loc departments.location_id%TYPE DEFAULT 1700)
IS
BEGIN
	INSERT INTO departments (department_id,
	department_name, location_id)
	VALUES (departments_seq.NEXTVAL, p_name, p_loc);
END add_dept;

• You can call procedures using anonymous blocks,
another procedure, or packages.
• You must own the procedure or have the EXECUTE
privilege.

Drop a procedure:
DROP PROCEDURE raise_salary;

The source code for PL/SQL subprograms is stored in the data dictionary tables. The source
code is accessible to PL/SQL procedures that are successfully or unsuccessfully compiled.
To view the PL/SQL source code stored in the data dictionary, execute a SELECT statement
on the following tables:
• The USER_SOURCE table to display PL/SQL code that you own
• The ALL_SOURCE table to display PL/SQL code to which you have been granted the
EXECUTE right by the owner of that subprogram code

Formal and Actual (or arguments) Parameters
• Formal parameters: Local variables declared in the parameter list of a subprogram
specification.
• Actual parameters: Literal values, variables, and expressions used in the parameter
list of the calling subprogram.

The Difference Between Procedures and Functions
Execute as a PL/SQL statement
Do not contain RETURN clause in the header
Can pass values (if any) using output parameters
Can contain a RETURN statement without a value

Functions
Invoke as part of an expression
Must contain a RETURN clause in the header
Must return a single value
Must contain at least one RETURN statement

User-defined functions act like built-in single-row functions and
can be used in:
• The SELECT list or clause of a query
• Conditional expressions of the WHERE and HAVING
clauses
• The CONNECT BY, START WITH, ORDER BY, and GROUP BY
clauses of a query
• The VALUES clause of the INSERT statement
• The SET clause of the UPDATE statement

• User-defined functions that are callable from SQL
expressions must:
– Be stored in the database
– Accept only IN parameters with valid SQL data types, not
PL/SQL-specific types
– Return valid SQL data types, not PL/SQL-specific types
• When calling functions in SQL statements:
– You must own the function or have the EXECUTE privilege
– You may need to enable the PARALLEL_ENABLE keyword to
allow a parallel execution of the SQL statemen

Functions called from:
• A SELECT statement cannot contain DML statements
• An UPDATE or DELETE statement on a table T cannot
query or contain DML on the same table T
• SQL statements cannot end transactions (that is, cannot
execute COMMIT or ROLLBACK operations)
Note: Calls to subprograms that break these restrictions are
also not allowed in the function.

Remove a function:
DROP FUNCTION f;

To debug a PL/SQL subprogram, a security administrator
needs to grant the following privileges to the application
developer:
– DEBUG ANY PROCEDURE
– DEBUG CONNECT SESSION
GRANT DEBUG ANY PROCEDURE TO ora61;
GRANT DEBUG CONNECT SESSION TO ora61;

Debugging a subprogram with SQLDeveloper: page 110 of the second student's guide

Query to get source code of a package:

SELECT text
FROM   user_source
WHERE  name = 'PKG_NAME' AND type = 'PACKAGE' --or 'PACKAGE BODY' for the package body
ORDER BY LINE;

You cannot overload subprograms in PL/SQL:
• Two subprograms if their formal parameters differ only in data type and the different
data types are in the same family (NUMBER and DECIMAL belong to the same family.)
• Two subprograms if their formal parameters differ only in subtype and the different
subtypes are based on types in the same family (VARCHAR and STRING are PL/SQL
subtypes of VARCHAR2.)
• Two functions that differ only in return type, even if the types are in different families
You get a run-time error when you overload subprograms with the preceding features

A package named STANDARD defines the PL/SQL
environment and built-in functions.
Most built-in functions are overloaded.

To be callable from SQL statements, a stored function must
obey the following purity rules to control side effects:
• When called from a SELECT or a parallelized DML
statement, the function cannot modify any database tables.
• When called from a DML statement, the function cannot
query or modify any database tables modified by that
statement.
• When called from a SELECT or DML statement, the
function cannot execute SQL transaction control, session
control, or system control statements.

The collection of package variables and the values define the
package state. The package state is:
• Initialized when the package is first loaded
• Persistent (by default) for the life of the session:
– Stored in the User Global Area (UGA)
– Unique to each session
– Subject to change when package subprograms are called or
public variables are modified
• Not persistent for the session but persistent for the life of a
subprogram call when using PRAGMA
SERIALLY_REUSABLE in the package specification

You can write triggers that fire whenever one of the following
operations occurs in the database:
• A database manipulation (DML) statement (DELETE,
INSERT, or UPDATE).
• A database definition (DDL) statement (CREATE, ALTER,
or DROP).
• A database operation such as SERVERERROR, LOGON,
LOGOFF, STARTUP, or SHUTDOWN.

Database trigger (covered in this course):
– Fires whenever a DML, a DLL, or system event occurs on a
schema or database
•
Application trigger:
– Fires whenever an event occurs within a particular
application

You can use triggers for:
• Security
• Auditing
• Data integrity
• Referential integrity
• Table replication
• Computing derived data automatically
• Event logging

•
Simple DML triggers
	– BEFORE
	– AFTER
	– INSTEAD OF
• Compound triggers
• Non-DML triggers
	– DDL event triggers
	– Database event triggers

get triggers:
DESCRIBE user_triggers;
SELECT trigger_type, trigger_body
FROM user_triggers
WHERE trigger_name = 'SECURE_EMP';

Statement-Level Triggers
Versus Row-Level Triggers - statement-level triggers trigger the trigger once the statement is executed, even if multiple
rows are affected or no rows are affected
Row-level triggers trigger for each row affected, even if affected by a signle statement.

Trigger firing sequence:
BEFORE statement trigger
BEFORE row trigger
AFTER row trigger
AFTER statement trigger

You can specify the trigger timing as to whether to run the
trigger’s action before or after the triggering statement:
• BEFORE: Execute the trigger body before the triggering
DML event on a table.
• AFTER: Execute the trigger body after the triggering DML
event on a table.
• INSTEAD OF: Execute the trigger body instead of the
triggering statement. This is used for views that are not
otherwise modifiable.