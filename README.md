🏨 ITV Hotels Power BI Project – README
📌 Project Overview

This project analyzes hotel bookings and revenue data for ITV Hotels. The goal is to provide management with insights into:

Booking performance and occupancy.

Revenue generation vs realization.

Customer satisfaction (ratings).

Seasonality, platform performance, and cancellation behavior.

The project uses Power BI to transform raw booking and revenue data into interactive dashboards for decision-making.

📂 Data Sources

The project is built on the following datasets:

fact_bookings.csv → Detailed booking-level data

booking_id, booking_date, booking_platform, booking_status, check_in_date, checkout_date, guests, property_id, ratings_given, revenue_generated, revenue_realized, room_category.

fact_aggregated_bookings.csv → Daily property-level booking summary

property_id, check_in_date, room_category, successful_bookings, capacity.

dim_date.csv → Calendar dimension table.

dim_hotels.csv → Hotel property details.

dim_rooms.csv → Room category details.

📊 Dashboards
1️⃣ Bookings & Occupancy Dashboard

KPIs: Total Bookings, Successful Bookings, Cancellation %, Conversion %, Occupancy %, Avg Guests/Booking, Avg Rating.

Visuals: Bookings by City/Hotel/Platform/Room, Bookings Trend, Weekday vs Weekend split, Ratings breakdown.

2️⃣ Revenue & Profitability Dashboard

KPIs: Revenue Generated, Revenue Realized, Revenue Lost, Revenue Lost %, ADR (Average Daily Rate), RevPAR (Revenue per Available Room).

Visuals: Revenue by City/Hotel/Platform/Room, Generated vs Realized Comparison, Weekday vs Weekend Revenue, Revenue Lost Breakdown.

3️⃣ Trends & Seasonality Dashboard

KPIs: Avg Bookings per Day, Avg Revenue per Day.

Visuals: Monthly & Weekly trends, Rolling Averages (7-day / 30-day), Seasonal patterns, Cancellation % trend, Revenue vs Bookings dual-axis chart.

4️⃣ Executive Overview Dashboard

High-level summary for leadership.

KPIs: Bookings, Occupancy, Revenue, Lost Revenue %, Ratings.

Visuals: Bookings vs Revenue Trend, Platform Share, Top 5 Hotels by Revenue, Ratings Distribution.

📈 Key Insights

Cancellations significantly impact revenue → certain platforms have higher cancellation %.

Occupancy % varies by city and property, showing operational inefficiencies.

Luxury room categories drive higher ADR but often with higher cancellations.

Revenue Lost % highlights leakage between generated and realized revenue.

Customer Ratings correlate with revenue in some locations → improving guest experience may boost earnings.

⚙️ Tools & Techniques

Power BI Desktop for data modeling & report building.

DAX Measures for KPIs (Occupancy %, ADR, RevPAR, Conversion %, Cancellation %, Revenue Lost %).

Power Query for data cleaning and shaping.

Star Schema data model for efficient reporting.

Row-Level Security (RLS) can be implemented for property-wise access.

🚀 Outcome

This project provides end-to-end hotel performance monitoring:

Helps management track bookings, cancellations, and occupancy.

Provides financial performance insights with revenue leakage analysis.

Adds customer perspective with ratings distribution.

Enables data-driven strategy for improving occupancy, reducing cancellations, and increasing profitability.
