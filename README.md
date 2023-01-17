# Solution for Test Case for Mahine Factor Technologies

This repository contains solutions for test cases for Mahine Factor Technologies.

## Task 1.1
The folder `task1.1` contains solutions for the appropriate task. It includes a pdf file with the SQL queries and the results of their execution. Additionally, it includes a .sql file that contains only the SQL queries.

## Task 1.2
The folder `task1.2` contains code and Docker files that meet the requirements described in the document. To launch it, simply run `docker-compose up`.

**Note:** Importing of data into the database may take some time. As a result, the job will only work after the database data has been imported and the DBMS is up and running.

## Task 2
The folder `task2` contains code for a web socket-based server that meets the requirements described in the document. To launch it, you need to install the requirements from `requirements.txt` via `pip install -r requirements.txt` and then launch the server via `python main.py`.

It also includes unit tests for this server. 

For testing, I used `wscat -c ws://localhost:8765`
