select Users.user_id as buyer_id,Users.join_date,count(Orders.buyer_id) as orders_in_2019
from Users
left Join Orders on Users.user_id = Orders.buyer_id
and Orders.order_date like '2019%'
group by users.user_id;
