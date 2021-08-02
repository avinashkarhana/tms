# tms
 Trainee Management System with a builtin messaging service and attendance managent system.

 To run (with sqlite3):
    
    1. ```Delete old db.sqlite3```

    2. find . -path "*/migrations/*.py" -not -name "__init__.py" -delete 

    3. find . -path "*/migrations/*.pyc"  -delete

    4. sqlite3 db.sqlite3 ".read dump.sql"

    5. python3 manage.py makemigrations 

    6. python3 manage.py showmigrations 

    7. python3 manage.py migrate

    8. python3 manage.py runserver
    

