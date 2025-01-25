
# Gravity_Books_DWH



## 🚀 About project

This project is about **Extracting, Transforming, and Loading** data from an OLTP database to create a functional Data Warehouse. Conducted analysis and reporting using SSIS, SSAS, and Power bi.


## About Database

The data selected to be used is GravityBooks Database.
Gravity Books is a database for a fictional bookstore that captures information about books, customers, and sales. 

ERD of ‘gravity_books’ transactional database:

## 🖥️ ERD
![Alt Text](https://drive.google.com/uc?export=view&id=1qG9Zkr3NhfYB1FpOm4g9Le68JfCk09cM)
![Alt Text](https://drive.google.com/uc?export=view&id=1j5U7guWBxWCfKftZrJ5CGO7FjiYlo3-J)

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



