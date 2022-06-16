# Data-Analysis-through-SQL
This is a case study based mini project which uses a restaurant's data to gain insights of the customers' visiting patterns, their most liked dishes, monthly visits etc. 


<h1>Case Study 1: Danny's Dinner</h1> 

![127727503-9d9e7a25-93cb-4f95-8bd0-20b87cb4b459](https://user-images.githubusercontent.com/100195347/174039639-31b7991d-53b0-4cb7-b7c4-2048915578c8.png)

<h1 align="center">Introduction:<br></h1>
Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen.

Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.


<h1 align="center">Problem Statement:<br> </h1>
Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.

He plans on using these insights to help him decide whether he should expand the existing customer loyalty program - additionally he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.

Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!

Danny has shared with you 3 key datasets for this case study:

1.sales<br>
2.menu<br>
3.members<br>

<h1 align="center"> Entity Relationship Diagram </h1>

![127271130-dca9aedd-4ca9-4ed8-b6ec-1e1920dca4a8](https://user-images.githubusercontent.com/100195347/174040741-9fe55443-b18e-489b-a075-87a84e62d79b.png)

<h2>Table 1: Sales<br></h2>
The sales table captures all customer_id level purchases with an corresponding order_date and product_id information for when and what menu items were ordered.

![Screenshot 2022-06-16 150741](https://user-images.githubusercontent.com/100195347/174041590-d915a12f-17fd-4a04-a768-10934fd23d82.jpg)

<h2>Table 2: Menu<br></h2>
The menu table maps the product_id to the actual product_name and price of each menu item.

![Screenshot 2022-06-16 150912](https://user-images.githubusercontent.com/100195347/174041854-b0bad0ad-e8f8-42c9-91b6-2c80713ebb90.jpg)

<h2>Table 3: Members<br></h2>
The final members table captures the join_date when a customer_id joined the beta version of the Danny’s Diner loyalty program.

![Screenshot 2022-06-16 151112](https://user-images.githubusercontent.com/100195347/174042275-9a74c6b0-85ef-4243-a5fc-8b3ebb053502.jpg)


<h2> Case Study Questions </h2>
1.What is the total amount each customer spent at the restaurant?<br>
2.How many days has each customer visited the restaurant?<br>
3.What was the first item from the menu purchased by each customer?<br>
4.What is the most purchased item on the menu and how many times was it purchased by all customers?<br>
5.Which item was the most popular for each customer?<br>
6.Which item was purchased first by the customer after they became a member?<br>
7.Which item was purchased just before the customer became a member?<br>
8.What is the total items and amount spent for each member before they became a member?<br>
9.If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?<br>
10.In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?





