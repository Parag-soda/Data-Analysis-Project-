# 1) How many total complaints are in the dataset?
create view Total_complaints as 
select count(complaint_id) 
as `Total complaints` from complaints;

#2)What are the complaint submission channels?
select distinct submitted_via 
as `channel` from complaints;

# 3)What is the trend of complaints year-wise?
select Year_submitted, count(*) 
as Total_complaints from complaints 
group by Year_submitted;

# 4) Month wise Complaints
select distinct Month_submitted,
count(complaint_id) as Total_complaints 
from complaints group by Month_submitted
order by Month_submitted;

#5 ) In which months do complaints spike the most?
select monthname(date_submitted) as Month,
count(*)as Total_complaints from complaints 
group by monthname(date_submitted)
order by count(*) desc limit 5;

# 6) States with Most Complaints
select state, count(complaint_id) 
as `Total Complaints` 
from complaints group by state 
order by count(complaint_id) desc limit 7;

# 7) Product Wise Complaints 
select product, count(complaint_id) 
as Total_complaints 
from complaints group by product 
order by count(complaint_id)desc ;

# 8) Sub-Products with Most Complaints
select product, sub_product, count(complaint_id) 
as `Total Complaints`from complaints 
group by product,sub_product 
order by `Total complaints` desc limit 10;

# 9) Top 3 Issues for Top Product
select product,issue, 
count(*) as `Total Complaints`
from complaints where 
product='Checking or savings account'
group by product,issue 
order by `Total Complaints` desc limit 3;

# 10) Top Sub-Issues for Product
select product,sub_issue, count(sub_issue)
as `total sub issue` from complaints 
group by product, sub_issue
 order by `total sub issue` desc limit 5;
 
# 11) Public Company Responses  
select distinct company_public_response,
count(*) as Total from complaints 
group by company_public_response;

# 12) Complaint Resolution Types
select distinct company_response_to_consumer, 
count(*) as total from complaints 
group by company_response_to_consumer;

# 13) What are the most common complaint issues?
select issue , count(complaint_id)
as `Total complaints`
from complaints group by issue
order by `total complaints` desc limit 5;

# 14) Timeliness of Responses
select timely_response,
count(*) as `Total Complaints` 
from complaints 
group by timely_response;

# 15) Timely response percentage
select timely_response, 
round(count(*)/(select count(*) from complaints)*100,2) 
as percentage from complaints
group by timely_response;

# 16) top 5 months when most complaints were received
select Year_submitted, Month_submitted, 
count(complaint_id) as`Total Complaints`
from complaints group by  Year_submitted, 
Month_submitted order by count(complaint_id) 
desc limit 5;

# 17) Quarterly Complaint Distribution
select  quarter(date_submitted)as Quarter,
count(complaint_id) as `Total complaints` 
from complaints group by quarter(date_submitted);

# 18) Top Submission Channels
select submitted_via,count(complaint_id) 
as total_complaints from complaints 
group by submitted_via 
order by count(complaint_id) desc ;

# 19) List all  products consumers have complained about.
select distinct product from complaints;

# 20) product wise timely response
select product,timely_response,
count(*)as total from complaints 
group by product,timely_response 
order by product;

# 21) Top 5 Issues 
select issue, count(complaint_id) 
as `total Complaints`
from complaints group by  issue 
order by `total complaints` desc limit 5;

# 22) How many states have reported complaints?
select count(distinct state) 
as `No of states` from complaints;

# 23) Year-wise State Complaint Distribution
select Year_submitted,state, count(complaint_id) 
from complaints group by Year_submitted,state 
order by count(complaint_id) desc;

# 24) States with Most Untimely Responses
select state, count(complaint_id) from complaints 
where timely_response = "no" group by state 
order by count(complaint_id) desc;

# 25) States with Most timely Responses
select state,count(*) from complaints where timely_response='yes' group by state order by count(*)desc;

# 26) Top Sub-Issues for Major Issues
select sub_issue, count(complaint_id) 
as `Total Complaints`from complaints where issue='Managing an account'
group by sub_issue order by `Total complaints`
desc limit 10;

# 27)	Issues Closed Without Relief
select company_response_to_consumer, 
count(complaint_id) from complaints 
where company_response_to_consumer not in 
( "closed with monetary relief")
group by company_response_to_consumer;
	
# 28) Untimely Responses by Product
select product,issue, count(*) as Total 
from complaints
where timely_response = "No"
group by product, issue order by total desc;

# 29) Issues with Frequent Untimely Responses
select issue, count(*) from complaints 
where timely_response= "no" group by issue 
order by count(*) desc; 

# 30) What is the average daily complaints per month?
select Month_submitted, 
round(count(*)/count(distinct date(date_received)),2)
as `Avg Complaints per day` 
from complaints group by Month_submitted;

# 31) How does the response type vary by state or year?
SELECT state, company_response_to_consumer AS resolution_type,
COUNT(*) AS count FROM complaints
GROUP BY state, resolution_type
ORDER BY state, count DESC;

# 32) Are there any states where a particular issue dominates the complaints?
SELECT state,issue, COUNT(*) AS complaint_count
FROM complaints GROUP BY state, issue
ORDER BY complaint_count DESC limit 5;   

 # 33)Are untimely responses more frequent for specific product types or issues?
select issue, count(*)as `total complaints`
from complaints where `timely_response`= 'no' 
group by issue order by count(*) desc limit 10;

#34) How does resolution type vary across complaint categories?
select product,company_response_to_consumer,
count(*) as Total from complaints 
group by product,company_response_to_consumer 
order by product;

# 34)What is the earliest and latest complaint date?
select min(date_submitted) as `Earliest date`,
max(date_received)as `Latest date` from complaints;

# 35) What is the average delay between complaint submission and receipt?
select  round(avg(datediff(date_received,date_submitted)),2) as months from complaints;

# 36)How many complaints were submitted in each month for each year?
select year_submitted, month_submitted, 
count(*) as `total complaints` 
from complaints 
group by Year_submitted,Month_submitted;

# 37) submission channel percentage
select submitted_via, 
round(count(*)/(select count(*) from complaints)*100, 2) 
as Percentage from complaints 
group by submitted_via;

# 38) Which submission channel has the highest timely response rate?
select submitted_via, 
round(count(*)/(select count(*) from complaints )*100,2) 
as `Total share` from complaints 
where timely_response="yes" 
group by submitted_via;
