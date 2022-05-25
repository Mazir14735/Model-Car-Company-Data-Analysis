import mysql.connector as mc

try:
    conn = mc.connect(host = "localhost", database="toys_and_models", user="root", password= 'Gadjamel14735?')
    cursor = conn.cursor()

    req = 'SELECT * FROM customers'
    cursor.execute(req)

    customerlist = cursor.fetchall()

    for c in customerlist:
        print ('prénom:{}'.format(c[1]))

except mc.Error as err:
    print (err)
finally:
    if (conn.is_connected()):
        cursor.close()
        conn.close()




