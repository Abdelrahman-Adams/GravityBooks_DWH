USE gravity_books

-- Book Dimension
select
	b.book_id,
	b.title ,
	b.isbn13 ,
	bl.Language_name ,
	b.num_pages ,
	p.publisher_name ,
	a.author_name , 
	publication_date 
from book b
left join book_author bo
on b.book_id=bo.book_id
inner join author a
on bo.author_id=a.author_id
left join publisher p
on p.publisher_id = b.publisher_id
left join book_language bl
on bl.language_id =b.language_id
order by book_id


--Customer Dimension
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.email,
    address.street_number,
    address.street_name,
    address.city,
    country.country_name
FROM customer
	LEFT JOIN customer_address ON customer.customer_id = customer_address.customer_id
	LEFT JOIN address ON customer_address.address_id = address.address_id
	LEFT JOIN country ON address.country_id = country.country_id;


-- Order
WITH latest_order_history AS (
    SELECT 
        order_id,
        MAX(status_date) AS latest_date
    FROM order_history
    GROUP BY order_id
)

SELECT cu.order_id , format(cu.order_date,'yyyy-MM-dd 00:00:00.000') as order_date ,ol.line_id , ol.book_id, cu.customer_id , cu.shipping_method_id ,
        os.status_value , ol.price 
FROM cust_order cu
JOIN order_line ol ON cu.order_id = ol.order_id
JOIN latest_order_history loh ON cu.order_id = loh.order_id
join order_history oh on loh.latest_date = oh.status_date and oh.order_id = loh.order_id
JOIN order_status os ON oh.status_id = os.status_id





--Tests
USE Dwh_gravity_books
SELECT *
FROM book_dim

SELECT *
FROM book_dim
WHERE bookDim_SK = 6

update book_dim
set publisher_name = 'messi'
where book_id = 6


TRUNCATE TABLE book_dim

DROP TABLE book_dim