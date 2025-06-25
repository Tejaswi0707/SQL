with cte as
(SELECT user_id, ROUND(SUM(CASE WHEN action="confirmed" THEN 1 ELSE 0 END)/COUNT(*),2) as confirmation_rate
from Confirmations
group by user_id)

SELECT s.user_id, IFNULL(c.confirmation_rate,0) AS confirmation_rate
from Signups s left join cte c
on s.user_id=c.user_id
