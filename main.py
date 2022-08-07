import psycopg2
import random
import datetime
import pandas as pd
import streamlit as st
import hashlib
from sqlalchemy import create_engine, text
from sqlalchemy.sql import func
import seaborn as sns
import matplotlib.pyplot as plt


c = create_engine("postgresql://postgres:password1@localhost:5432/car_rental_system")


def make_hashes(password):
    return hashlib.sha256(str.encode(password)).hexdigest()

def view_table(choice):
    data = """SELECT * FROM {};""""".format(choice)
    view=pd.read_sql_query(data,c)
    st.table(view)

def insert_function(query):
    c.execute(str(query))

def delete_function(query):
    c.execute(str(query))

def execute_query(query):
    #data=c.execute(str(query))
    view = pd.read_sql_query(query, c)
    st.table(view)
    #st.write(data.first())


def check_hashes(password, hashed_text):
    if make_hashes(password) == hashed_text:
        return True
    return False

def check(Username):
    try:
        data = c.execute('SELECT * FROM Login WHERE Username = (%s);', (Username))
        value = data.first()[-1]
        return value
    except Exception as e:
        pass



def main():
    """Simple Login App"""

    st.title("UI for Car Rental Database")
    menu = ["Home", "Login", "Interactive","Dashboard"]
    choice = st.sidebar.selectbox("Menu", menu)

    if choice == "Home":
        st.title("This project is done by:")
        st.title("Satwik Bhagvat")
        st.title("Shreevathsa BK")
        st.title("Sathwik Acharya")
        st.slider("Rate how much you liked this project", min_value=0 , max_value=10)


    elif choice == "Login":
        st.subheader("Enter your credentials in the menu on the left")
        username = st.sidebar.text_input("User Name")
        password = st.sidebar.text_input("Password", type='password')
        if st.sidebar.checkbox("Login"):
            if (username == "super_admin" and password=='SuperAdmin123'):
                st.success("Logged In as {}".format(username))
                task = st.selectbox("Task", ["View Data", "Insert Data", "Delete Data"])
                if task == "View Data":
                    choice=st.selectbox("Which table do you want to view",
                                   ['Login','Payment','Type','Chauffer','Customer','Vehicle','Booking'])
                    view_table(choice)
                elif task == "Insert Data":
                    st.header("Portal to insert data into the Database")
                    table = st.selectbox("Which table do you want to insert values into ?",
                                          ['Login', 'Payment', 'Type', 'Chauffer', 'Customer', 'Vehicle', 'Booking'])
                    st.subheader("Enter your query below in the input box to insert into the table as per your desire")
                    query=st.text_input('Enter here')
                    if(st.button("Submit your query")):
                        try:
                            insert_function(query)
                            st.success("The updated table is as follows:")
                            view_table(table)
                        except:
                            st.error("There is some error in your query. Contact creators for help")

                elif task == "Delete Data":
                    st.header("Portal to delete data into the Database")
                    table = st.selectbox("Which table do you want to delete values from ?",
                                         ['Login', 'Payment', 'Type', 'Chauffer', 'Customer', 'Vehicle', 'Booking'])
                    st.subheader("Enter your query below in the input box to delete the values from the table as per your desire")
                    query = st.text_input('Enter here')
                    if (st.button("Submit your query")):
                        try:
                            delete_function(query)
                            st.success("The updated table is as follows:")
                            view_table(table)
                        except:
                            st.error("There is some error in your query. Contact creators for help")

            elif(check(username)==password):
                LoginID = c.execute('SELECT Login_id FROM Login WHERE Username = (%s) and Password = (%s);', (username), (password))
                LoginID = LoginID.first()[0]
                customerID = c.execute('select customer_id from customer where login_id={};'.format(LoginID))
                customerID = int(customerID.first()[0])

                st.success("Logged In as {}".format(username))
                task = st.selectbox("Task", ["Show Bookings","Book"])

                if task == "Show Bookings":
                    data = """SELECT * FROM booking where customer_id={};""""".format(customerID)
                    view = pd.read_sql_query(data,c)
                    st.table(view)

                elif task == "Book":
                    with st.form("insert_form"):
                        st.write("Enter Booking Details")
                        Pickup = st.text_input(label="Enter Pickup")
                        Destination = st.text_input(label="Enter Destination")
                        typeID = st.text_input(label="Enter vehicle type")
                        submitted = st.form_submit_button("Submit")
                        
                        if submitted:
                            date = datetime.date.today()
                            # now = datetime.datetime.now()
                            # time = now.strftime("%H:%M:%S")
                            time = func.now()
                            
                            vehicle_id = c.execute("Select vehicle_id from vehicle where type_id={} limit 1 offset 0".format(typeID))
                            vehicle_id = int(vehicle_id.first()[0])
                            payment_id = c.execute("Select payment_id from payment limit 1 offset 0".format(typeID))
                            payment_id = int(payment_id.first()[0])
                            booking_id = random.randint(1000000,9000000)
                            query = text("insert into booking values({},{},{},{},{},{},{},{},{})".format(int(booking_id),str(Destination),str(Pickup),date,time,int(15),int(customerID),int(payment_id),int(vehicle_id)))
                            c.execute(query)
                            # insert_function(query)
            else:
                st.warning("Incorrect Username/Password")

    elif(choice=="Interactive"):
        st.subheader("This is the interactive area to execute complex queries.Do note that, despite lots of testing, there are a few cases which we might not be able to cover")
        query=st.text_area("Enter your queries in the text box below")
        if (st.button("Submit your query")):
            try:
                execute_query(query)
                st.success("Query was successfully executed")
            except Exception as e:
                st.exception(e)


    elif(choice=="Dashboard"):
        st.subheader("This presents a dynamic dashnoard of the database")
        dash='SELECT * from PAYMENT;'
        df=pd.read_sql_query(dash,c)
        try:
            fig=plt.bar(df['payment_id'],df['mode'])
            st.pyplot(fig=fig)
        except Exception as e:
            st.exception(e)



if __name__ == '__main__':
    main()
