select u.name, case when r.distance then sum(r.distance) else 0 end as travelled_distance
from users u
left join rides r
on u.id=r.user_id
group by r.user_id
order by sum(r.distance) desc, name asc;
