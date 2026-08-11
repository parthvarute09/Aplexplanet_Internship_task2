select * from cleaned_dataset;

select Product, round(sum(Total_Sales),2) as  Sum_total_sales
from cleaned_dataset
group by Product 
order by Sum_total_sales desc;

select Product, round(sum(Total_Sales),2) as  Sum_total_sales
from cleaned_dataset
where Order_Date >= DATE_SUB((select max(Order_Date) from cleaned_dataset), Interval 6 Month)
group by Product 
order by Sum_total_sales desc;

select Customer_ID, min(Order_Date) as First_Order_Date
from cleaned_dataset
group by Customer_ID;

SELECT
    DATE_FORMAT(First_Order_Date, '%Y-%m') AS Month,
    COUNT(Customer_ID) AS New_Users
FROM (
    SELECT
        Customer_ID,
        MIN(Order_Date) AS First_Order_Date
    FROM cleaned_dataset
    GROUP BY Customer_ID
) AS first_orders
GROUP BY DATE_FORMAT(First_Order_Date, '%Y-%m')
ORDER BY Month;

select Category, round(sum(Total_Sales),2) as Revenue
from cleaned_dataset
group by Category
order by Revenue desc;

select Customer_Name, sum(Total_Sales) as Total_Spend, count(Order_ID) as Orders
from cleaned_dataset
group by Customer_ID, Customer_Name
order by Total_Spend desc
limit 10;

select City, round(sum(Total_Sales),2) as Sales
from cleaned_dataset
group by City
order by Sales desc;

select count(*) as Repeat_customers
from(
	select Customer_ID from cleaned_dataset
    group by Customer_ID, Customer_Name having count(*) > 1
);

select gender, round(sum(Total_Sales),2) as Revenue, count(*) as Orders
from cleaned_dataset
group by gender
    

    
    


