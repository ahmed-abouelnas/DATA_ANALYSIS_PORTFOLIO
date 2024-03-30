with hotels as (
select * from hotel2018
union
select * from hotel2019
union
select * from hotel2020)

select * from hotels
left join market_segments on hotels.market_segment = market_segments.market_segment
left join meal_cost on meal_cost.meal = hotels.meal

-- calculating the revenue for each hotel
select
arrival_date_year, hotel,
sum((stays_in_week_nights+stays_in_weekend_nights)*adr) as Revenue from hotels
group by arrival_date_year, hotel




