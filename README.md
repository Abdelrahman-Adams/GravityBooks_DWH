
# Gravity_Books_DWH



## 🚀 About project:

This project is about **Extracting, Transforming, and Loading** data from an OLTP database to create a functional Data Warehouse. Conducted analysis and reporting using SSIS, SSAS, and Power bi.


## About DataBase

The data selected to be used is GravityBooks Database.
Gravity Books is a database for a fictional bookstore that captures information about books, customers, and sales. 

ERD of ‘gravity_books’ transactional database:


## 🖥️ ERD
![Alt Text](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/SSIS/1.ERD.png?raw=true)
### Tables Description:
- **book**: A list of all books available in the store.
- **book_author**: Stores the authors for each book, which is a many-to-many relationship.
- **author**: A list of all authors.
- **book_language**: A list of possible languages of books.
- **publisher**: A list of publishers for books.
- **customer**: A list of the customers of the Gravity Bookstore.
- **customer_address**: A list of addresses for customers, as a customer can have more than one address, and an address can belong to more than one customer.
- **address_status**: A list of statuses for an address, because addresses can be current or old.
- **address**: A list of addresses in the system.
- **country**: A list of countries that addresses are in.
- **cust_order**: A list of orders placed by customers.
- **order_line**: A list of books that are a part of each order.
- **shipping_method**: The possible shipping methods for an order.
- **order_history**: The history of an order, such as ordered, cancelled, delivered.
- **order_status**: The possible statuses of an order.


## Create Data Warehouse
![Alt text](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/SSIS/4.Star%20Schema.PNG?raw=true)

**Phase 1:** ETL using SSIS
The data was located on a traditional OLTP database which was normalized. We first created a database inside SQL Server for the data warehouse Then, We Write DDLs for the creation and joining of the data in **DWH**.

- We created star schema to show Fact table and Dimensions we ended having 4 Dimensions tables and 1 Fact table as shown below:
    - Book Dimension
    - Customer Dimension
    - Shipping_Method Dimension
    - Data Dimension
    - Fact table


## **Phase 2: ETL using SSIS**
### Using Slowly changing Dimension ###
### **Dimensions and Fact Table**:

#### **1. Book Dimension**
![Book Dimension](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/SSIS/3.2.Book_Dim.PNG?raw=true)

#### **2. Customer Dimension**
![Customer Dimension](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/SSIS/3.1.Customer_Dim.PNG?raw=true)

#### **3. Shipping_Method Dimension**
![Shipping_Method Dimension](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/SSIS/3.3.shipping_dimension.PNG?raw=true)

#### **4. Date Dimension**
![Date Dimension](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/SSIS/3.5.Date_dim.PNG?raw=true)
#### **5. Fact Table**
![Fact Table](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/SSIS/3.4.Fact_Table.PNG?raw=true)



## **Phase 3: Measures using SSAS**
### First we switched SSAS to tabular mode ###
### Then creating suitable measures using SSAS: ###
![Measured](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/SSAS/1.Measures.PNG?raw=true)

## **Phase 4: Creating Visualization using PowerBI**
    We have created a dashboard consisting of **4 pages** :
![Page 1](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/Visualization/1.First.PNG)
**Books Report:**

![Page 2](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/Visualization/Books.PNG)
**Customer Report:**

![Page 3](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/Visualization/Customers.PNG)
**Orders Report:**

![Page 4](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/Visualization/Orders.PNG)
**Shipping Report:**

![Page 5](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/Visualization/Shipping.PNG)
Finally, this is a tooltip to highlight the **main KPIs**:

![Page 6](https://github.com/Abdelrahman-Adams/GravityBooks_DWH/blob/main/Screenshots/Visualization/Tooltip.PNG)


