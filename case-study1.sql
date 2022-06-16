select * from sales1;
select * from menu;

1. What is the total amount each customer spent at the restaurant?

select t1.customer_id,sum(price) from 
(select s.customer_id,s.product_id,m.price
from sales1 s
join menu m
on s.product_id=m.product_id) t1
group by t1.customer_id;


2. How many days has each customer visited the restaurant?

select customer_id,count(distinct(order_date))
from sales1
group by customer_id;

3. What was the first item from the menu purchased by each customer?

select t2.customer_id,t2.product_name from
(select *,dense_rank() over(partition by t1.customer_id order by t1.order_date) as dr
from
(select s.order_date,s.customer_id,s.product_id,m.product_name
from sales1 s 
join menu m 
on s.product_id=m.product_id) t1) t2
where t2.dr=1
group by t2.customer_id,t2.product_name;

4. What is the most purchased item on the menu and how many times was it purchased by all customers?

  select product_id,count(product_id)
  from sales1
  group by 1;
  
  clearly, product having id 3 i.e ramen was the most purchased item.
  
5. Which item was the most popular for each customer?
   select t1.customer_id,t1.product_name,count(t1.product_name) as number_of_products
   from
   (select s.customer_id,s.product_id,m.product_name
   from sales1 s
   join menu m 
   on s.product_id=m.product_id) t1
  group by 1,2
  order by t1.customer_id;
  
  clearly, Ramen was the most poplular for A and C whereas B liked all three.
  
6. Which item was purchased first by the customer after they became a member?

 select t3.customer_id,t3.product_name,t3.order_date,t3.join_date
 from
 (select t2.customer_id,t2.product_name,t2.order_date,t2.join_date,dense_rank() over(partition by customer_id order by order_date) as dr
 from
 (select * from 
 (select s.customer_id,m1.product_name,s.product_id,s.order_date,m.join_date
 from sales1 s
 join members2 m
 on s.customer_id=m.customer_id
 join menu m1
 on s.product_id=m1.product_id) t1
 where datediff(order_date,join_date)>0 ) t2 ) t3
 where t3.dr=1;
  
7. Which item was purchased just before the customer became a member?

select t3.customer_id,t3.product_name,t3.order_date,t3.join_date from
(select t2.customer_id,t2.product_name,t2.order_date,t2.join_date,dense_rank() over(partition by customer_id order by order_date desc) as dr
 from
(select * from 
 (select s.customer_id,m1.product_name,s.product_id,s.order_date,m.join_date
 from sales1 s
 join members2 m
 on s.customer_id=m.customer_id
 join menu m1
 on s.product_id=m1.product_id) t1
 where datediff(order_date,join_date)<0) t2) t3
 where t3.dr=1;
 
8. What is the total items and amount spent for each member before they became a member?

select t2.customer_id,count(t2.product_name) as total_items,sum(price) as total_spent
from
(select * from(
select s.customer_id,m1.product_name,m1.price,s.order_date,m.join_date
 from sales1 s
 join members2 m
 on s.customer_id=m.customer_id
 join menu m1
 on s.product_id=m1.product_id) t1
 where datediff(order_date,join_date)<0) t2
 group by t2.customer_id;
 
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
select t2.customer_id,sum(t2.points) 
from
(select t1.customer_id,
case when t1.product_name='ramen' then price*10
     when t1.product_name='curry' then price*10
     else price*20
     end as points
from
(select s.customer_id,m.product_name,m.price from sales1 s
join menu m
on s.product_id=m.product_id) t1) t2
group by 1;

10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items,
 not just sushi - how many points do customer A and B have at the end of January?
 

 select t2.customer_id,sum(t2.individual_points) as final_points from
 (select t1.customer_id, t1.price*t1.points as individual_points from
 (select s.customer_id,m1.product_name,m1.price,s.order_date,m.join_date,
 case when s.order_date-m.join_date<0 then 10
      when s.order_date<(m.join_date+6) then 20
      when s.order_date>(m.join_date+6) and m1.product_name in ('ramen','curry') then 10
      else 20 end as points
 from sales1 s
 join members2 m
 on s.customer_id=m.customer_id
 join menu m1
 on s.product_id=m1.product_id
 where substr(s.order_date,6,2)='01') t1) t2
 group by t2.customer_id;
 
 

 
