from psycopg2 import connect, OperationalError, sql, DatabaseError

try:
    cnx = connect(
        user='postgres',
        password='coderslab',
        host='localhost',
        port='5433',
        database='sakila'
    )
    cursor = cnx.cursor()
except OperationalError as err:
    print('Connection Error')
    raise ValueError(f'Connection error: {err}')


query_create_tb = sql.SQL('''
    CREATE TABLE IF NOT EXISTS {table_name}(
    id SERIAL,
    name VARCHAR(50),
    email VARCHAR(120) UNIQUE,
    password VARCHAR(60) DEFAULT 'ala',
    PRIMARY KEY (id))
''').format(table_name=sql.Identifier('User'))

query_create_tb_2 = sql.SQL('''
    CREATE TABLE IF NOT EXISTS {table_name}(
    id SERIAL,
    user_id SMALLINT,
    street VARCHAR(150),
    city VARCHAR(100),
    notes TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES {table_name_foreign}(id))
''').format(table_name=sql.Identifier('Address'), table_name_foreign=sql.Identifier('User'))

query_insert = sql.SQL('''
    INSERT INTO {table_name}(name, email, password)
    VALUES (%s, %s, %s)
''').format(table_name=sql.Identifier('User'))

query_delete = sql.SQL('''
    DELETE FROM {table_name}
    WHERE id=%s
''').format(table_name=sql.Identifier('User'))

query_update = sql.SQL('''
    UPDATE {table_name}
    SET email=%s
    WHERE id=%s
''').format(table_name=sql.Identifier('User'))

query_alter = sql.SQL('''
    ALTER TABLE {table_name}
    ADD COLUMN price DECIMAL(7,2)
    DEFAULT 0
''').format(table_name=sql.Identifier('User'))

query_alter2 = sql.SQL('''
    ALTER TABLE {table_name}
    ADD COLUMN date_of_creation
    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
''').format(table_name=sql.Identifier('Address'))

query_select = sql.SQL('''
    SELECT * FROM {table_name}
''').format(table_name=sql.Identifier('User'))

try:
    with cnx, cnx.cursor() as cs:
        # try:
        #     cs.execute(query_create_tb_2)
        # except DatabaseError as err:
        #     print(err)
        # try:
        #     cs.execute(query_insert, ('aga', 'a@a2.pl', 'secret'))
        # except DatabaseError as err:
        #     print(err)
        # try:
        #     cs.execute(query_delete, (1, ))
        # except DatabaseError as err:
        #     print(err)
        # try:
        #     cs.execute(query_update, ("lalal@.com", 3))
        # except DatabaseError as err:
        #     print(err)
        # try:
        #     cs.execute(query_alter)
        # except DatabaseError as err:
        #     print(err)
        try:
            cs.execute(query_select)
        except DatabaseError as err:
            print(err)
        else:
            users = cs.fetchall()
            for pk, name, email, password, price in users:
                print(pk, name, email, password, price)
finally:
    cnx.close()
