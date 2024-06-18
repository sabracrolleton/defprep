# defprep
### _Sabra Crolleton_

This is a quick and dirty project to try to track down the errors in Postmodern reported in issue 352. Assuming you have no database named "defprep", start the Postgresql command line program psql with a user that can create a database and enter the following:

    \i create-test-db.sql
    
You may need to enter the full path name.

This will create database named "defprep" with a single table named "sessions" having two columns (id and sid).

Quickloading this common lisp package "defprep" will result in the following actions:

File defprep-0.lisp will:
1. Ask for the relevant parameters for a database connection to the defprep database (databasename, username, password, hostname) with defaults for databasename and hostname
2. Will declare two defprepared queries, one quoted, one without quotes (just to cover both possibilities) named query-sessions-id and query-sessions-sid.

This file does not actually make any calls to the database.

File defprep-1.lisp will:
1. Call the database using with-connection and ask for a list of all prepared statements, both from postmodern and from Postgresql. This should be nil because no prepared statements have actually been called during a connection.
2. Call the database with just one of the two prepared queries, print the result and check postmodern and postgresql for their list of prepared queries. They should both only have the single prepared query that was called.
3. Call the database with both of the prepared queries, printing both results and again checking with postmodern and postgresql for their list of prepared queries. They should both have two prepared queries.
4. Call a function which calls the database with both of the prepared queries, printing both results and again checking with postmodern and postgresql for their list of prepared queries. They should both have two prepared queries.
5. There is a function named test-point5 which is not called during the quickload process but which can be called from the REPL which should trigger the same result as point 4, but with the query-sessions-id result should be nil. 

## License

MIT

