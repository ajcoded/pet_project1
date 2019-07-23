import mysql.connector
from mysql.connector import Error
mySQLconnection = mysql.connector.connect(host='localhost',
                          database='mydb',
                          user='pyuser',
                          password='pyp@#swd09')
sql_select_Query = "select * from python_developers"
cursor = mySQLconnection .cursor()
cursor.execute(sql_select_Query)
records = cursor.fetchall()
print ("Printing each row's column values i.e.  developer record")
for row in records:
    print("Id = ", row[0], )
    print("Name = ", row[1])
    print("JoiningDate  = ", row[2])
    print("Salary  = ", row[3], "\n")
cursor.close()
