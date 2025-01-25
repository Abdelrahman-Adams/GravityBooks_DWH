USE Dwh_gravity_books;


-- book_dim
BEGIN TRY
	DROP TABLE book_dim
END TRY
BEGIN CATCH
	--Nothing
END CATCH

CREATE TABLE book_dim (
	bookDim_SK INT PRIMARY KEY IDENTITY(1,1),
	book_id INT,
	title VARCHAR(400),
	isbn13 VARCHAR(13),
	language_name VARCHAR(50),
	publisher_name VARCHAR(400),
	author_name VARCHAR(400),
	publication_date DATE,
	number_of_pages INT,                 
    start_date DATETIME,
    end_date DATETIME,
    is_current BIT NOT NULL DEFAULT (1)
	);

-- Customer_DIM

BEGIN TRY
	DROP TABLE Customer_DIM
END TRY
BEGIN CATCH
	--Nothing
END CATCH

CREATE TABLE Customer_DIM (
    Custom_SK INT PRIMARY KEY IDENTITY(1,1),
    Customer_Bk INT,
    first_name VARCHAR(200),
    last_name VARCHAR(200),
    email VARCHAR(350),
    Street_name VARCHAR(200),
    street_number VARCHAR(10),
    City VARCHAR(100),
    Country VARCHAR(200),
    start_date DATETIME,
    end_date DATETIME,
    is_current BIT
);


-- Shipping_Dim

BEGIN TRY
	DROP TABLE Shipping_Dim
END TRY
BEGIN CATCH
	--Nothing
END CATCH

CREATE TABLE Shipping_Dim (
	shippDim_SK INT PRIMARY KEY IDENTITY(1,1),
	method_id INT,
	method_name VARCHAR(100),
	status_value VARCHAR(20),
	status_date DATETIME,
	order_date DATETIME,
	start_date DATETIME,
    end_date DATETIME,
    is_current BIT

);



BEGIN TRY
	DROP TABLE FactTable 
END TRY
BEGIN CATCH
	--Nothing
END CATCH

CREATE TABLE FactTable (
	Fact_SK INT PRIMARY KEY IDENTITY(1,1),
	bookDim_SK_FK INT NOT NULL,
	Custom_SK_FK INT NOT NULL,
	shippDim_SK_FK INT NOT NULL,
	DateSK_FK INT NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	Shipping_cost DECIMAL(10, 2) NOT NULL,
	order_id INT NOT NULL

	CONSTRAINT fk_bookDim FOREIGN KEY (bookDim_SK_FK) REFERENCES book_dim (bookDim_SK),
    CONSTRAINT fk_Custdim FOREIGN KEY (Custom_SK_FK) REFERENCES Customer_DIM (Custom_SK),
    CONSTRAINT fk_shippDim FOREIGN KEY (shippDim_SK_FK) REFERENCES Shipping_Dim (shippDim_SK),
    CONSTRAINT fk_DateSK FOREIGN KEY (DateSK_Fk) REFERENCES DimDate (DateSK)
);

