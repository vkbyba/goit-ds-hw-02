from faker import Faker
import sqlite3


fake = Faker()

try:

    conn = sqlite3.connect('HomeTask2_base_cr_by_script')
    c = conn.cursor()

   
    for _ in range(10):  
        fullname = fake.name()
        email = fake.email()
        c.execute('INSERT INTO users (fullname, email) VALUES (?, ?)', (fullname, email))


    c.execute('SELECT id FROM users')
    user_ids = c.fetchall()
    c.execute('SELECT id FROM status')
    status_ids = c.fetchall()


    if not user_ids or not status_ids:
        raise Exception("User IDs or Status IDs not retrieved. Check table data.")


    for _ in range(30):  
        title = fake.sentence(nb_words=6)
        description = fake.text(max_nb_chars=200)
        status_id = fake.random_element(status_ids)[0]
        user_id = fake.random_element(user_ids)[0]
        c.execute('INSERT INTO tasks (title, description, status_id, user_id) VALUES (?, ?, ?, ?)',
                  (title, description, status_id, user_id))


    conn.commit()
except sqlite3.Error as e:
    print(f"An error occurred: {e}")
    conn.rollback()
finally:

    conn.close()