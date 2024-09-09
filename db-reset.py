import linecache
import os
import mysql.connector

mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "",
    database = "kdnd"
)
cursor = mydb.cursor()
cursor.execute('INSERT INTO role (name) VALUES ("Admin"),("Player"),("NPC");')
cursor.execute("SELECT * from kdnd.role")
result = cursor.fetchall()
for x in result:
    print(x)